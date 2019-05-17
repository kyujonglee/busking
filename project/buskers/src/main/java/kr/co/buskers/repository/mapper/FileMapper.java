package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.File;

public interface FileMapper {
	void insertFile(File file);
	List<File> selectFile(int groupNo);
	File selectFileMaxNo();
}
