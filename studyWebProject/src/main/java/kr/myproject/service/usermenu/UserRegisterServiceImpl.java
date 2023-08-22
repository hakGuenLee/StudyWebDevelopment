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
		// TODO Auto-generated method stub
		return userRegisterMapper.selectId(id);
	}

}
