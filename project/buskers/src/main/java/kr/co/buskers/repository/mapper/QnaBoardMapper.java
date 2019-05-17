package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Like;
import kr.co.buskers.repository.domain.QnaBoard;
import kr.co.buskers.repository.domain.QnaBoardComment;

public interface QnaBoardMapper {	
	List<QnaBoard> selectBoard(FreePage freePage);
	int selectBoardCount(FreePage freePage);
	QnaBoard selectBoardByNo(int boardNo);
	void updateBoardViewCount(int boardNo);
	void insertBoard(QnaBoard qnaBoard);
	List<QnaBoardComment> selectCommentList(int boardNo);
	List<QnaBoardComment> selectReplyList(int boardNo);
	void insertComment(QnaBoardComment qnaBoardComment);
	Like selectBoardIsLike(Like like);
	void updateLikeStatus(Like like);
	void insertLikeStatus(Like like);
	void updateAddLike(int boardNo);
	void updateRemoveLike(int boardNo);
	int selectBoardLikeCount(int boardNo);
	void insertReply(QnaBoardComment qnaBoardComment);
	void updateDeleteComment(int commentNo);
	void deleteComment(int commentNo);
	int selectCommentHasReply(int commentNo);
	void updateComment(QnaBoardComment qnaBoardComment);
	void updateBoard(QnaBoard qnaBoard);
	void deleteBoard(QnaBoard qnaBoard);
	
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
	
	List<QnaBoardComment> selectLikeHighestComment(int boardNo);
//	QnaBoardComment selectLikeHighestComment(int boardNo);
	
	
}
