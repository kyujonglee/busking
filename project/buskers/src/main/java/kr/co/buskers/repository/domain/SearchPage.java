package kr.co.buskers.repository.domain;

public class SearchPage {
	private int pageNo = 1;
	private String input;
	
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
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








