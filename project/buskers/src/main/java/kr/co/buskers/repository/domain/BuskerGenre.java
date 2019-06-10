package kr.co.buskers.repository.domain;

import java.util.List;

public class BuskerGenre {

	private int buskerGenreNo;
	private int buskerNo;
	private int genreNo;
	private List<String> buskerCheckbox;
	private Genre genre;
	
	
	
	public List<String> getBuskerCheckbox() {
		return buskerCheckbox;
	}
	public void setBuskerCheckbox(List<String> buskerCheckbox) {
		this.buskerCheckbox = buskerCheckbox;
	}
	public Genre getGenre() {
		return genre;
	}
	public void setGenre(Genre genre) {
		this.genre = genre;
	}
	public int getBuskerGenreNo() {
		return buskerGenreNo;
	}
	public void setBuskerGenreNo(int buskerGenreNo) {
		this.buskerGenreNo = buskerGenreNo;
	}
	public int getBuskerNo() {
		return buskerNo;
	}
	public void setBuskerNo(int buskerNo) {
		this.buskerNo = buskerNo;
	}
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}
	
}
