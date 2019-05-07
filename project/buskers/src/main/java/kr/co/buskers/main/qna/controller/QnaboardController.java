package kr.co.buskers.main.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.main.qna.QnaBoardService;
import kr.co.buskers.main.qna.QnaBoardServiceImpl;
import kr.co.buskers.repository.domain.QnaBoard;

@Controller
@RequestMapping("/main/board/qna")
public class QnaboardController {
	QnaBoardService service = new QnaBoardServiceImpl();
	
	@RequestMapping("/qnaboardwriteform.do")
	public void writeFrom() {}
	
	@RequestMapping("/qnaboardwrite.do")
	public String write(QnaBoard qnaBoard) {
		QnaBoard a = new QnaBoard();
		a.setBoardNo(1);
		a.setMemberNo(1);
		a.setTitle("ss");
		a.setContent("s");
		a.setGroupNo(2);
		service.write(a);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
}
