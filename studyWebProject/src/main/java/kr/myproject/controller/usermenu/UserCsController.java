package kr.myproject.controller.usermenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//마이 페이지 1:1 문의 담당

@Controller
@RequestMapping("/userCs")
public class UserCsController {
	
	//마이페이지 나의 1:1문의로 이동
	@GetMapping("/myCsPage")
	public String EnterCsPage() {
		
		return "usermenu/myCsPage";
	}
	
	//1:1 문의 등록 페이지 이동
	@GetMapping("/csRegisterPage")
	public String csRegisterPage() {
		
		return "usermenu/csRegister";
	}

}
