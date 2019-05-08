package kr.co.buskers.repository.domain;

public class Busker {

	private int buskerNo;
	private int memberNo;
	private String name;
	private String phone;
	private String genre;
	private String activityName;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getBuskerNo() {
		return buskerNo;
	}
	public void setBuskerNo(int buskerNo) {
		this.buskerNo = buskerNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	
	
}
