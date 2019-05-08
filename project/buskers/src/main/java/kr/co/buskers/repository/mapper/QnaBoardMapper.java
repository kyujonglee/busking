package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.QnaBoard;

public interface QnaBoardMapper {	
	public void insertBoard(QnaBoard qnaBoard);
	List<QnaBoard> selectBoard(FreePage freePage);
	int selectBoardCount();
	List<QnaBoard> selectNoticeBoard();
}
