package kr.co.buskers.main.service;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainMapper mapper;
	
	@Autowired
	private ServletContext context;
	
	@Override
	public void exportCSV() {
		List<ArtistShow> ab = mapper.selectArtistShow();
		try {
			System.out.println(context.getRealPath("resources/etc/places.csv"));
			
			BufferedWriter fw = new BufferedWriter(new FileWriter(
					context.getRealPath("resources/etc/places.csv"),false));
			fw.write("name,lat,lon,id");
			fw.newLine();
			for(int i =0;i < ab.size() ; i++) {
				fw.write(","+ab.get(i).getLat()+","+ab.get(i).getLon()+","+ab.get(i).getShowNo());
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
//		artistShow.setEnrollDate(enrollDate);
		List<ArtistShow> ab = mapper.selectMainArtistShow(artistShow);
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(
					context.getRealPath("resources/etc/places.csv"),false));
			fw.write("name,lat,lon,id");
			fw.newLine();
			for(int i =0;i < ab.size() ; i++) {
				fw.write(","+ab.get(i).getLat()+","+ab.get(i).getLon()+","+ab.get(i).getShowNo());
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
