package kr.co.buskers.repository.mapper;

import kr.co.buskers.repository.domain.File;

public interface CommonMapper {
	void insertFile(File file);
	int selectGroupNo();
}
