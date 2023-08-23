package kr.myproject.service.usermenu;

import kr.myproject.domain.UserDTO;

public interface UserLoginService {

	//회원 로그인 처리
	UserDTO LoginComplete(String id, String pw);

}
