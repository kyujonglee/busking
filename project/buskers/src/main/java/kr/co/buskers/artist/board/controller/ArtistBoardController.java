package kr.co.buskers.artist.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.artist.board.service.ArtistBoardService;
import kr.co.buskers.artist.main.service.ArtistMainService;
import kr.co.buskers.repository.domain.ArtistPhoto;
import kr.co.buskers.repository.domain.Alarm;
import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.Video;
import kr.co.buskers.repository.domain.VideoPage;

@Controller("kr.co.buskers.artist.board.controller.ArtistBoardController")
@RequestMapping("/artist/board")
public class ArtistBoardController {
	
	@Autowired
	private ArtistBoardService service;
	
	@Autowired
	private ArtistMainService mainService;
	
	
	@RequestMapping("enrollForm.do")
	public void enrollForm(Model model, int buskerNo) {
		model.addAttribute("genres",service.selectGenre());
		model.addAttribute("buskerNo",buskerNo);
	}
	
	@RequestMapping("enroll.do")
	public String insert(ArtistShow artistShow, int buskerNo, Model model) {
		service.insertArtistShow(artistShow);
		model.addAttribute("buskerNo",buskerNo);
		return "redirect:/artist/board/list.do";
	}
	
	@RequestMapping("list-ajax.do")
	@ResponseBody
	public List<ArtistShow> listAjax(int buskerNo){
		System.out.println("buskerNo : "+buskerNo);
		return service.selectArtistShow(buskerNo);
	}
	
	@RequestMapping("update-ajax.do")
	@ResponseBody
	public void updateAjax(ArtistShow artistShow) {
		service.updateWeather(artistShow);
	}
	
	@RequestMapping("list.do")
	public void list(int buskerNo, Model model){
		model.addAttribute("buskerNo",buskerNo);
	}
	
	@RequestMapping("detail.do")
	public void detail(int showNo, Model model, int buskerNo, Alarm alarm, HttpSession session) {
		service.insertShowAlarmIsReadStatus(alarm, session);
		model.addAttribute("show",service.selectArtistShowByNo(showNo));
		model.addAttribute("buskerNo",buskerNo);
	}
	
	@RequestMapping("updateForm.do")
	public void updateForm(int showNo, Model model,int buskerNo) {
		model.addAttribute("show",service.selectArtistShowByNo(showNo));
		model.addAttribute("buskerNo",buskerNo);
	}
	
	@RequestMapping("update.do")
	public String update(ArtistShow artistShow, int buskerNo) {
		service.updateArtistShowByNo(artistShow);
		return "redirect:/artist/board/detail.do?showNo="+artistShow.getShowNo()+"&buskerNo="+buskerNo;
	}
	
	@RequestMapping("delete.do")
	public String delete(int showNo,int buskerNo) {
		service.deleteArtistShowByNo(showNo);
		return "redirect:/artist/board/list.do?buskerNo="+buskerNo;
	}
	
	@RequestMapping("photo.do")
	public void photo() {
		
	}
	@RequestMapping("video.do")
	public void video() {
		
	}
	
	@RequestMapping("video-regist-ajax.do")
	@ResponseBody
	public void videoRegist(Video video) {
		service.insertVideo(video);
	}
	@RequestMapping("video-select-ajax.do")
	@ResponseBody
	public HashMap<String,Object> videoSelect(int buskerNo,VideoPage videoPage){
		return service.selectVideo(buskerNo, videoPage);
	}
	
	@RequestMapping("video-delete-ajax.do")
	@ResponseBody
	public void videoDelete(String videoNo) {
		int video = Integer.parseInt(videoNo);
		service.deleteVideo(video);
	}

	@RequestMapping("intro-update.do")
	@ResponseBody
	public void updateIntro (Busker busker) {
		mainService.updateIntro(busker);
	}
	
	@RequestMapping("select-photo-ajax.do")
	@ResponseBody
	public List<ArtistPhoto> selectPhoto(int buskerNo){
		return mainService.selectPhoto(buskerNo);
	}
	
	@RequestMapping("select-photo-no-ajax.do")
	@ResponseBody
	public ArtistPhoto selectPhotoByNo(int fileNo){
		return mainService.selectPhotoByNo(fileNo);
	}
	
	@RequestMapping("delete-photo.do")
	@ResponseBody
	public void deletePhoto(int fileNo) {
		mainService.deletePhoto(fileNo);
	}
	
	@RequestMapping("artist-photo-update.do")
	@ResponseBody
	public void updateBukserPhoto(Busker busker) {
		mainService.updateBukserPhoto(busker);
	}
}
