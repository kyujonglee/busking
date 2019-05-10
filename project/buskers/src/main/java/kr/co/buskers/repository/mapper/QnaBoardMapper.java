package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Like;
import kr.co.buskers.repository.domain.QnaBoard;
import kr.co.buskers.repository.domain.QnaBoardComment;

public interface QnaBoardMapper {	
	public void insertBoard(QnaBoard qnaBoard);
	List<QnaBoard> selectBoard(FreePage freePage);
	int selectBoardCount();
	QnaBoard selectBoardByNo(int no);
	void updateViewCnt(int no);
	void deleteBoard(int no);	
	void updateBoard(QnaBoard qnaBoard);
	
	List<QnaBoardComment> selectComment(int no);
	List<QnaBoardComment> selectCommentReply(int no);
	
	void insertLike(Like like);
	Like selectLike(Like like);
	void updateLike(Like like);
	void updateLikeQnaBoardPlus(QnaBoard qnaBoard);
	void updateLikeQnaBoardMinus(QnaBoard qnaBoard);
	void deleteLike(int no);
	
	void insertComment(QnaBoardComment qnaBoardComment);
	
	
	
}
