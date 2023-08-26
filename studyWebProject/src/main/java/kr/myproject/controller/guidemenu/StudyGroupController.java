package kr.myproject.controller.guidemenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.myproject.domain.GroupDTO;
import kr.myproject.service.guidemenu.StudyGroupService;


//모임 개설 및 참가 등 모임 관련 기능 담당 컨트롤러
@Controller
@RequestMapping("/group")
public class StudyGroupController {
	
	@Autowired
	private StudyGroupService studyGroupService;
	
	//모임 만들기 페이지 이동
	@GetMapping("/groupOpenPage")
	public String groupOpenPage() {
		
		return "guidemenu/groupMade";
	}
	
	//모임 이름 중복확인
	@PostMapping(value = "/nameCheck", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String groupNameCheck(@RequestParam("name") String name) {
		
		String resultMsg = studyGroupService.checkGroupName(name);
		
		return resultMsg;
	}
	
	//모임 개설하기
	@PostMapping("/groupMadeComplete")
	public String groupMade(GroupDTO groupDTO, HttpServletRequest request) {
		
		studyGroupService.makeStudyGroup(groupDTO, request);
		
		return "home";
	}
	
	//나의 모임 페이지 이동
	@GetMapping("/myGroupManager")
	public String groupManagerPage(HttpServletRequest request, Model model) {
		
		List<GroupDTO> groupList = studyGroupService.getStudyGroupList(request);
		
		model.addAttribute("list", groupList);
		
		return "guidemenu/myStudyGroup";
	}
	

	
	

}
