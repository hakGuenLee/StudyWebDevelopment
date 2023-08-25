package kr.myproject.service.guidemenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.mapper.guidemenu.StudyGroupMapper;



@Service
public class StudyGroupServiceImpl implements StudyGroupService {
	
	@Autowired
	private StudyGroupMapper studyGroupMapper;

	//모임명 중복체크하기
	@Override
	public String checkGroupName(String name) {
		
		String findName = studyGroupMapper.selectSameGroupName(name);
		
		if(findName == null) {
			String okayMsg = "사용 가능한 모임 명입니다!";
			return okayMsg;
		}
		
		String rejectMsg = "중복된 모임 이름입니다! 다른 이름으로 만들어주세요!";
		
		return rejectMsg;
	}

}
