package kr.co.buskers.main.agency.service;

import java.util.List;

import kr.co.buskers.repository.domain.AgencyGenre;
import kr.co.buskers.repository.domain.AgencyInfo;
import kr.co.buskers.repository.domain.AgencyPage;
import kr.co.buskers.repository.domain.Genre;

public interface AgencyService {
	List<AgencyInfo> agencyInfoList(AgencyPage page);
	int agencyInfoCount();
	void insertAgencyInfo(AgencyInfo agencyInfo);
	void insertAgencyGenre(AgencyGenre agencyGenre);
	AgencyInfo selectAgencyInfoByNo(int agencyInfoNo);
	void deleteAgencyInfoAll(int agencyInfoNo);
	List<Genre> selectGenre();
	void updateAgencyInfo(AgencyInfo agencyInfo,AgencyGenre agencyGenre);
}
