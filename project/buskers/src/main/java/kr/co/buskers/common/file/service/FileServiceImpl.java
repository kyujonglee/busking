package kr.co.buskers.common.file.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.buskers.repository.domain.ArtistPhoto;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.Member;
import kr.co.buskers.repository.domain.MusicFile;
import kr.co.buskers.repository.mapper.ArtistBoardMapper;
import kr.co.buskers.repository.mapper.BuskerMapper;
import kr.co.buskers.repository.mapper.FileMapper;
import kr.co.buskers.repository.mapper.MemberMapper;

@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	private FileMapper mapper;
	
	@Autowired
	private BuskerMapper bMapper;
	
	@Autowired
	private MemberMapper mMapper;
	
	@Autowired
	private ArtistBoardMapper aMapper;
	
//	private final String FILE_PATH = "/Users/kyujong/Documents/bit2019/upload";
	private final String FILE_PATH = "C:/bit2019/upload";
	
	public FileServiceImpl() {
//		String OS = System.getProperty("os.name").toLowerCase();
	}
	
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
		System.out.println("insert 전");
		mapper.insertFile(f);
		System.out.println("insert 후");
		
		return f.getGroupNo();
	}
	
	
	
	public kr.co.buskers.repository.domain.File uploadImage(MultipartFile multipartFile, String uriPath) throws Exception {
		UUID uuid = UUID.randomUUID();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String uploadRoot = FILE_PATH;
		String path = uriPath + sdf.format(new Date()) + "/";
		String orgFileName = multipartFile.getOriginalFilename();
		String sysFileName = uuid.toString() + orgFileName;
		String filePath = uploadRoot + path;
		
		kr.co.buskers.repository.domain.File file = new kr.co.buskers.repository.domain.File();
		file.setName(multipartFile.getOriginalFilename());
		file.setSystemName(sysFileName);
		file.setPath(filePath);
		
		File f = new File(filePath + sysFileName);
		
	    if (f.exists() == false) {
	    	f.mkdirs();
	    }
	    
	    multipartFile.transferTo(f);
		
		return file;
	}
	
	@Override
	public void insertMusic(MusicFile musicFile) throws Exception {
		musicFile.setPath(musicUpload(musicFile));
		musicFile.setImgPath(imgUpload(musicFile));
		mapper.insertMusic(musicFile);
	}
	
	@Override
	public void updateMusicByFileNo(MusicFile musicFile) throws Exception {
		musicFile.setPath(musicUpload(musicFile));
		musicFile.setImgPath(imgUpload(musicFile));
		mapper.updateMusic(musicFile);
	}
	
	public String musicUpload(MusicFile musicFile) throws Exception {
		MultipartFile attach = musicFile.getAttach();
		
		System.out.println("사용자가 선택한 파일명 : "+attach.getOriginalFilename());
		
		UUID uuid = UUID.randomUUID();
		
		musicFile.setSysname(uuid.toString());
		musicFile.setName(attach.getOriginalFilename());
		
	    String buskerName = bMapper.selectBuskerByNo(musicFile.getBuskerNo()).getActivityName();
		
		String path = FILE_PATH+ "/"+buskerName;
		File file = new File(path);
		if(!file.exists()) file.mkdirs();
		
		path = FILE_PATH+ "/"+ buskerName +"/"+musicFile.getSysname()+".mp3";
		attach.transferTo(new File(path));
		
		path = "/upload/" + buskerName;
		path = path + "/" +musicFile.getSysname()+".mp3";
		return path;
	}
	
	public String imgUpload(MusicFile musicFile) throws Exception {
		MultipartFile attach2 = musicFile.getAttach2();
		
		System.out.println("사용자가 선택한 파일명 : "+attach2.getOriginalFilename());
		
		UUID uuid = UUID.randomUUID();
		
		musicFile.setSysname(uuid.toString());
		musicFile.setName(attach2.getOriginalFilename());
		
		String buskerName = bMapper.selectBuskerByNo(musicFile.getBuskerNo()).getActivityName();
		String path = FILE_PATH + "/" +buskerName;
		File file = new File(path);
		if(!file.exists()) file.mkdirs();
		
		path = FILE_PATH + "/"+ buskerName +"/"+musicFile.getSysname()+musicFile.getName();
		attach2.transferTo(new File(path));
		return path;
	}
	
	@Override
	public void uploadProfile(MultipartFile multipartFile, String uriPath, Member member) throws Exception {
		File prevFile = new File(member.getProfileImgPath() + member.getProfileImg());
		if(prevFile.exists() != false) {
			prevFile.delete();
	    } 
		
		UUID uuid = UUID.randomUUID();
		String uploadRoot = FILE_PATH;
		String path = uriPath + member.getId() + "/";
		String orgFileName = multipartFile.getOriginalFilename();
		String jpng = "";
		if (orgFileName.endsWith(".jpg") == true) {
			jpng = orgFileName.substring(orgFileName.indexOf(".jpg"));
		} else if (orgFileName.endsWith(".png") == true) {
			jpng = orgFileName.substring(orgFileName.indexOf(".png"));
		} else if (orgFileName.endsWith(".gif") == true) {
			jpng = orgFileName.substring(orgFileName.indexOf(".gif"));
		} else if (orgFileName.endsWith(".jpeg") == true) {
			jpng = orgFileName.substring(orgFileName.indexOf(".jpeg"));
		}
		String sysFileName = uuid.toString() + jpng;
		String filePath = uploadRoot + path;
		
		member.setProfileImg(sysFileName);
		member.setProfileImgPath(filePath);
		
		File f = new File(filePath + sysFileName);
	    if(f.exists() == false) {
	    	f.mkdirs();
	    }
	    
	    multipartFile.transferTo(f);
		
		mMapper.uploadProfile(member);
	}
 
	@Override
	public String insertArtistPhoto(ArtistPhoto artistPhoto) throws Exception{
		MultipartFile attach = artistPhoto.getFile();
		System.out.println("사용자가 선택한 파일명 : "+attach.getOriginalFilename());
		
		UUID uuid = UUID.randomUUID();
		
		artistPhoto.setName(attach.getOriginalFilename());
		artistPhoto.setSysname(uuid.toString()+attach.getOriginalFilename());
		String path = FILE_PATH + "/artistPhoto/"+ artistPhoto.getBuskerNo()+"/"+artistPhoto.getSysname();
		File file = new File(path);
		if(!file.exists()) file.mkdirs();
		attach.transferTo(file);
		
		path = FILE_PATH + "/artistPhoto/"+ artistPhoto.getBuskerNo()+"/";
		artistPhoto.setPath(path);
		aMapper.insertArtistPhoto(artistPhoto);
		return path+artistPhoto.getSysname();
	}
	

	@Override
	public String artistPhotoProfileUpdate(Busker busker, MultipartFile file) throws Exception{
//		System.out.println("사용자가 선택한 파일명 : "+file.getOriginalFilename());
		UUID uuid = UUID.randomUUID();
		String fileName = file.getOriginalFilename();
		String[] arr = fileName.split("\\.");
		String photoPath = FILE_PATH + "/artistProfilePhoto/"+ busker.getBuskerNo()+"/"+uuid.toString()+"."+arr[arr.length-1];
		busker.setPhoto(photoPath);
		File Nfile = new File(photoPath);
		if(!Nfile.exists()) Nfile.mkdirs();
		file.transferTo(Nfile);
		mMapper.updateBukserPhoto(busker);
		return photoPath;
	}
}
