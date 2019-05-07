package kr.co.buskers.repository.domain;

import java.util.Date;

public class Agency {
	private int agencyNo;
	private String agencyName;
	private String purpose;
	private Date regDate;
	private String phone;
	private String basic_addr;
	private String detail_addr;
	private String email;
	private String permission;
	private int memberNo;
	
	public int getAgencyNo() {
		return agencyNo;
	}
	public void setAgencyNo(int agencyNo) {
		this.agencyNo = agencyNo;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBasic_addr() {
		return basic_addr;
	}
	public void setBasic_addr(String basic_addr) {
		this.basic_addr = basic_addr;
	}
	public String getDetail_addr() {
		return detail_addr;
	}
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
}
