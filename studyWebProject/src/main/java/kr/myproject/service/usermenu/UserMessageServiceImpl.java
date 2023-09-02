package kr.myproject.service.usermenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.domain.MessageDTO;
import kr.myproject.domain.PageDTO;
import kr.myproject.handler.UserInfoHandler;
import kr.myproject.mapper.usermenu.UserMessageMapper;

//나의 알림 메시지 담당 서비스

@Service
public class UserMessageServiceImpl implements UserMessageService {

	@Autowired
	private UserMessageMapper userMessageMapper;
	@Autowired
	private UserInfoHandler userInfoHandler;
	
	//나에게 도착한 메시지 가져오기
	@Override
	public List<MessageDTO> getMyMessage(HttpServletRequest request, PageDTO pageDTO) {
		
		String userNickName = userInfoHandler.getUserNickName(request);
		
		int totalNumber = userMessageMapper.countMessageAllToMe(userNickName);
		
		pageDTO.setValue(totalNumber, pageDTO.getCntPerPage());
		
		return userMessageMapper.selectMyMessageFromOther(userNickName, pageDTO);
	}

	//내가 보낸 메시지 가져오기
	@Override
	public List<MessageDTO> getMessageForOther(HttpServletRequest request) {
		
		String senderNickName = userInfoHandler.getUserNickName(request);
		
		return userMessageMapper.selectMessageForOther(senderNickName);
	}

}
