package kr.co.buskers.main.qna.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.main.qna.service.QnaBoardService;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.QnaBoard;

@Controller("kr.co.buskers.main.qna.controller.QnaBoardController")
@RequestMapping("/main/board/qna")
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService service;
	
	@RequestMapping("/writeform.do")
	public void writeForm() {}
		
	@RequestMapping("/write.do")
	public String write(QnaBoard qnaBoard) {
		System.out.println(qnaBoard.getContent());
		System.out.println(qnaBoard.getTitle());
		System.out.println(qnaBoard.getMemberNo());
		service.write(qnaBoard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	

	@RequestMapping("list.do")
		public void list(FreePage freePage, Model model) {
		Map<String, Object> result = service.list(freePage);

		
		model.addAttribute("list", result.get("list"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	
	@RequestMapping("/detail.do")
	public void detail()  throws  Exception { 
	}
}
