package kr.co.buskers.main.agency.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.AgencyGenre;
import kr.co.buskers.repository.domain.AgencyInfo;
import kr.co.buskers.repository.domain.AgencyPage;
import kr.co.buskers.repository.domain.Genre;
import kr.co.buskers.repository.mapper.AgencyMapper;

@Service
public class AgencyServiceImpl implements AgencyService {
	
	@Autowired
	private AgencyMapper mapper;
	
	@Override
	public List<AgencyInfo> agencyInfoList(AgencyPage page){
		return mapper.selectAgencyInfo(page);
	}
	
	@Override
	public int agencyInfoCount() {
		return mapper.selectAgencyInfoCount();
	}
	
	@Override
	public void insertAgencyInfo(AgencyInfo agencyInfo){
		mapper.insertAgencyInfo(agencyInfo);
	}
	
	@Override
	public void insertAgencyGenre(AgencyGenre agencyGenre){
		mapper.insertAgencyGenre(agencyGenre);
	}
	
	@Override
	public AgencyInfo selectAgencyInfoByNo(int agencyInfoNo) {
		return mapper.selectAgencyInfoByNo(agencyInfoNo);
	}
	
	@Override
	public void deleteAgencyInfoAll(int agencyInfoNo) {
		mapper.deleteAgencyGenreByNo(agencyInfoNo);
		mapper.deleteAgencyByNo(agencyInfoNo);
		mapper.deleteAgencyInfoByNo(agencyInfoNo);
	}
	@Override
	public List<Genre> selectGenre(){
		return mapper.selectGenre();
	}
	@Override
	public void updateAgencyInfo(AgencyInfo agencyInfo,AgencyGenre agencyGenre) {
		mapper.deleteAgencyGenreByNo(agencyInfo.getAgencyInfoNo());
		mapper.insertAgencyGenre(agencyGenre);
		mapper.updateAgencyInfo(agencyInfo);
	}
	@Override
	public void updateAgencyPermission(AgencyInfo agencyInfo) {
		mapper.updateAgencyPermission(agencyInfo);
	}
}
