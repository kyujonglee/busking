package kr.co.buskers.repository.domain;

import java.util.Date;

public class FreeBoard {
	private int memberNo;
	private int boardNo;
	private String title;
	private String content;
	private int likeCnt;
	private Date regDate;
	private int viewCnt;
	private String isNotify;
	private int groupNo;
	private String nickName;
	private int commentCount;
	private int groupNoCount;
	private String isAdmin;
	private String isBusker;
	private String isAgency;
	private int buskerNo;
	private String profileImg;
	private String profileImgPath;
	
	public String getProfileImgPath() {
		return profileImgPath;
	}
	public void setProfileImgPath(String profileImgPath) {
		this.profileImgPath = profileImgPath;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getBuskerNo() {
		return buskerNo;
	}
	public void setBuskerNo(int buskerNo) {
		this.buskerNo = buskerNo;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getIsBusker() {
		return isBusker;
	}
	public void setIsBusker(String isBusker) {
		this.isBusker = isBusker;
	}
	public String getIsAgency() {
		return isAgency;
	}
	public void setIsAgency(String isAgency) {
		this.isAgency = isAgency;
	}
	public int getGroupNoCount() {
		return groupNoCount;
	}
	public void setGroupNoCount(int groupNoCount) {
		this.groupNoCount = groupNoCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getIsNotify() {
		return isNotify;
	}
	public void setIsNotify(String isNotify) {
		this.isNotify = isNotify;
	}
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
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
}