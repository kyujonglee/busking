package kr.co.buskers.repository.domain;

public class NoticePage {
	private int pageNo;
	private String searchType;
	private String input;

	 
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








