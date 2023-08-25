package kr.myproject.mapper.guidemenu;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.GroupDTO;

@Mapper
public interface StudyGroupMapper {

	//스터디모임 이름 중복체크
	String selectSameGroupName(String name);

	//스터디모임 만들기
	void InsertNewGroup(@Param("groupDTO")GroupDTO groupDTO, @Param("id")String id);

}
