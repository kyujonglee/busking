package kr.co.buskers.main.service;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.common.page.FreePageResult;
import kr.co.buskers.repository.domain.ArtistPhoto;
import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.Member;
import kr.co.buskers.repository.domain.SearchBoard;
import kr.co.buskers.repository.domain.SearchPage;
import kr.co.buskers.repository.domain.Video;
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
				fw.write(","+as.get(i).getLat()+","+as.get(i).getLon()+","+as.get(i).getShowNo());
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
//		System.out.println(sdf.format(artistShow.getEnrollDate()));
//		System.out.println(artistShow.getGu());
		try {
			artistShow.setEnrollDate(sdf.parse(sdf.format(artistShow.getEnrollDate())));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		if (artistShow.getGu() == null) {
			List<ArtistShow> artistShowList = mapper.selectArtistShowDetailByDate(artistShow);
			return artistShowList;
		} else {
			System.out.println("씨발");
			System.out.println(artistShow.getGu());
			List<ArtistShow> artistShowList = mapper.selectArtistShowDetail(artistShow);
			return artistShowList;
		}
	}
	
	public ArtistShow markerDetail(int showNo) {
		ArtistShow artistShow = mapper.selectMarker(showNo);
		return artistShow;
	}
	
	public ArtistShow markerImage(int showNo) {
		ArtistShow artistShow = mapper.selectMarker(showNo);
		return artistShow;
	}

	@Override
	public List<SearchBoard> mainBoardSearch(SearchPage searchPage) {
		return mapper.selectSearchBoard(searchPage);
	}
	
	@Override
	public HashMap<String,Object> BoardListSearch(SearchPage searchPage) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("pageResult", new FreePageResult(searchPage.getPageNo(), mapper.selectCountSearchBoard(searchPage)));
//		System.out.println(mapper.selectCountSearchBoard(searchPage));
		map.put("list",mapper.selectSearchBoard(searchPage));
		return map;
	}
	
	public Map<String, Object> selectArtistShowToday(HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		if (session.getAttribute("user") != null) {
			Member member = (Member)session.getAttribute("user");
			
			map.put("followArtistShow", mapper.selectFollowArtistShow(member.getMemberNo()));
		}
		map.put("artistShow", mapper.selectArtistShowToday());
		return map;
	}
	
	public List<ArtistPhoto> selectFollowArtistPhotoList(HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		return mapper.selectFollowArtistPhotoList(member.getMemberNo());
	}
	
	public List<Video> selectFollowArtistVideoList(HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		return mapper.selectFollowArtistVideoList(member.getMemberNo());
	}

	@Override
	public Busker mainBuskerSearch(SearchPage searchPage) {
		return mapper.searchBusker(searchPage);
	}

	@Override
	public List<Busker> selectSearchBuskerList(String input) {
		return mapper.selectSearchBuskerList(input);
	}
}
