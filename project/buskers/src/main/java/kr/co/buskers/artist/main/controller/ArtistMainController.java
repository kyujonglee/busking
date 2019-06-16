package kr.co.buskers.artist.main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.artist.board.service.ArtistBoardService;
import kr.co.buskers.artist.main.service.ArtistMainService;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.Follow;
import kr.co.buskers.repository.domain.Member;
import kr.co.buskers.repository.domain.SocialUrl;

@Controller("kr.co.buskers.artist.main.controller.ArtistMainController")
@RequestMapping("/artist/main")
@Repository
public class ArtistMainController {
	
	@Autowired
	private ArtistMainService mainService;
	
	@Autowired
	private ArtistBoardService boardService;
	

	@RequestMapping("main.do")
	public void main(Model model,HttpSession session,int buskerNo) {
		model.addAttribute("audioList",mainService.selectMusicByBuskerNo(buskerNo));
		model.addAttribute("buskerNo",buskerNo);
		model.addAttribute("showList", boardService.selectArtistShow(buskerNo));
	}
	
	@RequestMapping("main-ajax.do")
	@ResponseBody
	public Map<String,Object> mainAjax(int buskerNo,HttpSession session){
		Map<String,Object> boardMap = mainService.artistMain(buskerNo);
		if(session.getAttribute("user") != null) {
			Member member = (Member)session.getAttribute("user");
			Follow follow = new Follow();
			follow.setMemberNo(member.getMemberNo());
			follow.setBuskerNo(buskerNo);
			boardMap.put("followStatus",mainService.followBuskerStatus(follow));
		}
		return boardMap;
	}
	
	@RequestMapping("main-recommend-ajax.do")
	@ResponseBody
	public List<Busker> selectRecommendArtist(int buskerNo){
		return mainService.selectRecommendArtist(buskerNo);
	}
	
	@RequestMapping("follow-ajax.do")
	@ResponseBody
	public int followAjax(Follow follow,Model model) {
		return mainService.followBusker(follow);
	}
	
	@RequestMapping("social-url.do")
	@ResponseBody
	public SocialUrl socialUrlinsert(SocialUrl socialUrl) {
		mainService.sociaUrlInsert(socialUrl);
		return socialUrl;
	}
	
	@RequestMapping("intro-update.do")
	@ResponseBody
	public void updateIntro (Busker busker) {
		mainService.updateIntro(busker);
	}
	
	@RequestMapping("chat-ajax.do")
	@ResponseBody
	public Busker selectBuskerActivityName(int buskerNo) {
		return mainService.selectBuskerActivityName(buskerNo);
	}
}
