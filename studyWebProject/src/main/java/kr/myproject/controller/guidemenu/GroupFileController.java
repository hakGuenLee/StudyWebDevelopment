package kr.myproject.controller.guidemenu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.myproject.domain.GroupDTO;
import kr.myproject.service.guidemenu.GroupFileService;

//모임 자료실

@Controller
@RequestMapping("/file")
public class GroupFileController {
	
	@Autowired
	private GroupFileService groupFileService;
	
	
	//자료실 페이지 이동
	@GetMapping("/groupFilePage")
	public String filePage() {
		
		return "guidemenu/groupFile";
	}
	
	//자료 등록 페이지 이동
	@GetMapping("/groupFileRegister")
	public String fileRegisterPage() {
		
		return "guidemenu/groupFileRegister";
	}
	
	//유저의 스터디모임 리스트 가져오기
	@PostMapping("/myGroupList")
	@ResponseBody
	public List<GroupDTO> groupList(@RequestParam("id") String id) {
		
		List<GroupDTO> myGroupList = groupFileService.getUserGroupList(id);
		
		return myGroupList;
		
	}
}
