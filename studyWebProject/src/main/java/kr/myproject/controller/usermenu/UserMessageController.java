package kr.myproject.controller.usermenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.myproject.domain.MessageDTO;
import kr.myproject.domain.PageDTO;
import kr.myproject.service.usermenu.UserMessageService;


//나의 알림 메시지 기능들 담당
@Controller
@RequestMapping("/userMessage")
public class UserMessageController {
	
	@Autowired
	private UserMessageService userMessageService;
	
	//받은 메시지 함 페이지 이동
	@GetMapping("/messageArived")
	public String messageManagerPage(HttpServletRequest request, Model model, PageDTO pageDTO) {
	
		//나에게 도착한 메시지 가져오기
		List<MessageDTO> toMeList = userMessageService.getMyMessage(request, pageDTO);
		
		model.addAttribute("myMessage", toMeList);
		
		return "usermenu/messageToMe";
	}
	
	//보낸 메시지 함 페이지 이동
	@GetMapping("/sendMessagePage")
	public String sendMessagePage(HttpServletRequest request, Model model) {
		
		//내가 보낸 메시지 가져오기
		List<MessageDTO> sendList = userMessageService.getMessageForOther(request);
		
		model.addAttribute("list", sendList);
		
		return "usermenu/messageForOther";
		
	}

}
