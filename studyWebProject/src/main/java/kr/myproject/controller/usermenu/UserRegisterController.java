package kr.myproject.controller.usermenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.myproject.service.usermenu.UserRegisterService;

//회원가입 처리 Controller
@Controller
@RequestMapping("/usermenu")
public class UserRegisterController {
	
	@Autowired
	private UserRegisterService userRegisterService;

	//약관동의 페이지 이동
	@GetMapping("/userRegister")
	public String userRegister() {
	
		return "usermenu/acceptRule";
	}
	
	
}
