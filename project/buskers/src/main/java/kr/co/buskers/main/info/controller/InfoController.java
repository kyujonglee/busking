package kr.co.buskers.main.info.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.main.info.service.InfoService;
import kr.co.buskers.repository.domain.Video;

@Controller("kr.co.buskers.main.info.controller.InfoController")
@RequestMapping("main/info")
public class InfoController {
	
	@Autowired
	private InfoService service;
	
	@RequestMapping("info.do")
	public void info(Model model) {
		System.out.println("info method 통과!");
		model.addAttribute("map",service.list());
	}
	
	@RequestMapping("video-list-ajax.do")
	@ResponseBody
	public List<Video> videoList(){
		return service.videoList();
	}
	
	@RequestMapping("video-item-ajax.do")
	@ResponseBody
	public List<Video> videoItem(int buskerNo){
		return service.videoItem(buskerNo);
	}
	
	@RequestMapping("video-one-ajax.do")
	@ResponseBody
	public Video videoONE(int buskerNo){
		return service.videoONE(buskerNo);
	}
}
