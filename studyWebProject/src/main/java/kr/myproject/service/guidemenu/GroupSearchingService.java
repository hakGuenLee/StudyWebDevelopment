package kr.myproject.service.guidemenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.myproject.domain.GroupDTO;

//모임 찾기 담당
public interface GroupSearchingService {

	//모임 찾기 페이지 이동 시 스터디 모임 전체 리스트 가져오기
	List<GroupDTO> getStudyListAll();

	//모임명으로 스터디 그룹 검색하기
	List<GroupDTO> findGroup(String groupName);

	//문의하기 메세지 보내기
	void massageSend(String groupName, String title, String message, HttpServletRequest request);

}
