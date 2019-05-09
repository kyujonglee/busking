package kr.co.buskers.repository.mapper;


import java.util.List;

import kr.co.buskers.repository.domain.FreeBoard;
import kr.co.buskers.repository.domain.FreePage;

public interface FreeBoardMapper {
	List<FreeBoard> selectBoard(FreePage freePage);
	int selectBoardCount(FreePage freePage);
	List<FreeBoard> selectNoticeBoard();
	FreeBoard selectBoardByNo(int boardNo);
	void updateBoardViewCount(int boardNo);
}
