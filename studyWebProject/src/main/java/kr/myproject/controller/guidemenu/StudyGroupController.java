package kr.myproject.controller.guidemenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.myproject.service.guidemenu.StudyGroupService;

@Controller
@RequestMapping("/group")
public class StudyGroupController {
	
	@Autowired
	private StudyGroupService studyGroupService;
	
	@GetMapping("/groupOpenPage")
	public String groupOpenPage() {
		
		return "guidemenu/groupMade";
	}
	
	@PostMapping(value = "/nameCheck", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String groupNameCheck(@RequestParam("name") String name) {
		
		String resultMsg = studyGroupService.checkGroupName(name);
		
		return resultMsg;
	}
	

}
