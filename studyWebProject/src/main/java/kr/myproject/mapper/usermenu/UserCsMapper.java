package kr.myproject.mapper.usermenu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.CsDTO;

@Mapper
public interface UserCsMapper {

	//나의 1:1문의 페이지 이동 시 회원의 문의내역 가져오기
	List<CsDTO> selectCsListById(String id);
	
	//회원 1:1문의 등록하기
	void InsertUserQuestion(CsDTO csDTO);

	//회원의 1:1문의 내역 검색하기
	List<CsDTO> searchMyCsList(@Param("searchValue") String searchValue, @Param("userId")String userId);

	//1:1문의 상세정보 가져오기
	CsDTO selectCsDetailInfo(@Param("no")int no, @Param("getId")String getId);

	//1:1문의 삭제하기
	void deleteCs(int no);



}
