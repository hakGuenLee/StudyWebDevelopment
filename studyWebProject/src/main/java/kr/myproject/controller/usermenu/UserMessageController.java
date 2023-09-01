package kr.myproject.controller.usermenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.myproject.domain.MessageDTO;
import kr.myproject.service.usermenu.UserMessageService;


//나의 알림 메시지 기능들 담당
@Controller
@RequestMapping("/userMessage")
public class UserMessageController {
	
	@Autowired
	private UserMessageService userMessageService;
	
	//나의 알림 메시지 페이지 이동
	@GetMapping("/myMessageManager")
	public String messageManagerPage(HttpServletRequest request, Model model) {
	
		//나에게 도착한 메시지 가져오기
		List<MessageDTO> toMeList = userMessageService.getMyMessage(request);
		
		//내가 보낸 메시지 가져오기
		List<MessageDTO> sendList = userMessageService.getMessageForOther(request);
		
		model.addAttribute("myMessage", toMeList);
		model.addAttribute("sendList", sendList);
		
		return "usermenu/myMessageList";
	}

}
