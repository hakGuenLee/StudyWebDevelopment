package kr.myproject.service.usermenu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.myproject.domain.UserDTO;
import kr.myproject.mapper.usermenu.UserLoginMapper;

@Service
public class UserLoginServiceImpl implements UserLoginService {

	@Autowired
	private UserLoginMapper userLoginMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//회원 로그인 처리
	@Override
	public boolean LoginComplete(HttpServletRequest request) {
		
		HttpSession session = request.getSession();

		UserDTO userDTO = userLoginMapper.selectAccount(request.getParameter("id"));	
		
		if(userDTO != null) {
			String inputPw = request.getParameter("pw"); //view에서 사용자가 입력한 패스워드
			String dbPw = userDTO.getUser_pw(); //DB에서 가져온 패스워드
			
			if(passwordEncoder.matches(inputPw, dbPw)) {
				session.setAttribute("userDTO", userDTO);
				return true;
			}else { //비밀번호가 일치하지 않는 경우
				return false;
			}
		}
		
		return false;   //회원 정보가 아예 없는 경우
	}

}
