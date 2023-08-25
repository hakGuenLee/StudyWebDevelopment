package kr.myproject.service.guidemenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.myproject.domain.GroupDTO;

public interface StudyGroupService {

	//모임명 중복체크
	String checkGroupName(String name);

	//스터디 모임 개설하기
	void makeStudyGroup(GroupDTO groupDTO, HttpServletRequest request);

	//나의 모임 페이지 이동 시 모임 리스트 가져오기
	List<GroupDTO> getStudyGroupList(HttpServletRequest request);

}
