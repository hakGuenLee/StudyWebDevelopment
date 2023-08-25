package kr.myproject.Interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class UserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {	

		HttpSession session = request.getSession();
		
		Object UserDTO = session.getAttribute("userDTO");
		
		//인터셉터 발동 전 페이지 주소값을 session에 셋팅
		String path = (String)request.getHeader("REFERER");
		session.setAttribute("prev_url", path);
		
		//로그인되지 않은 상태에서 접근 시 로그인 페이지 띄우기
		if(UserDTO == null) {
			response.sendRedirect("/study/userAccount/loginPage");
			
			return false;
		}else {
				
			return true;
		}
	}
	
}
