package kr.myproject.service.usermenu;

import javax.servlet.http.HttpServletRequest;

import kr.myproject.domain.UserDTO;



public interface UserAccountService {

	//회원 로그인 처리
	boolean LoginComplete(HttpServletRequest request);

	//회원 아이디 찾기
	String searchUsersId(String mail);

	//회원 비밀번호 변경 진행 절차 1 : id와 mail을 통해 일치하는 계정 여부 확인
	String serchUserAccountByIdAndMail(String id, String mail);

	//회원 비밀번호 변경 처리 진행
	int changePassword(String pw, String id);

	//회원정보 수정 페이지 이동 시 요청한 유저의 계정 정보 가져오기
	UserDTO getUserInfo(HttpServletRequest request);

}
