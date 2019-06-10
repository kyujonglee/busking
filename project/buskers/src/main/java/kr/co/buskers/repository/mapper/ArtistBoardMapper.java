package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.SocialUrl;

public interface ArtistBoardMapper {
	
	List<ArtistShow> selectArtistShow();
	ArtistShow selectArtistShowByNo(int showNo);
	int countArtistCurrentShow();
	List<ArtistShow> selectMainArtistShow(ArtistShow artistShow);
	
	void insertArtistShow(ArtistShow artistShow);
	
	void updateArtistShowByNo(ArtistShow artistShow);
	void updateArtistShowWeather(ArtistShow artistShow);
	
	void deleteArtistShowByNo(int showNo);
	
	void insertSocialUrl(SocialUrl socialUrl);
	
	int countSocialUrl(SocialUrl socialUrl);
	
	void updateSocialUrl(SocialUrl socialUrl);
	
	SocialUrl selectSocialUrl(int buskerNo);
}
