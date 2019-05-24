package kr.co.buskers.common.file.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.buskers.repository.mapper.FileMapper;

@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	private FileMapper mapper;
	
	public Map<String, Object> deleteFile(int groupNo) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		mapper.deleteFileAll(groupNo);
		map.put("file", mapper.selectFileByGroupNo(groupNo));
		
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
		
		System.out.println(filePath + sysFileName);
		
	    if(f.exists() == false) {
    	  f.mkdirs();
	    }
	    
	    multipartFile.transferTo(f);
		
		return file;
	}
}
