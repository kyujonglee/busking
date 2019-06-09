package kr.co.buskers.artist.music.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.artist.music.service.ArtistMusicService;
import kr.co.buskers.repository.domain.MusicFile;

@Controller("kr.co.buskers.artist.music.controller.ArtistMusicController")
@RequestMapping("artist/music")
public class ArtistMusicController {
	
	@Autowired
	private ArtistMusicService service;
	
	@RequestMapping("music-insertForm.do")
	public void insertForm() {}
	
	
	@RequestMapping("music-list.do")
	public void list() {}
	
	
	
	@RequestMapping("music-list-ajax.do")
	@ResponseBody
	public List<MusicFile> listAjax(int buskerNo) {
		return service.selectMusic(buskerNo);
	}
	
	@RequestMapping("music-item-ajax.do")
	@ResponseBody
	public MusicFile musicItem(int fileNo) {
		return service.selectMusicByFileNo(fileNo);
	}
	
	@RequestMapping("music-delete-ajax.do")
	@ResponseBody
	public void deleteAjax(int fileNo) {
		service.deleteMusicByFileNo(fileNo);
	}
}

