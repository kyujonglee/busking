package kr.co.buskers.repository.domain;

public class FollowList {
	private int no;
	private int memberNo;
	private int buskerNo;
	private String followStatus;
	private String activityName;
	private String isBusker;
	private String profileImg;
	private String profileImgPath;
	private String nickName;
	private int followerBuskerNo;
	
	
	public int getFollowerBuskerNo() {
		return followerBuskerNo;
	}
	public void setFollowerBuskerNo(int followerBuskerNo) {
		this.followerBuskerNo = followerBuskerNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getBuskerNo() {
		return buskerNo;
	}
	public void setBuskerNo(int buskerNo) {
		this.buskerNo = buskerNo;
	}
	public String getFollowStatus() {
		return followStatus;
	}
	public void setFollowStatus(String followStatus) {
		this.followStatus = followStatus;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public String getIsBusker() {
		return isBusker;
	}
	public void setIsBusker(String isBusker) {
		this.isBusker = isBusker;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
}
