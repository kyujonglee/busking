package kr.co.buskers.main.service;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;

public interface MainService {
	public void exportCSV();
	public void mapView(String enrollDate);
	public List<ArtistShow> mapDetail(ArtistShow artistShow);
}
