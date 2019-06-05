package kr.co.buskers.artist.board.service;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Genre;

public interface ArtistBoardService {
	
	List<ArtistShow> selectArtistShow();
	ArtistShow selectArtistShowByNo(int showNo);
	List<Genre> selectGenre();
	
	void insertArtistShow(ArtistShow artistShow);
	
	void updateArtistShowByNo(ArtistShow artistShow);
	void updateWeather(ArtistShow artistShow);
	
	
	void deleteArtistShowByNo(int showNo);
	
}
