package kr.co.buskers.repository.domain;

public class FreePage {
	private int pageNo = 1;
	private String sortType;
	private String searchType;
	private String input;
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
	public void setReceiverMemberNo(int receiverMemberNo) {
		this.receiverMemberNo = receiverMemberNo;
	}
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
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








