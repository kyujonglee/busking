package kr.co.buskers.common.file.service;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.buskers.repository.domain.MusicFile;
import kr.co.buskers.repository.mapper.FileMapper;

@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	private FileMapper mapper;
	
	public void deleteFile(int groupNo) throws Exception {
		
		mapper.deleteFileAll(groupNo);
	}
	
	public Map<String, Object> selectFile(int groupNo) throws Exception {
		Map<String, Object> map = new HashMap<>();
		System.out.println("도달");
		map.put("file", mapper.selectFileByGroupNo(groupNo));
		System.out.println(mapper.selectFileByGroupNo(groupNo));
		return map;
	}
	
	public int insertFile(kr.co.buskers.repository.domain.File file) throws Exception {
		kr.co.buskers.repository.domain.File f = new kr.co.buskers.repository.domain.File();
		if (mapper.selectFileMaxNo() == null) {
			f.setGroupNo(1);
		} else {
			f.setGroupNo(mapper.selectFileMaxNo().getGroupNo() + 1);
		}
		if (file.getGroupNo() != 0) {
			f.setGroupNo(file.getGroupNo());
		}
		
		f.setName(file.getName());
		f.setPath(file.getPath());
		f.setSystemName(file.getSystemName());
			
		mapper.insertFile(f);
		
		return f.getGroupNo();
	}
	
	
	
	public kr.co.buskers.repository.domain.File uploadImage(MultipartFile multipartFile, String uriPath) throws Exception {
		UUID uuid = UUID.randomUUID();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = uriPath + sdf.format(new Date()) + "/";
		String orgFileName = multipartFile.getOriginalFilename();
		String sysFileName = uuid.toString() + orgFileName;
		String filePath = uploadRoot + path;
		
		kr.co.buskers.repository.domain.File file = new kr.co.buskers.repository.domain.File();
		file.setName(multipartFile.getOriginalFilename());
		file.setSystemName(sysFileName);
		file.setPath(filePath);
		
		File f = new File(filePath + sysFileName);
		
	    if(f.exists() == false) {
    	  f.mkdirs();
	    }
	    
	    multipartFile.transferTo(f);
		
		return file;
	}
	
	@Override
	public void insertMusic(MusicFile musicFile) throws Exception {
		MultipartFile attach = musicFile.getAttach();
		
		// 나중에 지울 것! 자바스크립트로 처리하면 됨!
		if(attach.isEmpty()) {
			System.out.println("file이 선택되지 않았습니다.");
		}
		
		System.out.println("사용자가 선택한 파일명 : "+attach.getOriginalFilename());
		
		UUID uuid = UUID.randomUUID();
		
		musicFile.setSysname(uuid.toString());
		musicFile.setName(attach.getOriginalFilename());
		String path = "/Users/kyujong/Documents/bit2019/upload/"+"busker1";
//		String path = "/Users/kyujong/Documents/bit2019/upload/"+musicFile.getBuskerName();
		File file = new File(path);
		if(!file.exists()) file.mkdirs();
		
		path = "/Users/kyujong/Documents/bit2019/upload/"+"busker1/"+musicFile.getSysname()+".mp3";
		attach.transferTo(new File(path));
		
		path = "/upload/" + "busker1";
//		path = "/upload/" + musicFile.getBuskerName();
		path = path + "/" +musicFile.getSysname()+".mp3";
		musicFile.setPath(path);
		musicFile.setBuskerNo(1); // 로그인한 버스커에 대한 정보를 세션을 통해 받을 것!
//		musicFile.setBuskerNo(musicFile.getBuskerNo());
		
		mapper.insertMusic(musicFile);
	}
}
