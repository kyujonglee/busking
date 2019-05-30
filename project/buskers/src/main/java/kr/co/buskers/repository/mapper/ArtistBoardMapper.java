package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;

public interface ArtistBoardMapper {
	
	List<ArtistShow> selectArtistShow();
	List<ArtistShow> selectMainArtistShow(ArtistShow artistShow);
	
	void insertArtistShow(ArtistShow artistShow);
}
