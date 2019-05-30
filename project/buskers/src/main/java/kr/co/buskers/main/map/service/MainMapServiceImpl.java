package kr.co.buskers.main.map.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.mapper.ArtistBoardMapper;

@Service
public class MainMapServiceImpl implements MainMapService {
	@Autowired
	private ArtistBoardMapper mapper;
	
	@Autowired
	private ServletContext context;
	
	@Override
	public void exportCSV() {
		List<ArtistShow> ab = mapper.selectArtistShow();
		try {
			System.out.println(context.getRealPath("resources/etc/places.csv"));
			
			BufferedWriter fw = new BufferedWriter(new FileWriter(
					context.getRealPath("resources/etc/places.csv"),false));
			fw.write("name,lat,lon");
			fw.newLine();
			for(int i =0;i < ab.size() ; i++) {
				fw.write(","+ab.get(i).getLat()+","+ab.get(i).getLon());
				fw.newLine();
			}
			fw.flush();
			fw.close();
			System.out.println("cvs파일 저장완료");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<ArtistShow> exportCSV(ArtistShow artistShow) {
		System.out.println("구들어옴"+artistShow.getGu());
		List<ArtistShow> ab = mapper.selectMainArtistShow(artistShow);
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(
					"C:/bit2019/workspace/0.Busking/project/buskers/src/main/webapp/resources/etc/places.csv",false));
			fw.write("name,lat,lon");
			fw.newLine();
			for(int i =0;i < ab.size() ; i++) {
				fw.write(","+ab.get(i).getLat()+","+ab.get(i).getLon());
				fw.newLine();
			}
			fw.flush();
			fw.close();
			System.out.println("cvs파일 저장완료");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
	}
}
