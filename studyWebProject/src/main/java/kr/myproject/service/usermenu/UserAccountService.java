package kr.myproject.service.usermenu;

import javax.servlet.http.HttpServletRequest;



public interface UserAccountService {

	//회원 로그인 처리
	boolean LoginComplete(HttpServletRequest request);

	//회원 아이디 찾기
	String searchUsersId(String mail);

}
