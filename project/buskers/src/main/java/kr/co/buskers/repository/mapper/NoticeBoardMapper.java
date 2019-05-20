package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.NoticeBoard;
import kr.co.buskers.repository.domain.NoticePage;

public interface NoticeBoardMapper {
	List<NoticeBoard> selectBoard(NoticePage noticePage);
	List<NoticeBoard> selectAjaxBoard(NoticePage noticePage);
	NoticeBoard selectBoardByNo(int boardNo);
}
