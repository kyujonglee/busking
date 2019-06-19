package kr.co.buskers.repository.domain;

import java.util.Date;

public class Message {
	private int msgNo;
    private int senderMemberNo;
    private int receiverMemberNo;
    private Date sendDate;
    private String content;
    private String title;
	private String readStatus;
    private String saveStatus;
    private String nickName;
    private int[] msgNos;
    private String isAgency;
    
//  agency, agency_info table 관련
    private String agencyName;
    private String phone;
    private String email;
    private String basicAddr;
    private String detailAddr;
    
	public String getIsAgency() {
		return isAgency;
	}
	public void setIsAgency(String isAgency) {
		this.isAgency = isAgency;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int[] getMsgNos() {
		return msgNos;
	}
	public void setMsgNos(int[] msgNos) {
		this.msgNos = msgNos;
	}
	public String getTitle() {
    	return title;
    }
    public void setTitle(String title) {
    	this.title = title;
    }
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public int getSenderMemberNo() {
		return senderMemberNo;
	}
	public void setSenderMemberNo(int senderMemberNo) {
		this.senderMemberNo = senderMemberNo;
	}
	public int getReceiverMemberNo() {
		return receiverMemberNo;
	}
	public void setReceiverMemberNo(int receiverMemberNo) {
		this.receiverMemberNo = receiverMemberNo;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadStatus() {
		return readStatus;
	}
	public void setReadStatus(String readStatus) {
		this.readStatus = readStatus;
	}
	public String getSaveStatus() {
		return saveStatus;
	}
	public void setSaveStatus(String saveStatus) {
		this.saveStatus = saveStatus;
	}
}
