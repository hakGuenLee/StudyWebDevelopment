package kr.myproject.controller.usermenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.myproject.domain.UserDTO;
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
		
		String checkId = userRegisterService.checkId(id);
		
		if(checkId == null) {
			String okayMsg = "사용 가능한 아이디입니다!";
			return okayMsg;
		}
		String rejectMsg = "중복된 아이디입니다!";
		
		return rejectMsg; 		
	}
	
	//닉네임 중복체크
	//문자열 리턴하기 전 UTF-8 인코딩 처리
	@PostMapping(value = "/nicknameCheck", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String nickNameCheck(@RequestParam("nickName") String nickName) {
		
		String checkNickName = userRegisterService.checkNickName(nickName);
				
		if(checkNickName == null) {
			String okayMsg = "사용 가능한 닉네임입니다!";
			return okayMsg;
		}		
		String rejectMsg = "중복된 닉네임입니다!";
		
		return rejectMsg;
	}
	
	//이메일 인증 진행
	//문자열 리턴하기 전 UTF-8 인코딩 처리
	@PostMapping(value = "/emailCheck", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String userEmailCheck(@RequestParam("mail") String email) {
		
		String emailCode = userRegisterService.emailCheck(email);
		
		return emailCode;
		
	}
	
	//회원가입 처리
	@PostMapping("/userRegisterConfirm")
	public String userRegisterConfirm(UserDTO uDto) {
		
		System.out.println("뷰에서 넘어온 회원 가입 정보 : " + uDto);
		
		userRegisterService.registerComplete(uDto);
		
		return "usermenu/userLogin";
	}
	
	
}
