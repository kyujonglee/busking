package kr.co.buskers.main.free.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.buskers.repository.domain.FreeBoard;
import kr.co.buskers.repository.domain.FreePage;

public interface FreeService {
	public Map<String, Object> list(FreePage freePage);
	public Map<String, Object> sortList(HttpServletRequest request, FreePage freePage);
	public FreeBoard detail(int boardNo);
}
