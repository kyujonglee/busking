package kr.co.buskers.artist.board.service;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;

public interface ArtistBoardService {
	
	List<ArtistShow> selectArtistShow();
	ArtistShow selectArtistShowByNo(int showNo);
	
	void insertArtistShow(ArtistShow artistShow);
	
	void updateArtistShowByNo(ArtistShow artistShow);
	
	void deleteArtistShowByNo(int showNo);
	
}
