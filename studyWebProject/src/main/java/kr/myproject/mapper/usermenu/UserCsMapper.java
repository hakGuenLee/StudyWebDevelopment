package kr.myproject.mapper.usermenu;

import org.apache.ibatis.annotations.Mapper;

import kr.myproject.domain.CsDTO;

@Mapper
public interface UserCsMapper {

	
	//회원 1:1문의 등록하기
	void InsertUserQuestion(CsDTO csDTO);

}
