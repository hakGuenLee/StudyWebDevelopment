package kr.myproject.mapper.guidemenu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.myproject.domain.FileDTO;
import kr.myproject.domain.GroupDTO;

@Mapper
public interface GroupFileMapper {

	//자료실 페이지 이동 시 유저의 그룹 리스트 가져오기
	List<GroupDTO> selectStudyList(String id);

	//스터디그룹별 파일 리스트 가져오기
	List<FileDTO> selectFileList(String groupName);

}
