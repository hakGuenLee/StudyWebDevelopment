package kr.myproject.controller.usermenu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	//로그인
	@PostMapping("/userLogin")
	public String userLogin(HttpServletRequest request, HttpSession session, Model model) {
		
		boolean result = userLoginService.LoginComplete(request);
		
		String preUrl = (String) session.getAttribute("prev_url");
		System.out.println("넘어온 이전 경로 : " + preUrl);
		
		if(preUrl == null) {
			preUrl = "/";
		}
		
		if(!result) {
			String loginErrorMsg = "아이디 또는 비밀번호를 다시 확인하세요!";
			model.addAttribute("loginError", loginErrorMsg);
			return "usermenu/userLogin";
		}
		
		return "redirect:"+ preUrl;
		
	}
	
	
	//로그아웃
	@RequestMapping("/userLogOut")
	public String logOut(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
}
