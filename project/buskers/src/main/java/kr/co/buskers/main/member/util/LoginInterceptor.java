package kr.co.buskers.main.member.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.RedirectException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		
		if(obj == null) {
			
			response.sendRedirect("/buskers/main/member/loginform.do");
			throw new RedirectException("로그인이 필요합니다.");
		}
		
		return true;
	}
	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
		
		super.postHandle(request, response, handler, modelAndView);
    }     
	
	@Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
		request.setAttribute("msg", "msgOk2");
        super.afterCompletion(request, response, handler, ex);
    }


}
