package kr.co.buskers.repository.domain;

import java.util.List;

public class AgencyGenre {
	private int agencyGenreNo;
	private int agencyInfoNo;
	private int genreNo;
	private List<String> agencyCheckbox;
	public int getAgencyGenreNo() {
		return agencyGenreNo;
	}
	public void setAgencyGenreNo(int agencyGenreNo) {
		this.agencyGenreNo = agencyGenreNo;
	}
	public int getAgencyInfoNo() {
		return agencyInfoNo;
	}
	public void setAgencyInfoNo(int agencyInfoNo) {
		this.agencyInfoNo = agencyInfoNo;
	}
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}
	public List<String> getAgencyCheckbox() {
		return agencyCheckbox;
	}
	public void setAgencyCheckbox(List<String> agencyCheckbox) {
		this.agencyCheckbox = agencyCheckbox;
	}
	
	
}
