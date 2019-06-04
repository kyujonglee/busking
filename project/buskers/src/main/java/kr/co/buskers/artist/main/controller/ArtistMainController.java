package kr.co.buskers.artist.main.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.artist.main.service.ArtistMainService;

@Controller("kr.co.buskers.artist.main.controller.ArtistMainController")
@RequestMapping("/artist/main")
public class ArtistMainController {
	
	@Autowired
	private ArtistMainService mainService;
	
	@RequestMapping("main.do")
	public void main() {}
	
	@RequestMapping("main-ajax.do")
	@ResponseBody
	public Map<String,Object> mainAjax(){
		Map<String,Object> boardMap = mainService.artistMain();
		return boardMap;
	}
}
