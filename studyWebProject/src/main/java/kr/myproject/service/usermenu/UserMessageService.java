package kr.myproject.service.usermenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.myproject.domain.MessageDTO;
import kr.myproject.domain.PageDTO;

public interface UserMessageService {

	//나에게 도착한 메시지 가져오기
	List<MessageDTO> getMyMessage(HttpServletRequest request, PageDTO pageDTO);

	//내가 보낸 메시지 가져오기
	List<MessageDTO> getMessageForOther(HttpServletRequest request);

	//메시지 삭제
	void deleteMessage(String no);

}
