package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.Busker;

public interface SidebarMapper {
	List<Busker> selectArtistByGenre1();
	List<Busker> selectArtistByGenre2();
	List<Busker> selectArtistByGenre3();
	List<Busker> selectArtistByGenre4();
	List<Busker> selectArtistByGenre5();
	List<Busker> selectArtistByGenre6();
}
