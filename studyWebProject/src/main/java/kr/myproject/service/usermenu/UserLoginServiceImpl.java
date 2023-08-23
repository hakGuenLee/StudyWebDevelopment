package kr.myproject.service.usermenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.domain.UserDTO;
import kr.myproject.mapper.usermenu.UserLoginMapper;

@Service
public class UserLoginServiceImpl implements UserLoginService {

	@Autowired
	private UserLoginMapper userLoginMapper;
	
	//회원 로그인 처리
	@Override
	public UserDTO LoginComplete(String id, String pw) {

		return userLoginMapper.selectUserAccount(id, pw);
	}

}
