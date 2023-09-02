package kr.myproject.service.guidemenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.myproject.domain.FileDTO;
import kr.myproject.domain.GroupDTO;

public interface GroupFileService {

	//자료실 페이지 이동 시 유저의 그룹 리스트 가져오기
	List<String> getUserGroupList(String id);

	//스터디 그룹별 파일 리스트 가져오기
	List<FileDTO> getFileList(String groupName);

	//파일, 게시글 등록
	void upLoadFileAndPost(MultipartHttpServletRequest multipart, HttpServletRequest request) throws Exception;

	//유저의 모든 스터디 모임 파일들 가져오기
	List<FileDTO> getFileListAll(HttpServletRequest request);

	//게시글 제목에 해당하는 글과 파일 가져오기
	FileDTO getFileAndPostInfo(String fileNumber);

	//파일 삭제하기 전 업로더 본인이 작성한 게시물이 맞는지 확인
	boolean uploaderCheck(String no, HttpServletRequest request);

	//게시물 삭제하기
	void deleteFileAndPost(String no, String groupName, HttpServletRequest request);

	//자료 검색하기
	List<FileDTO> searchList(String searchValue);

}
