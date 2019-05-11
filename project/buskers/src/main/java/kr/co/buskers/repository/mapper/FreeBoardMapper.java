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
	void insertComment(FreeBoardComment freeBoardComment);
	Like selectBoardIsLike(Like like);
}
