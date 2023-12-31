package kr.myproject.service.guidemenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.domain.GroupDTO;
import kr.myproject.domain.PageDTO;
import kr.myproject.handler.UserInfoHandler;
import kr.myproject.mapper.guidemenu.GroupSearchMapper;

@Service
public class GroupSearchingServiceImpl implements GroupSearchingService {

	@Autowired
	private GroupSearchMapper groupSearchMapper;
	
	@Autowired
	private UserInfoHandler userInfoHandler;
	
	//모임 찾기 페이지 이동 시 스터디 모임 전체 리스트 가져오기
	@Override
	public List<GroupDTO> getStudyListAll(PageDTO pageDTO) {

		int groupTotalCount = groupSearchMapper.countAllStudyGroup();
		
		pageDTO.setValue(groupTotalCount, pageDTO.getCntPerPage());
		
		return groupSearchMapper.selectStudyListAll(pageDTO);
	}

	//모임명으로 스터디 그룹 검색하기
	@Override
	public List<GroupDTO> findGroup(String groupName, PageDTO pageDTO) {
		
		int findByGroupName = groupSearchMapper.countByGroupName(groupName);
		
		pageDTO.setValue(findByGroupName, pageDTO.getCntPerPage());

		return groupSearchMapper.selectStudyByGroupName(groupName, pageDTO);
	}

	//문의하기 메세지 보내기
	@Override
	public void massageSend(String groupName, String title, String message, HttpServletRequest request) {
		
		String senderNickName = userInfoHandler.getUserNickName(request);
		
		String groupMasterNickName = groupSearchMapper.selectGroupMasterNickName(groupName);
		
		groupSearchMapper.sendQuestion(senderNickName, title, message, groupMasterNickName);
		
	}

	//가입 요청 전 이미 가입되어 있는 모임인지 확인
	@Override
	public boolean isAlreadyJoinCheck(String groupName, HttpServletRequest request) {
		
		String id = userInfoHandler.getUserId(request);
		
		GroupDTO groupDTO = groupSearchMapper.checkGroupJoin(groupName, id);
		
		if(groupDTO == null) {
			return true;
		}
		
		return false;
	}

	//가입 요청 메시지 보내기
	@Override
	public void sendJoinMessage(String groupName, String title, String content, HttpServletRequest request) {
		
		String requesterNickName = userInfoHandler.getUserId(request);
		
		String groupMaster = groupSearchMapper.selectGroupMasterNickName(groupName);
		
		groupSearchMapper.sendJoinMessage(requesterNickName, title, content, groupMaster);
		
	}

	//지역에 따라 모임 리스트 가져오기
	@Override
	public List<GroupDTO> getStudyListByLocation(String location, String city, PageDTO pageDTO) {
		
		if(location.equals("전체")) {

			return groupSearchMapper.selectStudyListAll(pageDTO);
		}
		
		int groupTotalCountByLocationAndCity = groupSearchMapper.countStudyByLocationAndCity(location, city);
		pageDTO.setValue(groupTotalCountByLocationAndCity, pageDTO.getCntPerPage());
		
		return groupSearchMapper.selectStudyListByLocation(location, city, pageDTO);
	}

}
