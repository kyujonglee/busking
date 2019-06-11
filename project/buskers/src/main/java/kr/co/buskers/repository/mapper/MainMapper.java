package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.Follow;
import kr.co.buskers.repository.domain.SearchBoard;
import kr.co.buskers.repository.domain.SearchPage;

public interface MainMapper {
	List<ArtistShow> selectArtistShow();
	List<ArtistShow> selectMainArtistShow(ArtistShow artistShow);
	List<ArtistShow> selectArtistShowByDate(String enrollDate);
	List<ArtistShow> selectArtistShowDetail(ArtistShow artistShow);
	List<ArtistShow> selectArtistShowDetailByDate(ArtistShow artistShow);
	List<ArtistShow> selectArtistShowToday();
	ArtistShow selectMarker(int showNo);
	List<Busker> selectArtistByGenre1();
	List<Busker> selectArtistByGenre2();
	List<Busker> selectArtistByGenre3();
	List<Busker> selectArtistByGenre4();
	List<Busker> selectArtistByGenre5();
	List<Busker> selectArtistByGenre6();
	List<Follow> selectFollowArtist(int buskerNo);
	List<ArtistShow> selectFollowArtistShow(int memberNo);
	
	List<SearchBoard> selectSearchBoard(SearchPage searchPage);
	int selectCountSearchBoard(SearchPage searchPage);
	Busker searchBusker(SearchPage searchPage);
}
