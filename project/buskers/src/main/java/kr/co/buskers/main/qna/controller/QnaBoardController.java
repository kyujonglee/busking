package kr.co.buskers.main.qna.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.main.qna.service.QnaBoardService;
import kr.co.buskers.repository.domain.QnaBoard;

@Controller
@RequestMapping("/main/board/qna")
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService service;
	
	@RequestMapping("/writeform.do")
	public void writeFrom() {}
		
	@RequestMapping("/boardwrite.do")
	public String write(QnaBoard qnaBoard) {
		System.out.println(qnaBoard.getContent());
		System.out.println(qnaBoard.getTitle());
		System.out.println(qnaBoard.getMemberNo());
		
		service.write(qnaBoard);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	

	@ResponseBody
	@RequestMapping("/image.do")
	public void uploadAjax(MultipartFile file) throws Exception{
		System.out.println("image.do들어옴");
	}
	
	
}
