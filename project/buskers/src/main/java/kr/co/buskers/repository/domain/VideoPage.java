package kr.co.buskers.repository.domain;

public class VideoPage {
	private int pageNo = 0;
	private int receiverMemberNo;
	private int senderMemberNo;

	public int getSenderMemberNo() {
		return senderMemberNo;
	}
	public void setSenderMemberNo(int senderMemberNo) {
		this.senderMemberNo = senderMemberNo;
	}
	public int getReceiverMemberNo() {
		return receiverMemberNo;
	}
	public void setReceiverMegmberNo(int receiverMemberNo) {
		this.receiverMemberNo = receiverMemberNo;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (this.pageNo -1) * 10 + 1;   
	}
	public int getEnd() {
		return this.pageNo * 10;
	}
}








