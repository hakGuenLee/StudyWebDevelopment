package kr.myproject.controller.usermenu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.myproject.service.usermenu.UserAccountService;

//회원 계정 관련 기능 담당
//로그인, 로그아웃, 아이디/비번 찾기

@Controller
@RequestMapping("/usermenu")
public class UserAccountController {
	
	@Autowired
	private UserAccountService userAccountService;

	//로그인 페이지 이동하기
	@GetMapping("/loginPage")
	public String loginPage() {
		
		return "usermenu/userLogin";
	}
	
	//로그인
	@PostMapping("/userLogin")
	public String userLogin(HttpServletRequest request, HttpSession session, Model model) {
		
		boolean result = userAccountService.LoginComplete(request);
		
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
	
	//아이디 찾기
	@PostMapping(value = "/idSerch", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String idSearch(@RequestParam("mail") String mail) {
		
		String findId = userAccountService.searchUsersId(mail);
		
		if(findId == null) {
			String errorMsg = "일치하는 아이디가 없습니다!";
			return errorMsg;
		}
		
		return findId;
		
	}
	
}
