package kr.co.buskers.main.info.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.mapper.BuskerMapper;
import kr.co.buskers.repository.mapper.FileMapper;

@Service
public class InfoServiceImpl implements InfoService{
	
	@Autowired
	private BuskerMapper bMapper;
	
	@Autowired
	private FileMapper fMapper;
	
	@Override
	public Map<String,Object> list() {
		Map<String, Object> map = new HashMap<>();
		map.put("buskerList", bMapper.selectBusker());
		map.put("musicList", fMapper.selectMusicLimit());
		return map;
	}
}
