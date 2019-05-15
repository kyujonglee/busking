package kr.co.buskers.main.qna.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public void deleteComment(int no) {
		mapper.deleteComment(no);
	}

	public void update(QnaBoard qnaBoard) {
		mapper.updateBoard(qnaBoard);
	}

	public QnaBoard updateForm(int no) {
		return mapper.selectBoardByNo(no);
	}

	public Map<String,Object> likeStatusUpdate(QnaBoard qnaBoard,int boardType,String likeKind) {
		Like like = new Like();
		like.setBoardNo(qnaBoard.getBoardNo());
		like.setMemberNo(qnaBoard.getMemberNo());
		like.setBoardType(boardType);
		System.out.println(qnaBoard.getBoardNo());
		System.out.println(qnaBoard.getMemberNo());
		System.out.println(boardType);
		char status = mapper.selectLike(like).getLikeStatus();
		Map<String,Object> result = new HashMap<>();
		//게시판 좋아요 관련 
		if(boardType==3) {
			//현재 상태
			if(status=='y') {
				like.setLikeStatus('n');
				mapper.updateLike(like);
				mapper.updateLikeQnaBoardMinus(qnaBoard);
			}else if(status=='n') {
				like.setLikeStatus('y');
				mapper.updateLike(like);
				mapper.updateLikeQnaBoardPlus(qnaBoard);
			}
			result.put("likeStatus",like.getLikeStatus());
			result.put("likeCnt",qnaBoard.getLikeCnt());

			//댓글 좋아요 관련
		}else {
			//누른것이 좋아요   //qnaBoard 넘버는 CommentNo로 생각해야함. ajax 부분에 코멘트 부분을 찾아서 업데이트 시키기위해 번호를 넘겨줘야함.
			result.put("commentNo", qnaBoard.getBoardNo());
			if(likeKind.equals("y")) {
				QnaBoardComment qnaBoardComment = new QnaBoardComment();
				qnaBoardComment.setCommentNo(qnaBoard.getBoardNo());
				if(status=='y') {
					like.setLikeStatus('n');
					mapper.updateLike(like);
					mapper.updateLikeQnaBoardCommentMinus(qnaBoardComment);
					System.out.println("좋아요업데이트함 -");
				}else if(status=='n') {
					like.setLikeStatus('y');
					mapper.updateLike(like);
					mapper.updateLikeQnaBoardCommentPlus(qnaBoardComment);
					System.out.println("좋아요업데이트함 +");
				}
				result.put("likeStatus",like.getLikeStatus());
				result.put("likeCnt",qnaBoardComment.getLikeCnt());

			//누른것이 싫어요
			}else {
				if(likeKind.equals("n")) {
					char disLikeStatus = mapper.selectLike(like).getDislikeStatus();
					System.out.println("실요상태"+disLikeStatus);
					QnaBoardComment qnaBoardComment = new QnaBoardComment();
					qnaBoardComment.setCommentNo(qnaBoard.getBoardNo());
					if(disLikeStatus=='y') {
						like.setDislikeStatus('n');
						mapper.updateDisLike(like);
						mapper.updateDisLikeQnaBoardCommentMinus(qnaBoardComment);
						System.out.println("싫어요업데이트함 -");
					}else if(disLikeStatus=='n') {
						like.setDislikeStatus('y');;
						mapper.updateDisLike(like);
						mapper.updateDisLikeQnaBoardCommentPlus(qnaBoardComment);
						System.out.println("싫어요업데이트함 +");
					}
					result.put("likeStatus",like.getLikeStatus());
					result.put("disLikeCnt",qnaBoardComment.getDisLikeCnt());
				}
			}
		}
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
		Like like = new Like();
		like.setBoardNo(qnaBoardComment.getCommentNo());
		like.setMemberNo(qnaBoardComment.getMemberNo());
		like.setBoardType(4);
		mapper.insertLike(like);
	}
	
	///////////////파일업로드
//	public String fileUpload(MultipartFile file) {
		
//	};

}
