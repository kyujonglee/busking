package kr.co.buskers.repository.domain;

import java.util.List;

public class Busker {

	private int buskerNo;
	private int memberNo;
	private String phone;
	private String activityName;
	private List<BuskerGenre> buskerGenreList;
	private List<String> buskerCheckbox;
	
	
	
	public List<BuskerGenre> getBuskerGenreList() {
		return buskerGenreList;
	}
	public void setBuskerGenreList(List<BuskerGenre> buskerGenreList) {
		this.buskerGenreList = buskerGenreList;
	}
	public List<String> getBuskerCheckbox() {
		return buskerCheckbox;
	}
	public void setBuskerCheckbox(List<String> buskerCheckbox) {
		this.buskerCheckbox = buskerCheckbox;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	private String intro;
	private String time;
	private String location;
	
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
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	
	
}
