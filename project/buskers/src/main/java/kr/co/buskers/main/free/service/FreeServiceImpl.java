package kr.co.buskers.main.free.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.buskers.common.page.FreePageResult;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.mapper.FreeBoardMapper;

public class FreeServiceImpl implements FreeService {
	@Autowired
	private FreeBoardMapper mapper;
	
	public Map<String, Object> list(FreePage freePage) {
		Map<String, Object> map = new HashMap<>();
		map.put("list", mapper.selectBoard(freePage));
		map.put("pageResult", new FreePageResult(freePage.getPageNo(), mapper.selectBoardCount()));
		return map;
	}	
}
