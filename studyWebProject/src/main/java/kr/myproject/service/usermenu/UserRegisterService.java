package kr.myproject.service.usermenu;

import kr.myproject.domain.UserDTO;

public interface UserRegisterService {

	//회원 가입 시 아이디 중복 체크
	String checkId(String id);

	//회원 가입 시 닉네임 중복 체크
	String checkNickName(String nickName);

	//회원 가입 시 이메일 인증 처리
	String emailCheck(String email);

	//회원가입 처리하기
	void registerComplete(UserDTO uDto);

}
