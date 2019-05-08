package kr.co.buskers.repository.domain;

import java.util.Date;

public class Member {

	private int memberNo;
	private String id;
	private String pass;
	private String salt;
	private String email;
	private String nickName;
	private Date joinDate;
	private char sex;
	private String profileImg;
	private String profileImgPath;
	private char isAdmin;
	private char isBusker;
	private char isAgency;
	
	public char getIsBusker() {
		return isBusker;
	}
	public void setIsBusker(char isBusker) {
		this.isBusker = isBusker;
	}
	public char getIsAgency() {
		return isAgency;
	}
	public void setIsAgency(char isAgency) {
		this.isAgency = isAgency;
	}
	
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
	}
	public char getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(char isAdmin) {
		this.isAdmin = isAdmin;
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
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
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
