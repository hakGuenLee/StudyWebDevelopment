package kr.myproject.service.usermenu;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.myproject.domain.UserDTO;
import kr.myproject.handler.MailSendHandler;
import kr.myproject.mapper.usermenu.UserRegisterMapper;

@Service
public class UserRegisterServiceImpl implements UserRegisterService {
	
	@Autowired
	private UserRegisterMapper userRegisterMapper;

	@Autowired
	private MailSendHandler mailHandler;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	//회원 가입 시 아이디 중복 체크
	@Override
	public String checkId(String id) {
		
		return userRegisterMapper.selectId(id);
	}

	//회원 가입 시 닉네임 중복 체크
	@Override
	public String checkNickName(String nickName) {
		
		return userRegisterMapper.selectNickName(nickName);
	}

	//회원 가입 시 이메일 인증 처리
	@Override
	public String emailCheck(String email) {
	
		return mailHandler.sendEmailCode(email);
	
	}

	//회원 가입 처리하기
	@Override
	public void registerComplete(UserDTO uDto) {
		
		String password = uDto.getUser_pw();
		
		String cipher = passwordEncoder.encode(password);
		
		uDto.setUser_pw(cipher);
		
		userRegisterMapper.InsertNewUser(uDto);
		
	}

}
