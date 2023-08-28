package kr.myproject.service.guidemenu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.domain.FileDTO;
import kr.myproject.domain.GroupDTO;
import kr.myproject.mapper.guidemenu.GroupFileMapper;

@Service
public class GroupFileServiceImpl implements GroupFileService {

	@Autowired
	private GroupFileMapper groupFileMapper;
	
	//자료실 페이지 이동 시 유저의 그룹 리스트 가져오기
	@Override
	public List<GroupDTO> getUserGroupList(String id) {
		
		return groupFileMapper.selectStudyList(id);
	}

	//스터디 그룹별 파일 리스트 가져오기
	@Override
	public List<FileDTO> getFileList(String groupName) {
	
		return groupFileMapper.selectFileList(groupName);
	}

}
