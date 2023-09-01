package kr.myproject.mapper.usermenu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.myproject.domain.MessageDTO;

@Mapper
public interface UserMessageMapper {

	//나에게 도착한 메시지 가져오기
	List<MessageDTO> selectMyMessageFromOther(String userNickName);

	//내가 보낸 메시지 가져오기
	List<MessageDTO> selectMessageForOther(String senderNickName);

}
