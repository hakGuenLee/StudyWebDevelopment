package kr.myproject.mapper.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.myproject.domain.CommonCodeDTO;

@Mapper
public interface CommonCodeMapper {

	//공통코드 테이블의 파일 타입 리스트 가져오기
	List<CommonCodeDTO> selectCodeList(String code);

}
