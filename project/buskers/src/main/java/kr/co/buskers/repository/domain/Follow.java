package kr.co.buskers.repository.domain;

import java.util.List;

public class Follow {
	private int no;
	private int memberNo;
	private int buskerNo;
	String followStatus;
	List<ArtistShow> followArtistShowList;
	
	public List<ArtistShow> getFollowArtistShowList() {
		return followArtistShowList;
	}
	public void setFollowArtistShowList(List<ArtistShow> followArtistShowList) {
		this.followArtistShowList = followArtistShowList;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getBuskerNo() {
		return buskerNo;
	}
	public void setBuskerNo(int buskerNo) {
		this.buskerNo = buskerNo;
	}
	public String getFollowStatus() {
		return followStatus;
	}
	public void setFollowStatus(String followStatus) {
		this.followStatus = followStatus;
	}
	
}
