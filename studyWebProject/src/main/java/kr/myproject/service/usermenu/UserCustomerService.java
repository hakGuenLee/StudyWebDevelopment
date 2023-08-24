package kr.myproject.service.usermenu;

import kr.myproject.domain.CsDTO;

//회원 1:1문의 서비스
public interface UserCustomerService {

	
	//1:1문의 등록하기
	void registerUserQuestion(CsDTO csDTO);

}
