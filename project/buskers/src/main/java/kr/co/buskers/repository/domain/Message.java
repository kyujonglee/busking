package kr.co.buskers.repository.domain;

import java.util.Date;

public class Message {
	private int msgNo;
    private int senderMemberNo;
    private int receiverMemberNo;
    private Date sendDate;
    private String content;
    private String title;
	private char readStatus;
    private char saveStatus;
    private String nickName;
    
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
	public char getReadStatus() {
		return readStatus;
	}
	public void setReadStatus(char readStatus) {
		this.readStatus = readStatus;
	}
	public char getSaveStatus() {
		return saveStatus;
	}
	public void setSaveStatus(char saveStatus) {
		this.saveStatus = saveStatus;
	}
}
