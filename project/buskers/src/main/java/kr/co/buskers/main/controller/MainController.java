package kr.co.buskers.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.main.service.MainService;
import kr.co.buskers.repository.domain.ArtistPhoto;
import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.SearchPage;
import kr.co.buskers.repository.domain.Video;

@Controller("kr.co.buskers.main.controller.MainController")
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("main.do")
	public Map<String, Object> main(Model model, HttpSession session) {
		
		Map<String, Object> result = service.selectArtistShowToday(session);
		if (session.getAttribute("user") != null) {
			model.addAttribute("followArtistShow", result.get("followArtistShow"));
			model.addAttribute("followArtist", result.get("followArtist"));
		}
		model.addAttribute("artistShow", result.get("artistShow"));
		
		model.addAttribute("artistShowRecent", result.get("artistShowRecent"));
		model.addAttribute("artistVideoRecent", result.get("artistVideoRecent"));
		model.addAttribute("artistPhotoRecent", result.get("artistPhotoRecent"));
		
		service.exportCSV();
		
		return result;
	}
	
	@RequestMapping("map-ajax.do")
	@ResponseBody
	public void mapView(String enrollDate) {
		service.mapView(enrollDate);
	}

	@RequestMapping("show-ajax.do")
	@ResponseBody
	public List<ArtistShow> mapDetail(ArtistShow artistShow) {
		System.out.println("가져온 gu의값 "+artistShow.getGu());
		return service.mapDetail(artistShow);
	}
	
	@RequestMapping("location-show-ajax.do")
	@ResponseBody
	public List<ArtistShow> locationDetail(ArtistShow artistShow) {
		
		return service.locationDetail(artistShow);
	}
	
	@RequestMapping("marker-ajax.do")
	@ResponseBody
	public ArtistShow markerDetail(int showNo) {
		
		return service.markerDetail(showNo);
	}
	
	@RequestMapping("marker-hover-ajax.do")
	@ResponseBody
	public ArtistShow markerImage(int showNo) {
		
		return service.markerImage(showNo);
	}
	
	@RequestMapping("/search/search.do")
	public void mainSearch(SearchPage searchPage, Model model) {
		model.addAttribute("list",service.mainBoardSearch(searchPage));
		model.addAttribute("busker",service.mainBuskerSearch(searchPage));
		model.addAttribute("input",searchPage.getInput());
	}
	
	@RequestMapping("/search/board-search-list.do")
	public void boardSearchList(SearchPage searchPage, Model model) {
		HashMap<String,Object> map = service.BoardListSearch(searchPage);
//		SearchBoard b = (SearchBoard)map.get("list");
//		System.out.println(b.getTitle());
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pageResult",map.get("pageResult"));
		model.addAttribute("input",searchPage.getInput());
	}
	
	@RequestMapping("feed-photo-ajax.do")
	@ResponseBody
	public List<ArtistPhoto> selectFollowArtistPhotoList(HttpSession session) {
		return service.selectFollowArtistPhotoList(session);
	}
	
	@RequestMapping("feed-video-ajax.do")
	@ResponseBody
	public List<Video> selectFollowArtistVideoList(HttpSession session) {
		return service.selectFollowArtistVideoList(session);
	}
	@RequestMapping("/search/search-ajax.do")
	@ResponseBody
	public List<Busker> selectSearchBuskerList(String input){
		System.out.println("인풋은"+input);
		return service.selectSearchBuskerList(input);
	}
}
