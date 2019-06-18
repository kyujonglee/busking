package kr.co.buskers.main.agency.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.Agency;
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
	
	public String createCode() {
		int start = (int)(Math.random()*25);
		String rAgencyCode = UUID.randomUUID().toString().replace("-", "").substring(start, start+8);
		int count = mapper.checkAgencyCode(rAgencyCode);
		if(count == 0) {
			return rAgencyCode;
		}
		return createCode();
	}
	
	@Override
	public void updateAgencyPermission(AgencyInfo agencyInfo) {
		// UUID 로 고유값을 생성한뒤 - 로 자르고 8자리 문자 생성
		String agencyCode = mapper.selectAgencyCode(agencyInfo.getAgencyInfoNo());
		// agencyCode 가 존재하지 않는다면..
		if(agencyCode == null) {
//			rAgencyCode = passEncoder.encode(rAgencyCode);
			agencyInfo.setAgencyCode(createCode());
			mapper.updateAgencyCode(agencyInfo);
		}
		// agency 허가
		int memberNo = mapper.selectAgencyInfoByNo(agencyInfo.getAgencyInfoNo()).getMemberNo();
		Agency agency = new Agency();
		agency.setAgencyInfoNo(agencyInfo.getAgencyInfoNo());
		agency.setMemberNo(memberNo);
		Agency checkAgency = mapper.checkAgency(agency);	
		
		// permission = 'y'
		if(agencyInfo.getPermission().equals("y")) {
			mapper.insertAgency(agency);
		// permission = 'n'
		}else {
			mapper.deleteAgency(checkAgency.getAgencyNo());
		}
		System.out.println(agencyInfo.getPermission());
		System.out.println(agencyInfo.getMemberNo());
		mapper.updateMemberAgency(agencyInfo);
	
		mapper.updateAgencyPermission(agencyInfo);
	}
	
	@Override
	public int checkAgencyCode(String agencyCode) {
		return mapper.checkAgencyCode(agencyCode);
	}
	
	@Override
	public AgencyInfo selectAgencyByNo(int memberNo) {
		Agency agency = mapper.selectAgencyByNo(memberNo);
		if(agency == null) {
			return null;
		}
		return mapper.selectAgencyByNo(memberNo).getAgencyInfo();
	}
	
	@Override
	public void insertMemberAgency(AgencyInfo agencyInfo) {
		System.out.println("Impl "+agencyInfo.getAgencyCode());
		Integer agencyInfoNo = mapper.selectAgencyInfoNoByAgencyCode(agencyInfo.getAgencyCode());
		Agency agency = new Agency();
		agency.setAgencyInfoNo(agencyInfoNo);
		agency.setMemberNo(agencyInfo.getMemberNo());
		mapper.insertAgency(agency);
		
		agencyInfo.setPermission("y");
		mapper.updateMemberAgency(agencyInfo);
	}
	
}
