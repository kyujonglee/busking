package kr.co.buskers.main.free.service;

import java.util.HashMap;
import java.util.Map;

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
	
	public Map<String, Object> list(FreePage freePage) {
		Map<String, Object> map = new HashMap<>();

		System.out.println("검색 타입 : " + freePage.getSearchType());
		System.out.println("검색어 : " + freePage.getInput());
		map.put("searchType", freePage.getSearchType());
		map.put("input", freePage.getInput());
		map.put("sortType", freePage.getSortType());
		map.put("notifyList", mapper.selectNoticeBoard());
		map.put("list", mapper.selectBoard(freePage));
		map.put("pageResult", new FreePageResult(freePage.getPageNo(), mapper.selectBoardCount(freePage)));
		return map;
	}	
	
	public FreeBoard detail(int boardNo) {
		mapper.updateBoardViewCount(boardNo);
		return mapper.selectBoardByNo(boardNo);
	}
	
	public Map<String, Object> sortList(FreePage freePage) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchType", freePage.getSearchType());
		map.put("input", freePage.getInput());
		map.put("sortType", freePage.getSortType());
		map.put("notifyList", mapper.selectNoticeBoard());
		map.put("list", mapper.selectBoard(freePage));
		map.put("pageResult", new FreePageResult(freePage.getPageNo(), mapper.selectBoardCount(freePage)));
		return map;
	}
	
	public void write(FreeBoard freeBoard) {
		mapper.insertBoard(freeBoard);
	}
}
