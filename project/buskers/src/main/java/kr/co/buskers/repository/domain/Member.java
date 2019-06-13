package kr.co.buskers.repository.domain;

import java.util.Date;

public class Member {

	private int memberNo;
	private String id;
	private String pass;
	private String email;
	private Date joinDate;
	private char sex;
	private String profileImg;
	private String profileImgPath;
	private String isAdmin;
	private String isBusker;
	private String isAgency;
	private String nickName;
	private String memberType;
	private String accessToken;
	private String refreshToken;
	private int sum;
	private String profileIntroduce;
	private Busker busker;
	private int buskerNo;
	
	
	public String getProfileIntroduce() {
		return profileIntroduce;
	}
	public void setProfileIntroduce(String profileIntroduce) {
		this.profileIntroduce = profileIntroduce;
	}
	public Busker getBusker() {
		return busker;
	}
	public void setBusker(Busker busker) {
		this.busker = busker;
	}
	public int getBuskerNo() {
		return buskerNo;
	}
	public void setBuskerNo(int buskerNo) {
		this.buskerNo = buskerNo;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
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
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getIsBusker() {
		return isBusker;
	}
	public void setIsBusker(String isBusker) {
		this.isBusker = isBusker;
	}
	public String getIsAgency() {
		return isAgency;
	}
	public void setIsAgency(String isAgency) {
		this.isAgency = isAgency;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public String getRefreshToken() {
		return refreshToken;
	}
	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}
	
	
}
