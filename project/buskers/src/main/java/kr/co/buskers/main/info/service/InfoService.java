package kr.co.buskers.main.info.service;

import java.util.List;
import java.util.Map;

import kr.co.buskers.repository.domain.Video;

public interface InfoService {
	
	Map<String,Object> list();
	List<Video> videoList();
	
}
