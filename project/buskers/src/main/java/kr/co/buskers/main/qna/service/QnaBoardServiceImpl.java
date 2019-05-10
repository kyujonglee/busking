package kr.co.buskers.main.qna.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.common.page.FreePageResult;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Like;
import kr.co.buskers.repository.domain.QnaBoard;
import kr.co.buskers.repository.domain.QnaBoardComment;
import kr.co.buskers.repository.mapper.QnaBoardMapper;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	private QnaBoardMapper mapper;
	
	public void write(QnaBoard qnaBoard) {
		mapper.insertBoard(qnaBoard);
//		System.out.println("insert된no값"+qnaBoard.getBoardNo());
		Like like = new Like();
		like.setBoardNo(qnaBoard.getBoardNo());
		like.setMemberNo(qnaBoard.getMemberNo());
		like.setBoardType(3);
		mapper.insertLike(like);
	}
	
	public Map<String, Object> list(FreePage freePage) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchType", freePage.getSearchType());
		map.put("input", freePage.getInput());
		map.put("sortType", freePage.getSortType());
		map.put("list", mapper.selectBoard(freePage));
		System.out.println(mapper.selectBoard(freePage).size());
		map.put("pageResult", new FreePageResult(freePage.getPageNo(), mapper.selectBoardCount(freePage)));
		return map;
	}
	

	public Map<String, Object> sortList(FreePage freePage) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchType", freePage.getSearchType());
		map.put("input", freePage.getInput());
		map.put("sortType", freePage.getSortType());
		map.put("list", mapper.selectBoard(freePage));
		map.put("pageResult", new FreePageResult(freePage.getPageNo(), mapper.selectBoardCount(freePage)));
		return map;
	}
	
	
	
	
	
	public QnaBoard detail(int no) { 
		return mapper.selectBoardByNo(no);
	}
	public void updateViewCnt(int no) {
		mapper.updateViewCnt(no);
	}

	public void delete(int no) {
		mapper.deleteLike(no);
		mapper.deleteBoard(no);
		
	}

	public void update(QnaBoard qnaBoard) {
		mapper.updateBoard(qnaBoard);
	}

	public QnaBoard updateForm(int no) {
		return mapper.selectBoardByNo(no);
	}

	public Map<String,Object> likeStatusUpdate(QnaBoard qnaBoard) {
		Like like = new Like();
		like.setBoardNo(qnaBoard.getBoardNo());
		like.setMemberNo(qnaBoard.getMemberNo());
		like.setBoardType(3);
		//현재 상태
		char status = mapper.selectLike(like).getLikeStatus();
//		System.out.println("현재상태는"+status);
		if(status=='y') {
			like.setLikeStatus('n');
			mapper.updateLike(like);
			mapper.updateLikeQnaBoardMinus(qnaBoard);
		}else if(status=='n') {
			like.setLikeStatus('y');
			mapper.updateLike(like);
			mapper.updateLikeQnaBoardPlus(qnaBoard);
		}
//		System.out.println("update이후 좋아요 개수는"+qnaBoard.getLikeCnt());
		Map<String,Object> result = new HashMap<>();
		result.put("likeStatus",like.getLikeStatus());
		result.put("likeCnt",qnaBoard.getLikeCnt());
		return result;
		
	}
	
	
	public List<QnaBoardComment> commentList(int no){
		return mapper.selectComment(no);
	}
	public List<QnaBoardComment> commentReplyList(int no) {
		return mapper.selectCommentReply(no);
	}

	public void writeComment(QnaBoardComment qnaBoardComment) {
		mapper.insertComment(qnaBoardComment);
	}

}
