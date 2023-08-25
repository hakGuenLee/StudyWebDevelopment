package kr.myproject.controller.guidemenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/group")
public class StudyGroupController {
	
	@GetMapping("/groupOpenPage")
	public String groupOpenPage() {
		
		return "guidemenu/groupMade";
	}

}
