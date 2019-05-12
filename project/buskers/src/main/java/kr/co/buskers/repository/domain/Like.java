package kr.co.buskers.repository.domain;

public class Like {
	private int memberNo;
	private int boardNo;
	private int likeNo;
	private int boardType;
	private char likeStatus;
	private char dislikeStatus;
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public char getLikeStatus() {
		return likeStatus;
	}
	public void setLikeStatus(char likeStatus) {
		this.likeStatus = likeStatus;
	}
	public char getDislikeStatus() {
		return dislikeStatus;
	}
	public void setDislikeStatus(char dislikeStatus) {
		this.dislikeStatus = dislikeStatus;
	}
	
	
}
