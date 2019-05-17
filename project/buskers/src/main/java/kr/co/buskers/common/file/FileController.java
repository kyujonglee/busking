package kr.co.buskers.common.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/file")
@Controller
public class FileController {
	
	@Autowired
	private FileService service;
	
	@RequestMapping("insert-file-ajax.do")
	@ResponseBody
	public int insertFile(kr.co.buskers.repository.domain.File file) throws Exception {
		return service.insertFile(file);
	}
	
	@RequestMapping("image-upload.do")
	@ResponseBody
	public kr.co.buskers.repository.domain.File FileUpload(MultipartFile file, String uriPath) throws Exception {
        return service.uploadImage(file, uriPath);
	}
	
	@RequestMapping("download.do")
	public void download(String path, HttpServletResponse response) throws IOException {

		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		
		while(true) {
			int ch = bis.read();
			if (ch == -1) {
				break;
			}
			bos.write(ch);
		}
		bis.close();
		fis.close();
		bos.close();
		out.close();
	}
	
	@RequestMapping("download-file.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 파라미터 정보 추출하기
		// path(저장된 파일의 경로), name(실제 저장된 파일이름)
		
//		String uploadRoot = "c:/bit2019/upload";
		
		String path = request.getParameter("path");
		String name = request.getParameter("name");
		// 다운로드 할 파일 이름
		String dName = request.getParameter("dname");
		
		System.out.println("path: " + path);
		System.out.println("name: " + name);
		
		File f = new File(path, name);
		
		// 전송하는 데이터의 해석 정보
		if (dName == null) {
			response.setHeader("Content-Type", "image/jpg");
		} else { 
			response.setHeader("Content-Type", "application/octet-stream");
			// 한글이름 처리하기
			dName = new String(dName.getBytes("utf-8"), "8859_1");
			response.setHeader("Content-Disposition", "attachment;filename=" + dName);
		}
		
		// 파일을 읽고 사용자에게 전송
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		while (true) {
			int ch = bis.read();
			if (ch == -1) {
				break;
			}
			bos.write(ch);
		}
		bis.close();
		bos.close();
		bis.close();
		out.close();
	}
}
