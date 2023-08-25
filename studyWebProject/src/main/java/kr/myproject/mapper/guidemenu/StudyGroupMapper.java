package kr.myproject.mapper.guidemenu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.GroupDTO;

@Mapper
public interface StudyGroupMapper {

	//스터디모임 이름 중복체크
	String selectSameGroupName(String name);

	//스터디모임 만들기
	void InsertNewGroup(@Param("groupDTO")GroupDTO groupDTO, @Param("id")String id);

	//나의 모임 페이지 이동 시 모임 리스트 가져오기
	List<GroupDTO> selectMyGroupList(String userId);

	//group_detail에 참가인원 모임 정보 넣기
	void InsertNewGroupDetail(@Param("groupDTO")GroupDTO groupDTO, @Param("id")String id, 
			@Param("nickName")String nickName, @Param("userName") String userName);

}
