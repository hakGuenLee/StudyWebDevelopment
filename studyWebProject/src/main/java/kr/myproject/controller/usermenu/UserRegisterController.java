package kr.myproject.controller.usermenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.myproject.service.usermenu.UserRegisterService;

//회원가입 처리 Controller
@Controller
@RequestMapping("/usermenu")
public class UserRegisterController {
	
	@Autowired
	private UserRegisterService userRegisterService;

	//약관동의 페이지 이동
	@GetMapping("/acceptRule")
	public String userRegister() {
	
		return "usermenu/acceptRule";
	}
	
	//회원가입 정보 입력 페이지 이동
	@GetMapping("/registerInfo")
	public String registerPage() {
		
		return "usermenu/userRegister";
	}
	
	//아이디 중복 체크
	//문자열 리턴하기 전 UTF-8 인코딩 처리
	@PostMapping(value = "/idCheck", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) {
		
		System.out.println("넘어온 아이디값 : " + id);
		
		String checkId = userRegisterService.checkId(id);
		
		System.out.println("확인 된 아이디 : " + checkId);
		
		if(checkId == null) {
			String okayMsg = "사용 가능한 아이디입니다!";
			return okayMsg;
		}
		String rejectMsg = "중복된 아이디입니다!";
		
		return rejectMsg; 		
	}
	
}
