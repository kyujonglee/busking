package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.AgencyGenre;
import kr.co.buskers.repository.domain.AgencyInfo;
import kr.co.buskers.repository.domain.AgencyPage;

public interface AgencyMapper {
	List<AgencyInfo> selectAgencyInfo(AgencyPage page);
	int selectAgencyInfoCount();
	void insertAgencyInfo(AgencyInfo agencyInfo);
	void insertAgencyGenre(AgencyGenre agencyGenre);
	AgencyInfo selectAgencyInfoByNo(int agencyInfoNo);
	List<AgencyGenre> selectAgencyGenreByNo(int agencyInfoNo);
	void deleteAgencyInfoByNo(int agencyInfoNo);
	void deleteAgencyGenreByNo(int agencyInfoNo);
	void deleteAgencyByNo(int agencyInfoNo);
}
