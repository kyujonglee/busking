package kr.co.buskers.common.file;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class funnyFileRenamePolicy implements  FileRenamePolicy{

	public File rename(File f) {
		// c:/bit2019/aaa.txt
		
		// c:/bit2019
		String parent = f.getParent();
		System.out.println("frp에서 사용자가 선택한parent"+parent);
		
		// 사용자가 선택한 이름
		String name = f.getName();
		System.out.println("frp에서 사용자가 선택한 이름"+name);
		//확장자
		String ext = "";
		
		//abcd.jpg
		// index : 4
		// name.substring(index) : .jpg
		
		String uName = UUID.randomUUID().toString();
		System.out.println("uName"+uName);
		int index = name.lastIndexOf(".");
		if (index != -1) ext = name.substring(index);
		
		
		//사용자가 선택한 파일 이름에서 확장자 부분은 유지하고 이름 부분만을 고유한 값으로 설정합니다.
		
		return new File(uName);
//		return new File(parent +"/"+uName+ext);
	}
}
