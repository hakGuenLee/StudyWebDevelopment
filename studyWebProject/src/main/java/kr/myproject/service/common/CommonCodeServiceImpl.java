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

	//공통코드 테이블의 파일 타입 리스트 가져오기(100번)
	@Override
	public List<CommonCodeDTO> getFileTypeList(String fileCode) {
		
		return commonCodeMapper.selectFileTypeAll(fileCode);
	}

}
