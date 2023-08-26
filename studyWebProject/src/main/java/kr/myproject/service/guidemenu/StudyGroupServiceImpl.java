package kr.myproject.service.guidemenu;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

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
		String nickName = userInfoHandler.getUserNickName(request);
		String userName = userInfoHandler.getUserRealName(request);
		
		//모임고유번호 생성하기
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
		int csNo = (int) ((Math.random()*9)+1);
		
		String serialNumber = (formatedNow + csNo);
		
		groupDTO.setGroup_key(serialNumber);
		
		//group_master 테이블에 모임 정보 넣기
		studyGroupMapper.InsertNewGroup(groupDTO, id);
		
		//group_detail 테이블에 모임 정보 넣기
		studyGroupMapper.InsertNewGroupDetail(groupDTO, id, nickName, userName);
	}
	
	//나의 모임 페이지 이동 시 모임 리스트 가져오기
	@Override
	public List<GroupDTO> getStudyGroupList(HttpServletRequest request) {
		
		String userId = userInfoHandler.getUserId(request);
		
		return studyGroupMapper.selectMyGroupList(userId);
	}

	//나의 모임 페이지 이동시 내가 참여한 모임 리스트 가져오기
	@Override
	public List<GroupDTO> groupJoinList(HttpServletRequest request) {
		
		String myId = userInfoHandler.getUserId(request);
		
		return studyGroupMapper.selectMyJoinList(myId);
	}

}
