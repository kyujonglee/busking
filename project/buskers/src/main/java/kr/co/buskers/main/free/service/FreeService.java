package kr.co.buskers.main.free.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.buskers.repository.domain.FreeBoard;
import kr.co.buskers.repository.domain.FreeBoardComment;
import kr.co.buskers.repository.domain.FreePage;

public interface FreeService {
	public Map<String, Object> list(FreePage freePage);
	public Map<String, Object> sortList(FreePage freePage);
	public Map<String, Object> insertComment(FreeBoardComment freeBoardComment);
	public Map<String, Object> detail(int boardNo, HttpSession session);
	public void write(FreeBoard freeBoard);
}
