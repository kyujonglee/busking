package kr.co.buskers.artist.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String insert(ArtistShow artistShow) {
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
	
	@RequestMapping("detail.do")
	public void detail(int showNo,Model model) {
		model.addAttribute("show",service.selectArtistShowByNo(showNo));
	}
	
	@RequestMapping("updateForm.do")
	public void updateForm(int showNo, Model model) {
		model.addAttribute("show",service.selectArtistShowByNo(showNo));
	}
	
	@RequestMapping("update.do")
	public String update(ArtistShow artistShow) {
		service.updateArtistShowByNo(artistShow);
		return "redirect:/artist/board/detail.do?showNo="+artistShow.getShowNo();
	}
	
	@RequestMapping("delete.do")
	public String delete(int showNo) {
		service.deleteArtistShowByNo(showNo);
		return "redirect:/artist/board/list.do";
	}
}
