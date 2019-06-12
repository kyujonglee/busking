package kr.co.buskers.repository.mapper;

import java.util.HashMap;
import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.SocialUrl;
import kr.co.buskers.repository.domain.Video;

public interface ArtistBoardMapper {
	
	List<ArtistShow> selectArtistShow(int buskerNo);
	ArtistShow selectArtistShowByNo(int showNo);
	int countArtistCurrentShow(int buskerNo);
	List<ArtistShow> selectMainArtistShow(ArtistShow artistShow);
	
	void insertArtistShow(ArtistShow artistShow);
	
	void updateArtistShowByNo(ArtistShow artistShow);
	void updateArtistShowWeather(ArtistShow artistShow);
	
	void deleteArtistShowByNo(int showNo);
	
	void insertSocialUrl(SocialUrl socialUrl);
	
	int countSocialUrl(SocialUrl socialUrl);
	
	
	void updateSocialUrl(SocialUrl socialUrl);
	
	SocialUrl selectSocialUrl(int buskerNo);
	
	void insertVideo(Video video);

	List<Video> selectVideo(HashMap<String,Object> map);
	
	int countVideo(int buskerNo);
	void deleteVideo(int videoNo);
}
