package kr.myproject.mapper.usermenu;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.UserDTO;

@Mapper
public interface UserLoginMapper {

	//로그인 처리
	UserDTO selectUserAccount(@Param("id")String id, @Param("pw")String pw);

}
