package kr.co.buskers.common.main.sidebar.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.mapper.SidebarMapper;

@Service
public class SidebarServiceImpl implements SidebarService {
	
	@Autowired
	private SidebarMapper mapper;
	
	public Map<String, Object> ArtistGenreList() {
		Map<String, Object> map = new HashMap<>();
		
		map.put("genre1", mapper.selectArtistByGenre1());
		map.put("genre2", mapper.selectArtistByGenre2());
		map.put("genre3", mapper.selectArtistByGenre3());
		map.put("genre4", mapper.selectArtistByGenre4());
		map.put("genre5", mapper.selectArtistByGenre5());
		map.put("genre6", mapper.selectArtistByGenre6());
		
		return map;
	}	
}


