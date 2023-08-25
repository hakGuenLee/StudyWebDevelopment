package kr.myproject.mapper.guidemenu;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudyGroupMapper {

	//스터디모임 이름 중복체크
	String selectSameGroupName(String name);

}
