package kr.myproject.mapper.guidemenu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.GroupDTO;
import kr.myproject.domain.PageDTO;

@Mapper
public interface GroupSearchMapper {

	//모임 찾기 페이지 이동 시 스터디 모임 전체 리스트 가져오기
	List<GroupDTO> selectStudyListAll(PageDTO pageDTO);

	//모임명으로 스터디 그룹 검색하기
	List<GroupDTO> selectStudyByGroupName(@Param("groupName")String groupName, @Param("pageDTO")PageDTO pageDTO);

	//해당 그룹의 대표자 닉네임 가져오기
	String selectGroupMasterNickName(String groupName);

	//모임 찾기에서 문의하기 보내기
	void sendQuestion(@Param("senderNickName")String senderNickName, @Param("title")String title, @Param("message")String message, 
			@Param("groupMasterNickName")String groupMasterNickName);

	//가입 요청 전 이미 가입되어 있는 모임인지 확인
	GroupDTO checkGroupJoin(@Param("groupName")String groupName, @Param("id")String id);

	//가입 요청 메시지 보내기
	void sendJoinMessage(@Param("requesterNickName")String requesterNickName, @Param("title")String title, 
			@Param("content")String content, @Param("groupMaster")String groupMaster);

	//지역에 따라 모임 리스트 가져오기
	List<GroupDTO> selectStudyListByLocation(@Param("location")String location, @Param("city")String city, @Param("pageDTO")PageDTO pageDTO);

	//스터디 그룹 총 개수 카운트
	int countAllStudyGroup();

	//지역, 행정구역 별 스터디 그룹 개수 세기
	int countStudyByLocationAndCity(@Param("location")String location, @Param("city")String city);

	//그룹 명에 따라서 개수 세기
	int countByGroupName(String groupName);
	
	

}
