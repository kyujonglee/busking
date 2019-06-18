package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.AgencyGenre;
import kr.co.buskers.repository.domain.AgencyInfo;
import kr.co.buskers.repository.domain.AgencyPage;
import kr.co.buskers.repository.domain.Genre;

public interface AgencyMapper {
	List<AgencyInfo> selectAgencyInfo(AgencyPage page);
	int selectAgencyInfoCount();
	AgencyInfo selectAgencyInfoByNo(int agencyInfoNo);
	List<AgencyGenre> selectAgencyGenreByNo(int agencyInfoNo);
	List<Genre> selectGenre();
	
	void insertAgencyInfo(AgencyInfo agencyInfo);
	void insertAgencyGenre(AgencyGenre agencyGenre);
	
	void deleteAgencyInfoByNo(int agencyInfoNo);
	void deleteAgencyGenreByNo(int agencyInfoNo);
	void deleteAgencyByNo(int agencyInfoNo);
	
	void updateAgencyInfo(AgencyInfo agencyInfo);
	void updateAgencyPermission(AgencyInfo AgencyInfo);
}
