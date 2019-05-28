package kr.co.buskers.artist.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.buskers.artist.board.service.ArtistBoardService;
import kr.co.buskers.repository.domain.ArtistShow;

@Controller("kr.co.buskers.artist.board.controller.BuskerBoardController")
@RequestMapping("/artist/board")
public class ArtistBoardController {
	
	@Autowired
	private ArtistBoardService service;
	
	@RequestMapping("enrollForm.do")
	public void enrollForm() {}
	
	@RequestMapping("enroll.do")
	public String enroll(ArtistShow artistShow) {
		service.insertArtistShow(artistShow);
		return "redirect:/artist/main/main.do";
	}
	
	@RequestMapping("list.do")
	public void list(){
		
	}
}
