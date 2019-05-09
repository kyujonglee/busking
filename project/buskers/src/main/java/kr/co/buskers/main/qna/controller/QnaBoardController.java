package kr.co.buskers.main.qna.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.main.qna.service.QnaBoardService;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.QnaBoard;
import kr.co.buskers.repository.domain.QnaBoardComment;

@Controller("kr.co.buskers.main.qna.controller.QnaBoardController")
@RequestMapping("/main/board/qna")
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService service;
	
	@RequestMapping("/writeform.do")
	public void writeForm() {}
		
	@RequestMapping("/write.do")
	public String write(QnaBoard qnaBoard) {
		service.write(qnaBoard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
		
	
	@RequestMapping("/delete.do") public String delete(int no) {
	   service.delete(no); 
	   return UrlBasedViewResolver.REDIRECT_URL_PREFIX +"list.do"; 
    }
	

	@RequestMapping("/update.do")
	public String update(QnaBoard qnaBoard)  { 
		service.update(qnaBoard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "detail.do?no="+qnaBoard.getBoardNo();
	}
	
	@RequestMapping("/updateform.do")
	public void updateForm(int no,Model model)  { 
		model.addAttribute("board",service.updateForm(no));
	}
 

	
	@RequestMapping("/list.do")
	public void list(FreePage freePage, Model model) {
		Map<String, Object> result = service.list(freePage);
		model.addAttribute("list", result.get("list"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}

	@RequestMapping("/like.do")		
	@ResponseBody
	public Map<String,Object> test01(QnaBoard qnaBoard) {
		Map<String,Object> result = service.likeStatusUpdate(qnaBoard);
		return result;
	}
	
	@RequestMapping("/comment-list.do")
	@ResponseBody
	public List<QnaBoardComment> commentList(int no) {  //int no 는 화면에서 넘겨준 파라미터값이 들어감.
		System.out.println(no);
		return service.commentList(no);
	}

	
	
	
	
	 @RequestMapping(value = "/detail.do")
	   public ModelAndView detail(HttpServletRequest request, HttpServletResponse response, HttpSession session, int no) {
		 // 해당 게시판 번호를 받아 리뷰 상세페이지로 넘겨줌
	        QnaBoard qnaBoard = service.detail(no);
	        ModelAndView view = new ModelAndView();
	        Cookie[] cookies = request.getCookies();
	        // 비교하기 위해 새로운 쿠키
	        Cookie viewCookie = null;
	 
	        // 쿠키가 있을 경우 
	        if (cookies != null && cookies.length > 0) {
	            for (int i = 0; i < cookies.length; i++){
	                // Cookie의 name이 cookie + qnaBoardNo와 일치하는 쿠키를 viewCookie에 넣어줌 
	                if (cookies[i].getName().equals("cookie"+no)){ 
	                    viewCookie = cookies[i];
	                }
	            }
	        }
	        
	        if (qnaBoard != null) {
	            view.addObject("qnaBoard", qnaBoard);
	            
	            if (viewCookie == null) {    
	                System.out.println("cookie 없음");
	                
	                // 쿠키 생성(이름, 값)
	                Cookie newCookie = new Cookie("cookie"+no, "|" + no + "|");
	                                
	                // 쿠키 추가
	                response.addCookie(newCookie);
	 
	                // 쿠키를 추가 시키고 조회수 증가시킴
	                service.updateViewCnt(no);;
	            }
	            // viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
	            else {
//	                System.out.println("cookie 있음");
	                
	                // 쿠키 값 받아옴.
	                String value = viewCookie.getValue();
//	                System.out.println("cookie 값 : " + value);
	            }
	            
	            view.addObject("board",	qnaBoard);
	            view.setViewName("main/board/qna/detail");
	        } 
	        return view;
	    }
}
