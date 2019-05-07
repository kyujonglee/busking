package kr.co.buskers.main.agency.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.AgencyInfo;
import kr.co.buskers.repository.mapper.AgencyMapper;

@Service
public class AgencyServiceImpl implements AgencyService {
	
	@Autowired
	private AgencyMapper mapper;
	
	public List<AgencyInfo> list(){
		return mapper.selectAgencyInfo();
	}
	
}
