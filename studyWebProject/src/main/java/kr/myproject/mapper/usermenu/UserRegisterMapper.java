package kr.myproject.mapper.usermenu;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRegisterMapper {

	//회원 가입 시 아이디 중복 체크. view에서 넘어온 id 값과 일치하는 id가 DB에 있는지 확인
	String selectId(String id);

}
