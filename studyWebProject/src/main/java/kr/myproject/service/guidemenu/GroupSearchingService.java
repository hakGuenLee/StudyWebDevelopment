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

	//가입 요청 전 이미 가입되어 있는 모임인지 확인
	boolean isAlreadyJoinCheck(String groupName, HttpServletRequest request);

	//가입 요청 메시지 보내기
	void sendJoinMessage(String groupName, String title, String content, HttpServletRequest request);

	//지역에 따라 모임 리스트 가져오기
	List<GroupDTO> getStudyListByLocation(String location, String city);

}
