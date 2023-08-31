package kr.myproject.mapper.guidemenu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.myproject.domain.GroupDTO;

@Mapper
public interface GroupSearchMapper {

	//모임 찾기 페이지 이동 시 스터디 모임 전체 리스트 가져오기
	List<GroupDTO> selectStudyListAll();

	//모임명으로 스터디 그룹 검색하기
	List<GroupDTO> selectStudyByGroupName(String groupName);

}
