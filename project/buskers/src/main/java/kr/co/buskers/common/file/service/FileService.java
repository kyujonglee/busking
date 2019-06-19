package kr.co.buskers.common.file.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.buskers.repository.domain.ArtistPhoto;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.File;
import kr.co.buskers.repository.domain.Member;
import kr.co.buskers.repository.domain.MusicFile;

public interface FileService {
	public File uploadImage(MultipartFile multipartFile, String uriPath) throws Exception; 
	public int insertFile(kr.co.buskers.repository.domain.File file) throws Exception;
	public void deleteFile(int groupNo) throws Exception;
	public Map<String, Object> selectFile(int groupNo) throws Exception;
		
	void insertMusic(MusicFile musicFile) throws Exception;
	
	void updateMusicByFileNo(MusicFile musicFile) throws Exception;
	
	// 프로필 이미지 업로드
	public void uploadProfile(MultipartFile multipartFile, String uriPath, Member member) throws Exception;
	
	public String insertArtistPhoto(ArtistPhoto artistPhoto) throws Exception;
	public String artistPhotoProfileUpdate(Busker busker, MultipartFile file) throws Exception;
}
