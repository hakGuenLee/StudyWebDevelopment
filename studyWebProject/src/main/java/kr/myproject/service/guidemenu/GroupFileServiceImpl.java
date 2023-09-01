package kr.myproject.service.guidemenu;


import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.myproject.domain.FileDTO;

import kr.myproject.handler.CustomFileHandler;
import kr.myproject.handler.UserInfoHandler;
import kr.myproject.mapper.guidemenu.GroupFileMapper;

@Service
public class GroupFileServiceImpl implements GroupFileService {

	@Autowired
	private GroupFileMapper groupFileMapper;
	
	@Autowired
	private UserInfoHandler userInfoHandler;
	
	@Autowired
	private CustomFileHandler fileHandler;
	
	
	//자료실 페이지 첫 이동 시 모든 파일 리스트 가져오기
	@Override
	public List<FileDTO> getFileListAll(HttpServletRequest request) {

		String id = userInfoHandler.getUserId(request);
		
		List<String> groupList = groupFileMapper.selectStudyList(id);
		
		System.out.println("페이지 첫 이동 : " + groupList);
		
		return groupFileMapper.selectAllFile(groupList);
	}
	
	//자료실 페이지 이동 시 유저의 그룹 리스트 가져오기
	@Override
	public List<String> getUserGroupList(String id) {
		
		return groupFileMapper.selectStudyList(id);
	}

	//스터디 그룹별 파일 리스트 가져오기
	@Override
	public List<FileDTO> getFileList(String groupName) {
	
		return groupFileMapper.selectFileList(groupName);
	}

	//파일, 게시글 등록
	@Override
	public void upLoadFileAndPost(MultipartHttpServletRequest multipart, HttpServletRequest request) throws Exception {
		
		Map<String, String> map =	fileHandler.fileAndPostUploader(multipart, request);

		groupFileMapper.saveFileAndPost(map);
		
	}

	//게시글 제목에 해당하는 글과 파일 가져오기&조회수 1 증가
	@Override
	public FileDTO getFileAndPostInfo(String fileNumber) {
		
		groupFileMapper.addHitByFileNum(fileNumber);

		return groupFileMapper.selectFileAndPost(fileNumber);
	}



}
