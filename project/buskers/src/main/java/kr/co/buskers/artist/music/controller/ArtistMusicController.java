package kr.co.buskers.artist.music.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.buskers.artist.music.controller.ArtistMusicController")
@RequestMapping("artist/music")
public class ArtistMusicController {
	@RequestMapping("music-insertForm.do")
	public void insertForm() {}
}
