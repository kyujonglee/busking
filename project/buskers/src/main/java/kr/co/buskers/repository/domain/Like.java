package kr.co.buskers.repository.domain;

public class Like {
	private int member_no;
	private int board_no;
	private int like_no;
	private int board_type;
	private char like_status;
	private char dislike_status;
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public char getLike_status() {
		return like_status;
	}
	public void setLike_status(char like_status) {
		this.like_status = like_status;
	}
	public char getDislike_status() {
		return dislike_status;
	}
	public void setDislike_status(char dislike_status) {
		this.dislike_status = dislike_status;
	}
	
}
