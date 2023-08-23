package kr.myproject.controller.usermenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.myproject.service.usermenu.UserLoginService;

@Controller
@RequestMapping("/usermenu")
public class UserLoginController {
	
	@Autowired
	private UserLoginService userLoginService;

	//로그인 페이지 이동하기
	@GetMapping("/loginPage")
	public String loginPage() {
		
		return "usermenu/userLogin";
	}
	
}
