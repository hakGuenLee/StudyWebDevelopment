package kr.myproject.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import kr.myproject.domain.UserDTO;

//Session에서 User의 정보 얻기 담당(공통 기능)

@Component
public class UserInfoHandler {

	//session에 저장된 user의 id 얻기
	public String getUserId(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		UserDTO uDto = (UserDTO)session.getAttribute("userDTO");
		
		return uDto.getUser_id();
	}
	
	
}
