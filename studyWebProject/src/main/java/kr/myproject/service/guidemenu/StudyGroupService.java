package kr.myproject.service.guidemenu;

import javax.servlet.http.HttpServletRequest;

import kr.myproject.domain.GroupDTO;

public interface StudyGroupService {

	//모임명 중복체크
	String checkGroupName(String name);

	//스터디 모임 개설하기
	void makeStudyGroup(GroupDTO groupDTO, HttpServletRequest request);

}
