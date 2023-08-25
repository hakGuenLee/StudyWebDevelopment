package kr.myproject.service.usermenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.myproject.domain.CsDTO;

//회원 1:1문의 서비스
public interface UserCustomerService {

	//나의 1:1문의 페이지 이동 시 문의 내역 가져오기
	List<CsDTO> getCsListById(HttpServletRequest request);
	
	//1:1문의 등록하기
	void registerUserQuestion(CsDTO csDTO);

	//회원의 문의 내역 검색하기
	List<CsDTO> findUserCsList(String searchValue, HttpServletRequest request);

	//1:1문의 상세정보 가져오기
	CsDTO getUserCsDetail(int no, HttpServletRequest request);



}
