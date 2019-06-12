package kr.co.buskers.artist.board.service;

import java.util.HashMap;
import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Genre;
import kr.co.buskers.repository.domain.Video;
import kr.co.buskers.repository.domain.VideoPage;

public interface ArtistBoardService {
	
	List<ArtistShow> selectArtistShow(int buskerNo);
	ArtistShow selectArtistShowByNo(int showNo);
	List<Genre> selectGenre();
	
	void insertArtistShow(ArtistShow artistShow);
	
	void updateArtistShowByNo(ArtistShow artistShow);
	void updateWeather(ArtistShow artistShow);
	
	void insertVideo(Video video);
	
	void deleteArtistShowByNo(int showNo);
	HashMap<String,Object> selectVideo(int buskerNo, VideoPage videoPage);
	void deleteVideo(int videoNo);
	
}
