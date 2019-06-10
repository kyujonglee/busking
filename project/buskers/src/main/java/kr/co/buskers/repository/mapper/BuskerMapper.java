package kr.co.buskers.repository.mapper;

import kr.co.buskers.repository.domain.Busker;

public interface BuskerMapper {
	Busker selectBuskerByNo(int buskerNo);
}
