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
import kr.myproject.service.guidemenu.GroupSearchingService;

@Controller
@RequestMapping("/groupSearch")
public class GroupSearchController {
	
	@Autowired
	private GroupSearchingService groupSearchingService;
	
	//모임 찾기 페이지 이동
	@GetMapping("/groupSearchPage")
	public String groupSearchPage(Model model) {
		
		//모임 찾기 페이지 이동 시 스터디그룹 목록 전체 가져오기
		List<GroupDTO> groupList = groupSearchingService.getStudyListAll();
		
		model.addAttribute("list", groupList);
		
		return "guidemenu/groupSearching";
		
	}
	
	//모임명 검색하기
	@PostMapping("/searchGroupName")
	public String groupNameSearch(@RequestParam("searchValue") String groupName, Model model) {
		
		List<GroupDTO> findGroupList = groupSearchingService.findGroup(groupName);
		
		model.addAttribute("list", findGroupList);
		
		return "guidemenu/groupSearching";
		
	}

	
	
	//문의하기
	@PostMapping("/sendQuestion")
	@ResponseBody
	public String questionSender(@RequestParam("groupName") String groupName, @RequestParam("title") String title,
			@RequestParam("message") String message, HttpServletRequest request) {

		groupSearchingService.massageSend(groupName, title, message, request);
		
		return "성공!";
		
	}
	
	//가입 요청 전 이미 가입되어 있는 모임인지 확인하기
	@PostMapping("/joinCheck")
	@ResponseBody
	public boolean joinCheck(@RequestParam("groupName")String groupName, HttpServletRequest request) {
		
		boolean result = groupSearchingService.isAlreadyJoinCheck(groupName, request);
		
		return result;
	}


}
