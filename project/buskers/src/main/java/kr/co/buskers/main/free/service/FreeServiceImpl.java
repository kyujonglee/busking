package kr.co.buskers.main.free.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.common.page.FreePageResult;
import kr.co.buskers.repository.domain.FreeBoard;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.mapper.FreeBoardMapper;

@Service
public class FreeServiceImpl implements FreeService {
	
	@Autowired
	private FreeBoardMapper mapper;
	
	public Map<String, Object> list(HttpServletRequest request, FreePage freePage) {
		Map<String, Object> map = new HashMap<>();
		freePage.setSortType(request.getParameter("sort"));
		
		map.put("sort", request.getParameter("sort"));
		map.put("notifyList", mapper.selectNoticeBoard());
		map.put("list", mapper.selectBoard(freePage));
		map.put("pageResult", new FreePageResult(freePage.getPageNo(), mapper.selectBoardCount()));
		return map;
	}	
	
	public FreeBoard detail(int boardNo) {
		mapper.updateBoardViewCount(boardNo);
		return mapper.selectBoardByNo(boardNo);
	}
	
	public Map<String, Object> sortList(HttpServletRequest request, FreePage freePage) {
		Map<String, Object> map = new HashMap<>();
		
		freePage.setSortType(request.getParameter("sort"));
		
		map.put("notifyList", mapper.selectNoticeBoard());
		map.put("list", mapper.selectBoard(freePage));
		map.put("pageResult", new FreePageResult(freePage.getPageNo(), mapper.selectBoardCount()));
		return map;
	}
}
