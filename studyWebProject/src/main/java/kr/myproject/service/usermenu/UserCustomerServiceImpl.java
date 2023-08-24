package kr.myproject.service.usermenu;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.domain.CsDTO;
import kr.myproject.mapper.usermenu.UserCsMapper;

@Service
public class UserCustomerServiceImpl implements UserCustomerService {

	
	@Autowired
	private UserCsMapper userCsMapper;
	
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
