package kr.myproject.service.guidemenu;

import java.util.List;

import kr.myproject.domain.GroupDTO;

//모임 찾기 담당
public interface GroupSearchingService {

	//모임 찾기 페이지 이동 시 스터디 모임 전체 리스트 가져오기
	List<GroupDTO> getStudyListAll();

}
