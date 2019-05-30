package kr.co.buskers.main.map.service;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;

public interface MainMapService {
	public void exportCSV();
	public List<ArtistShow> exportCSV(ArtistShow artistShow);
}
