package kr.co.buskers.main.qna.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.main.qna.service.QnaService;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Like;
import kr.co.buskers.repository.domain.QnaBoard;
import kr.co.buskers.repository.domain.QnaBoardComment;

@Controller("kr.co.buskers.main.qna.controller.QnaBoardController")
@RequestMapping("/main/board/qna")
public class QnaBoardController {

	@Autowired
	private QnaService service;
	
	@RequestMapping("list.do")
	public void list(FreePage freePage, Model model, HttpSession session) {
		Map<String, Object> result = service.list(freePage);
		System.out.println(result.get("searchType"));
		model.addAttribute("searchType", result.get("searchType"));
		model.addAttribute("input", result.get("input"));
		model.addAttribute("sortType", result.get("sortType"));
		model.addAttribute("notifyList", result.get("notifyList"));
		model.addAttribute("list", result.get("list"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	
	@RequestMapping("list-ajax.do")
	@ResponseBody
	public Map<String, Object> sortList(FreePage freePage) {
		Map<String, Object> result = service.sortList(freePage);
		
		return result;
	}
	
	@RequestMapping("like-ajax.do")
	@ResponseBody
	public int updateLikeStatus(Like like, Model model) {
		
		return service.updateLikeStatus(like);
	}
	
	@RequestMapping("comment-ajax.do")
	@ResponseBody
	public Map<String, Object> insertComment(QnaBoardComment qnaBoardComment, Model model) {
		Map<String, Object> result = service.insertComment(qnaBoardComment);
		
		model.addAttribute("comment", result.get("comment"));
		model.addAttribute("reply", result.get("reply"));
		
		return result;
	}
	
	@RequestMapping("delete-comment-ajax.do")
	@ResponseBody
	public void deleteComment(int commentNo) {
		service.deleteComment(commentNo);
	}
	
	@RequestMapping("reply-ajax.do")
	@ResponseBody
	public Map<String, Object> insertReply(QnaBoardComment qnaBoardComment, Model model) {
		Map<String, Object> result = service.insertReply(qnaBoardComment);
		
		model.addAttribute("comment", result.get("comment"));
		model.addAttribute("reply", result.get("reply"));
		
		return result;
	}
	
	@RequestMapping("update-comment-ajax.do")
	@ResponseBody
	public Map<String, Object> updateComment(QnaBoardComment qnaBoardComment, Model model) {
		Map<String, Object> result = service.updateComment(qnaBoardComment);
		
		model.addAttribute("comment", result.get("comment"));
		model.addAttribute("reply", result.get("reply"));
		
		return result;
	}
	
	@RequestMapping("detail.do")
	public void detail(int boardNo, Model model, HttpSession session) {
		Map<String, Object> result = service.detail(boardNo, session);
		if (session.getAttribute("user") != null) {
			model.addAttribute("like", result.get("like"));
		}
		model.addAttribute("highestLikeComment", result.get("highestLikeComment"));
		model.addAttribute("file", result.get("file"));
		model.addAttribute("reply", result.get("reply"));
		model.addAttribute("comment", result.get("comment"));
		model.addAttribute("board", result.get("board"));
	}
	
	@RequestMapping("write-form.do")
	public void writeForm() {}
	
	@RequestMapping("update-form.do")
	public Map<String, Object> updateForm(int boardNo, Model model) {
		Map<String, Object> result = service.updateForm(boardNo);
		model.addAttribute("board", result.get("board"));
		
		return result;
	}
	
	@RequestMapping("write.do")
	public String write(QnaBoard qnaBoard) {
		service.write(qnaBoard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("update.do")
	public String update(QnaBoard qnaBoard) {
		service.update(qnaBoard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(QnaBoard qnaBoard) {
		service.delete(qnaBoard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("like-comment-ajax.do")		
	@ResponseBody
	public Map<String, String> insertCommentLike(Like like, Model model) {
		Map<String, String> result = service.insertCommentLike(like);
		
		model.addAttribute("likeCount", result.get("likeCount"));
		model.addAttribute("likeStatus", result.get("likeStatus"));
		
		return result;
	}
	
	@RequestMapping("is-liked-comment-ajax.do")		
	@ResponseBody
	public Map<String, Object> listIsLikedComment(int memberNo, Model model) {
		Map<String, Object> result = service.listIsLikedComment(memberNo);
		
		model.addAttribute("isLikedComment", result.get("isLikedComment"));
		
		return result;
	}
	
	@RequestMapping("dislike-comment-ajax.do")		
	@ResponseBody
	public Map<String, String> insertCommentDislike(Like like, Model model) {
		Map<String, String> result = service.insertCommentDislike(like);
		
		model.addAttribute("dislikeCount", result.get("dislikeCount"));
		model.addAttribute("dislikeStatus", result.get("dislikeStatus"));
		
		return result;
	}
	
	@RequestMapping("is-disliked-comment-ajax.do")		
	@ResponseBody
	public Map<String, Object> listIsDislikedComment(int memberNo, Model model) {
		Map<String, Object> result = service.listIsDislikedComment(memberNo);
		
		model.addAttribute("isDislikedComment", result.get("isDislikedComment"));
		
		return result;
	}
	
	/* 기존 디테일 조회
	 @RequestMapping(value = "/detail.do")
	   public ModelAndView detail(HttpServletRequest request, HttpServletResponse response, HttpSession session, int boardNo) {
		 // 해당 게시판 번호를 받아 리뷰 상세페이지로 넘겨줌
	        QnaBoard qnaBoard = service.detail(boardNo);
	        ModelAndView view = new ModelAndView();
	        Cookie[] cookies = request.getCookies();
	        // 비교하기 위해 새로운 쿠키
	        Cookie viewCookie = null;
	 
	        // 쿠키가 있을 경우 
	        if (cookies != null && cookies.length > 0) {
	            for (int i = 0; i < cookies.length; i++){
	                // Cookie의 name이 cookie + qnaBoardNo와 일치하는 쿠키를 viewCookie에 넣어줌 
	                if (cookies[i].getName().equals("cookie"+boardNo)){ 
	                    viewCookie = cookies[i];
	                }
	            }
	        }
	        
	        if (qnaBoard != null) {
	            
	            if (viewCookie == null) {    
	                System.out.println("cookie 없음");
	                
	                // 쿠키 생성(이름, 값)
	                Cookie newCookie = new Cookie("cookie"+boardNo, "|" + boardNo + "|");
	                // 쿠키 추가
	                response.addCookie(newCookie);
	                                
	                // 쿠키를 추가 시키고 조회수 증가시킴
	                service.updateViewCnt(boardNo);;
	 
	            }
	            // viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
	            else {
//	                System.out.println("cookie 있음");
	                
	                // 쿠키 값 받아옴.
	                String value = viewCookie.getValue();
//	                System.out.println("cookie 값 : " + value);
	            }
	            qnaBoard = service.detail(boardNo);
	            view.addObject("board",	qnaBoard);
	            view.setViewName("main/board/qna/detail");
	        } 
	        return view;
	    }*/
}
