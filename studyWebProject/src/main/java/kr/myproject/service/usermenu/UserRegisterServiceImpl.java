package kr.myproject.service.usermenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.mapper.usermenu.UserRegisterMapper;

@Service
public class UserRegisterServiceImpl implements UserRegisterService {
	
	@Autowired
	private UserRegisterMapper userRegisterMapper;

}
