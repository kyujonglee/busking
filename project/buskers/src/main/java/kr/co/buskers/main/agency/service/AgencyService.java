package kr.co.buskers.main.agency.service;

import java.util.List;

import kr.co.buskers.repository.domain.AgencyInfo;
import kr.co.buskers.repository.domain.AgencyPage;

public interface AgencyService {
	public List<AgencyInfo> agencyInfoList(AgencyPage page);
	public int agencyInfoCount();
}
