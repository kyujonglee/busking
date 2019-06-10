package kr.co.buskers.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.main.service.MainService;
import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.SearchPage;

@Controller("kr.co.buskers.main.controller.MainController")
@RequestMapping("/main")
public class MainController {
	
	
	@Autowired
	private MainService service;
	
	@RequestMapping("main.do")
	public Map<String, Object> main(Model model) {
		Map<String, Object> result = service.selectArtistByGenre();
		model.addAttribute("Genre1", result.get("Genre1"));
		model.addAttribute("Genre2", result.get("Genre2"));
		model.addAttribute("Genre3", result.get("Genre3"));
		model.addAttribute("Genre4", result.get("Genre4"));
		model.addAttribute("Genre5", result.get("Genre5"));
		model.addAttribute("Genre6", result.get("Genre6"));
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

		return service.mapDetail(artistShow);
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
	public void mainSearch(SearchPage searchPage,Model model) {
		model.addAttribute("list",service.mainBoardSearch(searchPage));
		model.addAttribute("busker",service.mainBuskerSearch(searchPage));
		model.addAttribute("input",searchPage.getInput());
	}
	
	@RequestMapping("/search/board-search-list.do")
	public void boardSearchList(SearchPage searchPage,Model model) {
		HashMap<String,Object> map = service.BoardListSearch(searchPage);
//		SearchBoard b = (SearchBoard)map.get("list");
//		System.out.println(b.getTitle());
		model.addAttribute("list",map.get("list"));
		model.addAttribute("pageResult",map.get("pageResult"));
		model.addAttribute("input",searchPage.getInput());
	}
}
