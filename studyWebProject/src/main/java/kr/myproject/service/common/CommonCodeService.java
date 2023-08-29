package kr.myproject.service.common;

import java.util.List;

import kr.myproject.domain.CommonCodeDTO;

public interface CommonCodeService {

	//공통코드 테이블의 파일 타입 리스트 가져오기(100번)
	List<CommonCodeDTO> getFileTypeList(String fileCode);

}
