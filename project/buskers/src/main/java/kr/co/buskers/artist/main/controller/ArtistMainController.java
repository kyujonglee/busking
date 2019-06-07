package kr.co.buskers.artist.main.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.artist.main.service.ArtistMainService;

@Controller("kr.co.buskers.artist.main.controller.ArtistMainController")
@RequestMapping("/artist/main")
public class ArtistMainController {
	
	@Autowired
	private ArtistMainService mainService;
	
	@RequestMapping("main.do")
	public void main(Model model) {
//	public void main(Model model,int buskerNo) {
		model.addAttribute("audioList",mainService.selectMusicByBuskerNo(1));
//		model.addAttribute("audioList",mainService.selectMusicByBuskerNo(buskerNo));
	}
	
	@RequestMapping("main-ajax.do")
	@ResponseBody
	public Map<String,Object> mainAjax(int buskerNo){
		Map<String,Object> boardMap = mainService.artistMain(buskerNo);
		return boardMap;
	}
}
