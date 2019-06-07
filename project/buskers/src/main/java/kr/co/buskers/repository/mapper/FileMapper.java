package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.File;
import kr.co.buskers.repository.domain.MusicFile;

public interface FileMapper {
	void insertFile(File file);
	List<File> selectFile(int groupNo);
	File selectFileMaxNo();
	void deleteFileAll(int groupNo);
	List<File> selectFileByGroupNo(int groupNo);
	
//  music
	List<MusicFile> selectMusic(int buskerNo);
	List<MusicFile> selectMusicByBuskerNo(int buskerNo);
	int countMusic(int buskerNo);
	
	void insertMusic(MusicFile musicFile);
	
	void deleteMusicByFileNo(int fileNo);
}
