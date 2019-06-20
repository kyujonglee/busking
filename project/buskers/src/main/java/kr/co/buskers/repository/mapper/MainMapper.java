package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistPhoto;
import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.Follow;
import kr.co.buskers.repository.domain.SearchBoard;
import kr.co.buskers.repository.domain.SearchPage;
import kr.co.buskers.repository.domain.Video;

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
	List<ArtistShow> selectFollowArtistShow(int memberNo);
	List<ArtistPhoto> selectFollowArtistPhotoList(int memberNo);
	List<Video> selectFollowArtistVideoList(int memberNo);
	
	// 최근 게시물
	List<ArtistShow> selectArtistShowRecent();
	List<ArtistPhoto> selectArtistPhotoListRecent();
	List<Video> selectArtistVideoListRecent();
	
	List<SearchBoard> selectSearchBoard(SearchPage searchPage);
	int selectCountSearchBoard(SearchPage searchPage);
	Busker searchBusker(SearchPage searchPage);
	List<Busker> selectSearchBuskerList(String input);
	
	List<Follow> selectFollowArtist(int memberNo);
}
