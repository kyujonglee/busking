package kr.co.buskers.artist.music.service;

import java.util.List;

import kr.co.buskers.repository.domain.MusicFile;

public interface ArtistMusicService {
	List<MusicFile> selectMusic(int buskerNo);
	void deleteMusicByFileNo(int fileNo);
}
