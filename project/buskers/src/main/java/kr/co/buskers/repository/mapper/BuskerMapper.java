package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.Busker;

public interface BuskerMapper {
	Busker selectBuskerByNo(int buskerNo);
	List<Busker> selectBusker();
	List<Busker> selectRecommendArtist(int buskerNo);
}
