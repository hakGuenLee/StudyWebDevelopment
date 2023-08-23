package kr.myproject.controller.usermenu;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.myproject.domain.UserDTO;
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
	
	@PostMapping("/userLogin")
	public String userLogin(String id, String pw, Model model, HttpSession session) {
		
		System.out.println("뷰에서 넘어온 아이디 : " + id);
		System.out.println("뷰에서 넘어온 비밀번호 : " + pw);
		
		UserDTO uDto = userLoginService.LoginComplete(id, pw);
		
		if(uDto == null) {
			String loginError = "일치하는 계정이 없습니다! 아이디 또는 비밀번호를 다시 확인하세요!";
			model.addAttribute("loginError", loginError);
			return "usermenu/userLogin";
		}
		
		session.setAttribute("userDTO", uDto);
		
		
		return "home";
		
	}
	
}
