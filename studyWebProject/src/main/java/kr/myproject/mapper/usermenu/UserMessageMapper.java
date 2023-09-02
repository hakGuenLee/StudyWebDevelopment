package kr.myproject.mapper.usermenu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.MessageDTO;
import kr.myproject.domain.PageDTO;

@Mapper
public interface UserMessageMapper {

	//나에게 도착한 메시지 가져오기
	List<MessageDTO> selectMyMessageFromOther(@Param("userNickName")String userNickName, @Param("pageDTO")PageDTO pageDTO);
	
	//받은 메시지 총 개수 카운트
	int countMessageAllToMe(String userNickName);

	//내가 보낸 메시지 가져오기
	List<MessageDTO> selectMessageForOther(String senderNickName);

	//메시지 삭제
	void deleteMessage(String no);


}
