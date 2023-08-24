package kr.myproject.mapper.usermenu;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.UserDTO;

@Mapper
public interface UserAccountMapper {

	//로그인 처리 시 view에서 넘어온 id와 일치하는 계정을 가져옴
	UserDTO selectAccount(String parameter);

	//아이디 찾기(view에서 넘어온 mail주소로 찾음)
	String selectId(String mail);

	//회원 비밀번호 찾기 진행 절차 1 : id와 mail을 통해 일치하는 계정 여부 확인
	UserDTO selectUserAccountByIdAndMail(@Param("id")String id, @Param("mail")String mail);

	//회원 비밀번호 처리 진행
	int UpdateUserPassword(@Param("id")String id, @Param("cipher")String cipher);



}
