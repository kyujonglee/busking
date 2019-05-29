package kr.co.buskers.artist.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.artist.board.service.ArtistBoardService;
import kr.co.buskers.repository.domain.ArtistShow;

@Controller("kr.co.buskers.artist.board.controller.ArtistBoardController")
@RequestMapping("/artist/board")
public class ArtistBoardController {
	
	@Autowired
	private ArtistBoardService service;
	
	@RequestMapping("enrollForm.do")
	public void enrollForm() {}
	
	@RequestMapping("enroll.do")
	public String enroll(ArtistShow artistShow) {
		service.insertArtistShow(artistShow);
		return "redirect:/artist/board/list.do";
	}
	
	@RequestMapping("list-ajax.do")
	@ResponseBody
	public List<ArtistShow> listAjax(){
		return service.selectArtistShow();
	}
	@RequestMapping("list.do")
	public void list(){}
}
