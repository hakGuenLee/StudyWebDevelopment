package kr.myproject.service.guidemenu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.domain.GroupDTO;
import kr.myproject.mapper.guidemenu.GroupSearchMapper;

@Service
public class GroupSearchingServiceImpl implements GroupSearchingService {

	@Autowired
	private GroupSearchMapper groupSearchMapper;
	
	//모임 찾기 페이지 이동 시 스터디 모임 전체 리스트 가져오기
	@Override
	public List<GroupDTO> getStudyListAll() {

		return groupSearchMapper.selectStudyListAll();
	}

}
