package kr.co.buskers.main.qna.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping("list-ajax.do")
	@ResponseBody
	public Map<String, Object> sortList(FreePage freePage) {
		Map<String, Object> result = service.sortList(freePage);
		
		return result;
	}
	

	@RequestMapping("/like.do")		
	@ResponseBody
	public Map<String,Object> BoardLike(QnaBoard qnaBoard,int boardType,String likeKind) {
//		System.out.println(qnaBoard.getBoardNo()+"번호");
//		System.out.println(likeKind+"종류");
		Map<String,Object> result = service.likeStatusUpdate(qnaBoard,boardType,likeKind);
		return result;
	}
	
	
	
	
	
	
	
	@RequestMapping("/comment-list.do")
	@ResponseBody
	public List<QnaBoardComment> commentList(int no) {  //int no 는 화면에서 넘겨준 파라미터값이 들어감.
		return service.commentList(no);
	}
	
	@RequestMapping("/comment-reply-list.do")
	@ResponseBody
	public List<QnaBoardComment> commentReplyList(int no) {  
		return service.commentReplyList(no);
	}
	@RequestMapping("/comment-delete.do")
	@ResponseBody
	public void commentDelete(int no) {  
		System.out.println(no);
		service.deleteComment(no);
	}
	
	
	
	@RequestMapping("/comment-write.do")
	@ResponseBody
	public void commentWrite(QnaBoardComment qnaBoardComment) {  //int no 는 화면에서 넘겨준 파라미터값이 들어감.
		service.writeComment(qnaBoardComment);
	
	}
	
	//이미지 업로드
	@RequestMapping("/imageupload.do")
	@ResponseBody
	public String profileUpload(MultipartFile file,HttpServletRequest request) throws Exception {
        String path = request.getRequestURI();
        String modulePath =path.substring(0, path.lastIndexOf("/") + 1);
        return service.uploadImage(file, modulePath);
	}
	
	@RequestMapping("download.do")
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//파라미터 정보 추출하기
			String path = request.getParameter("path");
			File f = new File(path);
			FileInputStream fis = new FileInputStream(f);
			BufferedInputStream bis = new BufferedInputStream(fis);
			OutputStream out = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(out);
			while(true) {
				int ch = bis.read();
				if(ch == -1) {
					break;
				}
				bos.write(ch);
			}
			bis.close();
			fis.close();
			bos.close();
			out.close();
	}
	
	
	
	
	
	
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
	    }
}
