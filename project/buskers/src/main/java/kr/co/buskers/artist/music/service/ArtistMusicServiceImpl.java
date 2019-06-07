package kr.co.buskers.artist.music.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.MusicFile;
import kr.co.buskers.repository.mapper.FileMapper;

@Service
public class ArtistMusicServiceImpl implements ArtistMusicService{
	
	@Autowired
	private FileMapper mapper;
	
	@Override
	public List<MusicFile> selectMusic(int buskerNo){
		return mapper.selectMusic(1);
	}
	
	@Override
	public void deleteMusicByFileNo(int fileNo) {
		mapper.deleteMusicByFileNo(fileNo);
	}
}