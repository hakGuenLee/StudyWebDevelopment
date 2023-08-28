package kr.myproject.controller.guidemenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//모임 자료실

@Controller
@RequestMapping("/file")
public class GroupFileController {
	
	//자료실 페이지 이동
	@GetMapping("/groupFilePage")
	public String filePage() {
		
		return "guidemenu/groupFile";
	}

}
