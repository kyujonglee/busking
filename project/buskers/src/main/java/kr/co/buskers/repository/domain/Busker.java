package kr.co.buskers.repository.domain;

import java.util.List;

public class Busker {

	private int buskerNo;
	private int memberNo;
	private String phone;
	private String activityName;
	private List<BuskerGenre> buskerGenreList;
	private List<String> buskerCheckbox;
	private String profileImg;
	private String profileImgPath;
	private String id;
	private String intro;
	private String time;
	private String location;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
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
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getProfileImgPath() {
		return profileImgPath;
	}
	public void setProfileImgPath(String profileImgPath) {
		this.profileImgPath = profileImgPath;
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
	
	
}
