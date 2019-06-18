package kr.co.buskers.repository.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.buskers.repository.domain.ArtistPhoto;
import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Busker;
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
	void insertShowAlarmIsReadStatus(Map<String,Object> map);
	
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
	
	void insertArtistPhoto(ArtistPhoto artistPhoto);
	List<ArtistPhoto> selectPhoto(int buskerNo);
	ArtistPhoto selectPhotoByNo(int fileNo);
	
// 채팅
	Busker selectBuskerActivityName(int buskerNo);
	
	void deletePhoto(int fileNo);
}
