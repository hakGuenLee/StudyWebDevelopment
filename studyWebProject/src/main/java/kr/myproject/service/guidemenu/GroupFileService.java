package kr.myproject.service.guidemenu;

import java.util.List;

import kr.myproject.domain.GroupDTO;

public interface GroupFileService {

	//자료실 페이지 이동 시 유저의 그룹 리스트 가져오기
	List<GroupDTO> getUserGroupList(String id);

}
