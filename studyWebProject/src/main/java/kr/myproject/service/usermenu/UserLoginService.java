package kr.myproject.service.usermenu;

import javax.servlet.http.HttpServletRequest;



public interface UserLoginService {

	//회원 로그인 처리
	boolean LoginComplete(HttpServletRequest request);

}
