package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.AgencyInfo;

public interface AgencyMapper {
	List<AgencyInfo> selectAgencyInfo(); 
}
