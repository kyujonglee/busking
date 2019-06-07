package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.SearchBoard;
import kr.co.buskers.repository.domain.SearchPage;

public interface MainMapper {
	List<ArtistShow> selectArtistShow();
	List<ArtistShow> selectMainArtistShow(ArtistShow artistShow);
	List<ArtistShow> selectArtistShowByDate(String enrollDate);
	List<ArtistShow> selectArtistShowDetail(ArtistShow artistShow);
	List<ArtistShow> selectArtistShowDetailByDate(ArtistShow artistShow);
	ArtistShow selectMarker(int showNo);
	
	List<SearchBoard> selectSearchBoard(SearchPage searchPage);
	int selectCountSearchBoard(SearchPage searchPage);
}
