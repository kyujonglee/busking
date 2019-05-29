package kr.co.buskers.artist.board.service;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;

public interface ArtistBoardService {
	
	List<ArtistShow> selectArtistShow();
	
	void insertArtistShow(ArtistShow artistShow);
}
