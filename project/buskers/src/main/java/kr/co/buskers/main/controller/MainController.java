package kr.co.buskers.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.main.service.MainService;
import kr.co.buskers.repository.domain.ArtistShow;

@Controller("kr.co.buskers.main.controller.MainController")
@RequestMapping("/main")
public class MainController {
	
	
	@Autowired
	private MainService service;
	
	@RequestMapping("main.do")
	public void main() {
		service.exportCSV();
	}

	@RequestMapping("mainmap-ajax.do")
	@ResponseBody
	public List<ArtistShow> mainMap(ArtistShow artistShow) {
		System.out.println("구는"+artistShow.getGu());
		
		
		return service.exportCSV(artistShow);
	}
}
