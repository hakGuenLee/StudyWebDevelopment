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
import org.springframework.web.multipart.MultipartHttpServletRequest;


import kr.myproject.domain.FileDTO;
import kr.myproject.domain.PageDTO;
import kr.myproject.handler.UserInfoHandler;
import kr.myproject.service.guidemenu.GroupFileService;

//모임 자료실 기능 담당 컨트롤러

@Controller
@RequestMapping("/file")
public class GroupFileController {
	
	@Autowired
	private GroupFileService groupFileService;
	
	@Autowired
	private UserInfoHandler userInfoHandler;
	
	
	//자료실 페이지 이동
	@GetMapping("/groupFilePage")
	public String filePage(HttpServletRequest request, Model model, PageDTO pageDTO) {
		
		//페이지 이동 시 처음에는 유저의 모든 목록 파일 가져오도록 처리
		List<FileDTO> myEntireGroupFileList = groupFileService.getFileListAll(request, pageDTO);
		
		model.addAttribute("list", myEntireGroupFileList);
		
		return "guidemenu/groupFile";
	}
	
	//자료 등록 페이지 이동
	@GetMapping("/groupFileRegister")
	public String fileRegisterPage(HttpServletRequest request, Model model) {
		
		String id = userInfoHandler.getUserId(request);
		
		List<String> groupList = groupFileService.getUserGroupList(id);
		
		model.addAttribute("list", groupList);
		
		return "guidemenu/groupFileRegister";
	}
	
	//자료 및 공지 상세보기 페이지 이동
	@GetMapping("/fileAndPostDetail")
	public String fileAndPostDetailPage(String no, Model model) {
		
		FileDTO fileDTO = groupFileService.getFileAndPostInfo(no);
		System.out.println("파일 상세 : " + fileDTO);
		model.addAttribute("post", fileDTO);
		
		return "guidemenu/fileAndPostDetail";
	}
	
	//유저의 스터디모임 리스트 가져오기
	@PostMapping("/myGroupList")
	@ResponseBody
	public List<String> groupList(@RequestParam("id") String id) {
		
		List<String> myGroupList = groupFileService.getUserGroupList(id);
		
		return myGroupList;		
	}
	
	//파일 등록하기
	@PostMapping("/fileRegisterComplete")
	public String fileRegister(MultipartHttpServletRequest multipart, HttpServletRequest request) throws Exception {
		
		groupFileService.upLoadFileAndPost(multipart, request);
		
		return "redirect:/file/groupFilePage";
		
	}
	
	//삭제하기 전 업로더 본인이 맞는지 확인
	@PostMapping("/uploaderCheck")
	@ResponseBody
	public boolean uploaderCheck(@RequestParam("no")String no, HttpServletRequest request){
		
		boolean result = groupFileService.uploaderCheck(no, request);
		
		return result;
	}
	
	
	//파일 삭제하기
	@PostMapping(value = "/fileAndPostDelete",  produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String postDelete(@RequestParam("no") String no, @RequestParam("groupName") String groupName, HttpServletRequest request) {
		
		groupFileService.deleteFileAndPost(no, groupName, request);
		
		return "게시물 삭제가 완료 되었습니다!";
	}
	
	
	//유저가 선택한 그룹 이름에 따라서 그에 맞는 자료 가져오기
	@PostMapping("/getFileList")
	@ResponseBody
	public List<FileDTO> fileList(@RequestParam("groupName") String groupName){
		
		List<FileDTO> fileList = groupFileService.getFileList(groupName);
		
		return fileList;
		
	}
	
	//자료 검색하기
	@PostMapping("/searchGroupFileList")
	public String searchFileAndPost(String searchValue, Model model) {
		
		List<FileDTO> findList = groupFileService.searchList(searchValue);
		
		model.addAttribute("list", findList);
		
		return "guidemenu/groupFile";
	}
	
	
	
}
