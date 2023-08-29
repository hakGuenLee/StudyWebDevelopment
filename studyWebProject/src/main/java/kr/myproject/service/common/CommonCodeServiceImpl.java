package kr.myproject.service.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.domain.CommonCodeDTO;
import kr.myproject.mapper.common.CommonCodeMapper;

@Service
public class CommonCodeServiceImpl implements CommonCodeService {
	
	@Autowired
	private CommonCodeMapper commonCodeMapper;

	//넘어온 공통코드에 맞는 코드 목록 가져오기
	@Override
	public List<CommonCodeDTO> getCommonCodeList(String code) {
		
		return commonCodeMapper.selectCodeList(code);
	}

	//넘어온 지역명에 맞는 행정구 목록 가져오기
	@Override
	public List<CommonCodeDTO> getCityList(String code, String city) {

		return commonCodeMapper.selectCityList(code,city);
	}

}
