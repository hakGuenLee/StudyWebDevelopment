package kr.myproject.controller.usermenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.myproject.domain.CsDTO;
import kr.myproject.service.usermenu.UserCustomerService;

//마이 페이지 1:1 문의 담당

@Controller
@RequestMapping("/userCs")
public class UserCsController {
	
	@Autowired
	private UserCustomerService userCustomerService;
	
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
	
	//1:1문의 등록 처리
	@PostMapping("/csRegisterComplete")
	public String csRegisterComplete(CsDTO csDTO) {
		
		System.out.println(csDTO);
		
		userCustomerService.registerUserQuestion(csDTO);
		
		
		
		return "redirect:/userCs/myCsPage";
	}

}
