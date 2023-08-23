package kr.myproject.service.usermenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.mapper.usermenu.UserRegisterMapper;

@Service
public class UserRegisterServiceImpl implements UserRegisterService {
	
	@Autowired
	private UserRegisterMapper userRegisterMapper;

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

}
