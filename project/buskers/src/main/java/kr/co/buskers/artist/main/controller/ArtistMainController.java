package kr.co.buskers.artist.main.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	

	@RequestMapping("main.do")
	public void main(Model model,HttpSession session,int buskerNo) {
		System.out.println("buskerNo : "+buskerNo);
		model.addAttribute("audioList",mainService.selectMusicByBuskerNo(buskerNo));
//		model.addAttribute("audioList",mainService.selectMusicByBuskerNo(buskerNo));
		
		
		//버스커 no 값을 파라미터로 가져와야함... 1또는 0을 반환함 셋팅해준뒤 화면처리 필요!
		//세션에서 유저를가져옴
		if(session.getAttribute("user") != null) {
			Member member = (Member)session.getAttribute("user");
			Follow follow = new Follow();
			follow.setMemberNo(member.getMemberNo());
			follow.setBuskerNo(buskerNo);
			model.addAttribute("followStatus",mainService.followBuskerStatus(follow));
		}
		//버스커 소개 가져오기
		model.addAttribute("busker",mainService.selectBusker(buskerNo));
		//url 링크 가져오기
		model.addAttribute("socialUrl",mainService.selectSocialUrl(buskerNo));
		
	}
	
	
	
	
	@RequestMapping("main-ajax.do")
	@ResponseBody
	public Map<String,Object> mainAjax(int buskerNo,HttpSession session){
		Map<String,Object> boardMap = mainService.artistMain(buskerNo);
		return boardMap;
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
	
}
