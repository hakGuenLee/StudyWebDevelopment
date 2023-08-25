package kr.myproject.service.guidemenu;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.domain.GroupDTO;
import kr.myproject.handler.UserInfoHandler;
import kr.myproject.mapper.guidemenu.StudyGroupMapper;



@Service
public class StudyGroupServiceImpl implements StudyGroupService {
	
	@Autowired
	private StudyGroupMapper studyGroupMapper;
	
	@Autowired
	private UserInfoHandler userInfoHandler;

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

	//모임 개설하기
	@Override
	public void makeStudyGroup(GroupDTO groupDTO, HttpServletRequest request) {
		
		String id = userInfoHandler.getUserId(request);
		
		//모임고유번호 생성하기
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
		int csNo = (int) ((Math.random()*9)+1);
		
		String serialNumber = (formatedNow + csNo);
		
		groupDTO.setGroup_key(serialNumber);
		
		studyGroupMapper.InsertNewGroup(groupDTO, id);
		
		
	}

}
