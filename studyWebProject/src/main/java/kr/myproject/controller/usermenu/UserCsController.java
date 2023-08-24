package kr.myproject.controller.usermenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String EnterCsPage(HttpServletRequest request, Model model) {
		
		List<CsDTO> csList = userCustomerService.getCsListById(request);
		
		System.out.println("문의내역 : " + csList);
		
		model.addAttribute("list", csList);
		
		return "usermenu/myCsPage";
	}
	
	//1:1문의 검색하기
	@PostMapping("/searchMyCsList")
	public String searchMyCsList(String searchValue, HttpServletRequest request, Model model) {
		
		List<CsDTO> findList = userCustomerService.findUserCsList(searchValue, request);
		
		model.addAttribute("list", findList);
		
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
