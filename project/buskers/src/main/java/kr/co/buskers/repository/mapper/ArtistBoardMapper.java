package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;

public interface ArtistBoardMapper {
	
	List<ArtistShow> selectArtistShow();
	ArtistShow selectArtistShowByNo(int showNo);
	int countArtistCurrentShow();
	List<ArtistShow> selectMainArtistShow(ArtistShow artistShow);
	
	void insertArtistShow(ArtistShow artistShow);
	
	void updateArtistShowByNo(ArtistShow artistShow);
	
	void deleteArtistShowByNo(int showNo);
	
}
