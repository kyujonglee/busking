package kr.co.buskers.repository.domain;

import java.util.Date;

public class Member {

	private int memberNo;
	private String id;
	private String pass;
	private String salt;
	private String name;
	private String email;
	private Date joinDate;
	private String phone;
	private char sex;
	private String profileImg;
	private String profileImgPath;
	private String nickName;
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
	public void setSex(char sex) {
		this.sex = sex;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
