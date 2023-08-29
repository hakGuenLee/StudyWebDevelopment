package kr.myproject.service.common;

import java.util.List;

import kr.myproject.domain.CommonCodeDTO;

public interface CommonCodeService {

	//넘어온 공통코드에 맞는 코드 목록 가져오기
	List<CommonCodeDTO> getCommonCodeList(String code);

}
