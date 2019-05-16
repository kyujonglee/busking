package kr.co.buskers.repository.mapper;


import java.util.List;

import kr.co.buskers.repository.domain.FreeBoard;
import kr.co.buskers.repository.domain.FreeBoardComment;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Like;

public interface FreeBoardMapper {
	List<FreeBoard> selectBoard(FreePage freePage);
	int selectBoardCount(FreePage freePage);
	List<FreeBoard> selectNoticeBoard();
	FreeBoard selectBoardByNo(int boardNo);
	void updateBoardViewCount(int boardNo);
	void insertBoard(FreeBoard freeBoard);
	List<FreeBoardComment> selectCommentList(int boardNo);
	List<FreeBoardComment> selectReplyList(int boardNo);
	void insertComment(FreeBoardComment freeBoardComment);
	Like selectBoardIsLike(Like like);
	void updateLikeStatus(Like like);
	void insertLikeStatus(Like like);
	void updateAddLike(int boardNo);
	void updateRemoveLike(int boardNo);
	int selectBoardLikeCount(int boardNo);
	void insertReply(FreeBoardComment freeBoardComment);
	void updateDeleteComment(int commentNo);
	void deleteComment(int commentNo);
	int selectCommentHasReply(int commentNo);
	void updateComment(FreeBoardComment freeBoardComment);
	void updateBoard(FreeBoard freeBoard);
	void deleteBoard(FreeBoard freeBoard);
	
	void insertCommentLike(Like like);
	void updateCommentLike(Like like);
	Like selectCommentLike(Like like);
	int updateCommentLikePlus(int commentNo);
	int updateCommentLikeMinus(int commentNo);
	int selectCommentLikeCount(int commentNo);
	void updateCommentLikeStatusY(int likeNo);
	void updateCommentLikeStatusN(int likeNo);
	List<Like> selectCommentIsLiked(int memberNo);
	
	void insertCommentDislike(Like like);
	void updateCommentDislike(Like like);
	Like selectCommentDislike(Like like);
	int updateCommentDislikePlus(int commentNo);
	int updateCommentDislikeMinus(int commentNo);
	int selectCommentDislikeCount(int commentNo);
	void updateCommentDislikeStatusY(int likeNo);
	void updateCommentDislikeStatusN(int likeNo);
	List<Like> selectCommentIsDisliked(int memberNo);
	
}


