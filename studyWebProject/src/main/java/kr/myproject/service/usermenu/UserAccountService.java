package kr.myproject.service.usermenu;

import javax.servlet.http.HttpServletRequest;



public interface UserAccountService {

	//회원 로그인 처리
	boolean LoginComplete(HttpServletRequest request);

	//회원 아이디 찾기
	String searchUsersId(String mail);

	//회원 비밀번호 찾기 진행 절차 1 : id와 mail을 통해 일치하는 계정 여부 확인
	boolean serchUserAccountByIdAndMail(String id, String mail);

}
