package kr.myproject.service.usermenu;



public interface UserRegisterService {

	//회원 가입 시 아이디 중복 체크
	String checkId(String id);

	//회원 가입 시 닉네임 중복 체크
	String checkNickName(String nickName);

}
