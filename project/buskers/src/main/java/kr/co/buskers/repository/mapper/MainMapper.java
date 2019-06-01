package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.ArtistShow;

public interface MainMapper {
	List<ArtistShow> selectArtistShow();
	List<ArtistShow> selectMainArtistShow(ArtistShow artistShow);
	List<ArtistShow> selectArtistShowByDate(String enrollDate);
	List<ArtistShow> selectArtistShowDetail(ArtistShow artistShow);
}
