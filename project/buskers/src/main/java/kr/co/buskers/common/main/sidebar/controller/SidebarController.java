
package kr.co.buskers.common.main.sidebar.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.common.main.sidebar.service.SidebarService;


@Controller
@RequestMapping("main/sidebar")
public class SidebarController {
	
	@Autowired
	private SidebarService service;
	
	@RequestMapping("artist-genre.do")
	@ResponseBody
	public Map<String, Object> ArtistGenreList(Model model) {
		Map<String, Object> result = service.ArtistGenreList();
		model.addAttribute("genre1", result.get("genre1"));
		model.addAttribute("genre2", result.get("genre2"));
		model.addAttribute("genre3", result.get("genre3"));
		model.addAttribute("genre4", result.get("genre4"));
		model.addAttribute("genre5", result.get("genre5"));
		model.addAttribute("genre6", result.get("genre6"));
		
		return result;
	}
}
