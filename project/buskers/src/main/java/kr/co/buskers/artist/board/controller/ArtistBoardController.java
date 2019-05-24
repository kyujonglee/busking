package kr.co.buskers.artist.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.buskers.artist.board.controller.BuskerBoardController")
@RequestMapping("/artist/board")
public class ArtistBoardController {
	@RequestMapping("enrollForm.do")
	public void enrollForm() {}
}
