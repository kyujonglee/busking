package kr.co.buskers.artist.main.service;

import java.util.List;
import java.util.Map;

import kr.co.buskers.repository.domain.MusicFile;

public interface ArtistMainService {
	Map<String,Object> artistMain(int buskerNo);
	
	List<MusicFile> selectMusicByBuskerNo(int buskerNo);
}
