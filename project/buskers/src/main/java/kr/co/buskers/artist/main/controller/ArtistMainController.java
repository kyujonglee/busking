package kr.co.buskers.artist.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.buskers.artist.main.controller.BuskerMainController")
@RequestMapping("/artist/main")
public class ArtistMainController {
	@RequestMapping("main.do")
	public void main() {}
}
