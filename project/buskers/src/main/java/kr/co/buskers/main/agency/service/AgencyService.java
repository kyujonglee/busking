package kr.co.buskers.main.agency.service;

import java.util.List;

import kr.co.buskers.repository.domain.AgencyGenre;
import kr.co.buskers.repository.domain.AgencyInfo;
import kr.co.buskers.repository.domain.AgencyPage;

public interface AgencyService {
	List<AgencyInfo> agencyInfoList(AgencyPage page);
	int agencyInfoCount();
	void insertAgencyInfo(AgencyInfo agencyInfo);
	void insertAgencyGenre(AgencyGenre agencyGenre);
}
