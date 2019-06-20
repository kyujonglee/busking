package kr.co.buskers.main.notice.service;

import java.util.Map;

import kr.co.buskers.repository.domain.NoticeBoard;
import kr.co.buskers.repository.domain.NoticePage;

public interface NoticeService {
	public Map<String, Object> list(NoticePage noticePage);
	public Map<String, Object> listAjax(NoticePage noticePage);
	public Map<String, Object> detail(int boardNo);
	public void insert(NoticeBoard noticeboard);
}
