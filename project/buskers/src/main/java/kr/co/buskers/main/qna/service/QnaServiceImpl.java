package kr.co.buskers.main.qna.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.common.page.FreePageResult;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Like;
import kr.co.buskers.repository.domain.Member;
import kr.co.buskers.repository.domain.QnaBoard;
import kr.co.buskers.repository.domain.QnaBoardComment;
import kr.co.buskers.repository.mapper.QnaBoardMapper;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaBoardMapper mapper;
	
	public Map<String, Object> list(FreePage freePage) {
		Map<String, Object> map = new HashMap<>();

//		System.out.println("검색 타입 : " + freePage.getSearchType());
//		System.out.println("검색어 : " + freePage.getInput());
		map.put("searchType", freePage.getSearchType());
		map.put("input", freePage.getInput());
		map.put("sortType", freePage.getSortType());
		map.put("list", mapper.selectBoard(freePage));
		map.put("pageResult", new FreePageResult(freePage.getPageNo(), mapper.selectBoardCount(freePage)));
		return map;
	}	
	
	public Map<String, Object> detail(int boardNo, HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();
		
		if (session.getAttribute("user") != null) {
			Like like = new Like();
			Member member = (Member)session.getAttribute("user");
			like.setMemberNo(member.getMemberNo());
			like.setBoardNo(boardNo);
			map.put("like", mapper.selectBoardIsLike(like));
			if (mapper.selectBoardIsLike(like) == null) {
				mapper.insertLikeStatus(like);
			}
			
		}
		
		
		mapper.updateBoardViewCount(boardNo);
		System.out.println("try실행");
		try {
			map.put("highestLikeComment", mapper.selectLikeHighestComment(boardNo));
			
		}catch(Exception e) {
		}
		
		if (mapper.selectGroupNo(boardNo) != null  ) {
			map.put("file", mapper.selectFile(mapper.selectGroupNo(boardNo).getGroupNo()));
		}
		
		
		map.put("reply", mapper.selectReplyList(boardNo));
		map.put("comment", mapper.selectCommentList(boardNo));
		map.put("board", mapper.selectBoardByNo(boardNo));
	
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
	
	public Map<String, Object> insertComment(QnaBoardComment qnaBoardComment) {
		Map<String, Object> map = new HashMap<>();
		
		mapper.insertComment(qnaBoardComment);
		map.put("comment", mapper.selectCommentList(qnaBoardComment.getBoardNo()));
		map.put("reply", mapper.selectReplyList(qnaBoardComment.getBoardNo()));
		
		return map;
	}
	
	public Map<String, Object> insertReply(QnaBoardComment qnaBoardComment) {
		
		Map<String, Object> map = new HashMap<>();
		
		mapper.insertReply(qnaBoardComment);
		map.put("comment", mapper.selectCommentList(qnaBoardComment.getBoardNo()));
		map.put("reply", mapper.selectReplyList(qnaBoardComment.getBoardNo()));
		
		return map;
	}
	
	public Map<String, Object> updateComment(QnaBoardComment qnaBoardComment) {
		
		Map<String, Object> map = new HashMap<>();
		
		mapper.updateComment(qnaBoardComment);
		map.put("comment", mapper.selectCommentList(qnaBoardComment.getBoardNo()));
		map.put("reply", mapper.selectReplyList(qnaBoardComment.getBoardNo()));
		
		return map;
	}
	
	public Map<String, Object> listIsLikedComment(int memberNo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("isLikedComment", mapper.selectCommentIsLiked(memberNo));
		
		return map;
	}
	
	public Map<String, Object> listIsDislikedComment(int memberNo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("isDislikedComment", mapper.selectCommentIsDisliked(memberNo));
		
		return map;
	}
	
	public Map<String, Object> updateForm(int boardNo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("board", mapper.selectBoardByNo(boardNo));
		return map;
	}
	
	public void write(QnaBoard qnaBoard) {
		System.out.println("보드넘버 : " + qnaBoard.getBoardNo());
		if (qnaBoard.getGroupNo() == 0) {
			mapper.insertBoard(qnaBoard);
		} else {
			mapper.insertBoardFile(qnaBoard);
		}
	}
	
	public void deleteComment(int commentNo) {
		
		if (mapper.selectCommentHasReply(commentNo) == 0) {
			mapper.deleteComment(commentNo);
		} else {
			mapper.updateDeleteComment(commentNo);
		}
	}
	
	public void update(QnaBoard qnaBoard) {
		
		mapper.updateBoard(qnaBoard);
	}
	
	public void delete(QnaBoard qnaBoard) {
		
		mapper.deleteBoard(qnaBoard);
	}
	
	public int updateLikeStatus(Like like) {
		System.out.println("좋아요 상태 : " + like.getLikeStatus());
		
		mapper.updateLikeStatus(like);
		if (like.getLikeStatus() == 'y') {
			mapper.updateAddLike(like.getBoardNo());
		} else {
			mapper.updateRemoveLike(like.getBoardNo());
		}
		
		return mapper.selectBoardLikeCount(like.getBoardNo());
	}
	
	public Map<String, String> insertCommentLike(Like like) {
		Map<String, String> map = new HashMap<>();
		
		if (mapper.selectCommentLike(like) == null) {
			mapper.insertCommentLike(like);
			mapper.updateCommentLikePlus(like.getBoardNo());
			map.put("likeCount", "1");
		} else {
			if (mapper.selectCommentLike(like).getLikeStatus() == 'n') {
				mapper.updateCommentLikePlus(like.getBoardNo());
				mapper.updateCommentLikeStatusY(like.getBoardNo());
				map.put("likeCount", String.valueOf(mapper.selectCommentLikeCount(like.getBoardNo())));
				map.put("likeStatus", String.valueOf(mapper.selectCommentLike(like).getLikeStatus()));
				
				return map;
				
			} else {
				mapper.updateCommentLikeMinus(like.getBoardNo());
				mapper.updateCommentLikeStatusN(like.getBoardNo());
				map.put("likeCount", String.valueOf(mapper.selectCommentLikeCount(like.getBoardNo())));
				map.put("likeStatus", String.valueOf(mapper.selectCommentLike(like).getLikeStatus()));
				
				return map;
			}
		}
		return map;
	}
	
	public Map<String, String> insertCommentDislike(Like like) {
		Map<String, String> map = new HashMap<>();
		
		if (mapper.selectCommentDislike(like) == null) {
			mapper.insertCommentDislike(like);
			mapper.updateCommentDislikePlus(like.getBoardNo());
			map.put("dislikeCount", "1");
		} else {
			if (mapper.selectCommentDislike(like).getDislikeStatus() == 'n') {
				mapper.updateCommentDislikePlus(like.getBoardNo());
				mapper.updateCommentDislikeStatusY(like.getBoardNo());
				map.put("dislikeCount", String.valueOf(mapper.selectCommentDislikeCount(like.getBoardNo())));
				map.put("dislikeStatus", String.valueOf(mapper.selectCommentDislike(like).getDislikeStatus()));
				
				return map;
				
			} else {
				mapper.updateCommentDislikeMinus(like.getBoardNo());
				mapper.updateCommentDislikeStatusN(like.getBoardNo());
				map.put("dislikeCount", String.valueOf(mapper.selectCommentDislikeCount(like.getBoardNo())));
				map.put("dislikeStatus", String.valueOf(mapper.selectCommentDislike(like).getDislikeStatus()));
				
				return map;
			}
		}
		return map;
	}
	
}
