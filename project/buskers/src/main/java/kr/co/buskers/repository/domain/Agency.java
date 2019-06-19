package kr.co.buskers.repository.domain;

public class Agency {
	private int agencyNo;
	private int memberNo;
	private int agencyInfoNo;
	private AgencyInfo agencyInfo;
	
	public AgencyInfo getAgencyInfo() {
		return agencyInfo;
	}
	public void setAgencyInfo(AgencyInfo agencyInfo) {
		this.agencyInfo = agencyInfo;
	}
	public int getAgencyNo() {
		return agencyNo;
	}
	public void setAgencyNo(int agencyNo) {
		this.agencyNo = agencyNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getAgencyInfoNo() {
		return agencyInfoNo;
	}
	public void setAgencyInfoNo(int agencyInfoNo) {
		this.agencyInfoNo = agencyInfoNo;
	}
	
}
