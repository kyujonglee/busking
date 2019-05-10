package kr.co.buskers.repository.domain;

import java.util.Date;
import java.util.List;

public class AgencyInfo {
	private int agencyInfoNo;
	private String agencyName;
	private String purpose;
	private Date regDate;
	private String phone;
	private String basicAddr;
	private String detailAddr;
	private String email;
	private String permission;
	private String agencyCode;
	private int memberNo;
	private List<AgencyGenre> agencyGenreList;
	private List<String> agencyCheckbox;
	public int getAgencyInfoNo() {
		return agencyInfoNo;
	}
	public void setAgencyInfoNo(int agencyInfoNo) {
		this.agencyInfoNo = agencyInfoNo;
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
	public String getBasicAddr() {
		return basicAddr;
	}
	public void setBasicAddr(String basicAddr) {
		this.basicAddr = basicAddr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
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
	public String getAgencyCode() {
		return agencyCode;
	}
	public void setAgencyCode(String agencyCode) {
		this.agencyCode = agencyCode;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public List<AgencyGenre> getAgencyGenreList() {
		return agencyGenreList;
	}
	public void setAgencyGenreList(List<AgencyGenre> agencyGenreList) {
		this.agencyGenreList = agencyGenreList;
	}
	public List<String> getAgencyCheckbox() {
		return agencyCheckbox;
	}
	public void setAgencyCheckbox(List<String> agencyCheckbox) {
		this.agencyCheckbox = agencyCheckbox;
	}
}
