package kr.co.buskers.main.service;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	
	public void exportCSV() {
		List<ArtistShow> as = mapper.selectArtistShow();
		try {
			System.out.println(context.getRealPath("resources/etc/places.csv"));
			
			BufferedWriter fw = new BufferedWriter(new FileWriter(
					context.getRealPath("resources/etc/places.csv"),false));
			fw.write("name,lat,lon,id");
			fw.newLine();
			for(int i =0;i < as.size() ; i++) {
				fw.write(","+as.get(i).getLat()+","+as.get(i).getLon());
				fw.newLine();
			}
			fw.flush();
			fw.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void mapView(String enrollDate) {
		List<ArtistShow> as = mapper.selectArtistShowByDate(enrollDate);
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(
					context.getRealPath("resources/etc/places.csv"),false));
			fw.write("name,lat,lon,id");
			fw.newLine();
			for(int i =0;i < as.size() ; i++) {
				fw.write(","+as.get(i).getLat()+","+as.get(i).getLon());
				fw.newLine();
			}
			fw.flush();
			fw.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ArtistShow> mapDetail(ArtistShow artistShow) {
		System.out.println(artistShow.getEnrollDate());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.format(artistShow.getEnrollDate());
		System.out.println(sdf.format(artistShow.getEnrollDate()));
		System.out.println(artistShow.getGu());
		try {
			artistShow.setEnrollDate(sdf.parse(sdf.format(artistShow.getEnrollDate())));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		List<ArtistShow> artistShowList = mapper.selectArtistShowDetail(artistShow);
		return artistShowList;
	}
}
