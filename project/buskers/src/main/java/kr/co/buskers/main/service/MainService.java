package kr.co.buskers.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.buskers.repository.domain.ArtistPhoto;
import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.SearchBoard;
import kr.co.buskers.repository.domain.SearchPage;

public interface MainService {
	public void exportCSV();
	public void mapView(String enrollDate);
	public List<ArtistShow> mapDetail(ArtistShow artistShow);
	public Map<String, Object> selectArtistShowToday(HttpSession session);
	public List<ArtistPhoto> selectFollowArtistPhotoList(HttpSession session);
	public ArtistShow markerDetail(int showNo);
	public ArtistShow markerImage(int showNo);
	public List<SearchBoard> mainBoardSearch(SearchPage searchPage);
	HashMap<String, Object> BoardListSearch(SearchPage searchPage);
	public Busker mainBuskerSearch(SearchPage searchPage);
	
}
