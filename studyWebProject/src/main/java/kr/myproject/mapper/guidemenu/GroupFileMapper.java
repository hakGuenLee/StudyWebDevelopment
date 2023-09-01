package kr.myproject.mapper.guidemenu;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.FileDTO;

@Mapper
public interface GroupFileMapper {

	//자료실 페이지 이동 시 유저의 그룹 리스트 가져오기
	List<String> selectStudyList(String id);

	//스터디그룹별 파일 리스트 가져오기
	List<FileDTO> selectFileList(String groupName);

	//파일 및 게시글 내용 저장하기
	void saveFileAndPost(Map<String, String> map);

	//자료실 페이지 첫 이동 시 모든 파일 리스트 가져오기
	List<FileDTO> selectAllFile(@Param("groupList")List<String> groupList);

	//게시글 제목에 해당하는 글과 파일 가져오기
	FileDTO selectFileAndPost(String fileNumber);

	//해당 번호의 게시글 조회수 + 1
	void addHitByFileNum(String fileNumber);

	//파일 삭제하기 전 업로더 본인이 작성한 게시물이 맞는지 확인
	FileDTO uploaderCheckByNickName(@Param("no")String no, @Param("uploaderNickName")String uploaderNickName);

}
