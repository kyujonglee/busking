package kr.co.buskers.repository.domain;

public class SocialUrl {
	private int socialUrlNo;
	private int buskerNo;
	public String faceBookUrl;
	public String instargramUrl;
	public String youTubeUrl;
	public int getSocialUrlNo() {
		return socialUrlNo;
	}
	public void setSocialUrlNo(int socialUrlNo) {
		this.socialUrlNo = socialUrlNo;
	}
	public int getBuskerNo() {
		return buskerNo;
	}
	public void setBuskerNo(int buskerNo) {
		this.buskerNo = buskerNo;
	}
	public String getFaceBookUrl() {
		return faceBookUrl;
	}
	public void setFaceBookUrl(String faceBookUrl) {
		this.faceBookUrl = faceBookUrl;
	}
	public String getInstargramUrl() {
		return instargramUrl;
	}
	public void setInstargramUrl(String instargramUrl) {
		this.instargramUrl = instargramUrl;
	}
	public String getYouTubeUrl() {
		return youTubeUrl;
	}
	public void setYouTubeUrl(String youTubeUrl) {
		this.youTubeUrl = youTubeUrl;
	}
	
	
}
