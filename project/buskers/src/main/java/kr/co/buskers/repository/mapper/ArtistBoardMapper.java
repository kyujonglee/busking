package kr.co.buskers.repository.mapper;

import java.util.HashMap;
import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.SocialUrl;
import kr.co.buskers.repository.domain.Video;

public interface ArtistBoardMapper {
	
//	ArtistShow select
	List<ArtistShow> selectArtistShow(int buskerNo);
	ArtistShow selectArtistShowByNo(int showNo);
	int countArtistCurrentShow(int buskerNo);
	List<ArtistShow> selectMainArtistShow(ArtistShow artistShow);
	
//	ArtistShow insert
	void insertArtistShow(ArtistShow artistShow);
	
//	ArtistShow update
	void updateArtistShowByNo(ArtistShow artistShow);
	void updateArtistShowWeather(ArtistShow artistShow);
	
//	ArtistShow delete
	void deleteArtistShowByNo(int showNo);
	
//	socialUrl
	
	void insertSocialUrl(SocialUrl socialUrl);
	
	int countSocialUrl(SocialUrl socialUrl);
	
	void updateSocialUrl(SocialUrl socialUrl);
	
	SocialUrl selectSocialUrl(int buskerNo);
	
	
//	Video
	
//	Video select
	List<Video> selectVideo(HashMap<String,Object> map);
	List<Video> selectVideoLimit();
	List<Video> selectVideoLimitByNo(int buskerNo);
	Video selectVideoOneByNo(int buskerNo);
	
	
	void insertVideo(Video video);
	
	int countVideo(int buskerNo);
	
	void deleteVideo(int videoNo);
}
