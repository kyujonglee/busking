package kr.co.buskers.main.service;

import java.util.HashMap;
import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.SearchBoard;
import kr.co.buskers.repository.domain.SearchPage;

public interface MainService {
	public void exportCSV();
	public void mapView(String enrollDate);
	public List<ArtistShow> mapDetail(ArtistShow artistShow);
	public List<SearchBoard> mainSearch(SearchPage searchPage);
	HashMap<String, Object> BoardListSearch(SearchPage searchPage);
}
