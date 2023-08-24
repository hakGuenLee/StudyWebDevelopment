package kr.myproject.service.usermenu;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.domain.CsDTO;
import kr.myproject.handler.UserInfoHandler;
import kr.myproject.mapper.usermenu.UserCsMapper;

@Service
public class UserCustomerServiceImpl implements UserCustomerService {

	
	@Autowired
	private UserCsMapper userCsMapper;
	
	@Autowired
	private UserInfoHandler userInfoHandler;
	
	
	//나의 1:1문의 페이지 이동 시 문의 내역 가져오기
	@Override
	public List<CsDTO> getCsListById(HttpServletRequest request) {
		
		String id = userInfoHandler.getUserId(request);
		
		return userCsMapper.selectCsListById(id);
	}
	
	
	
	//1:1문의 등록하기
	@Override
	public void registerUserQuestion(CsDTO csDTO) {
		
		//문의고유번호 생성하기
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
		int csNo = (int) ((Math.random()*9)+1);
		
		String serialNumber = (formatedNow + csNo);
		
		csDTO.setCs_serial(serialNumber);
		
		userCsMapper.InsertUserQuestion(csDTO);	
	}



}
