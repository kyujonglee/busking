package kr.co.buskers.repository.domain;

import java.util.Date;

public class FreeBoard {
	private int memberNo;
	private int boardNo;
	private String title;
	private String content;
	private int likeCnt;
	private Date regDate;
	private int is_notify;

	public int getIs_notify() {
		return is_notify;
	}

	public void setIs_notify(int is_notify) {
		this.is_notify = is_notify;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}