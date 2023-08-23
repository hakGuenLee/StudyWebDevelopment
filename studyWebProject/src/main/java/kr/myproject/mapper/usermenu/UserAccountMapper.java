package kr.myproject.mapper.usermenu;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.UserDTO;

@Mapper
public interface UserAccountMapper {

	//로그인 처리 시 view에서 넘어온 id와 일치하는 계정을 가져옴
	UserDTO selectAccount(String parameter);



}
