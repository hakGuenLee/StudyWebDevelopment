package kr.myproject.mapper.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.CommonCodeDTO;

@Mapper
public interface CommonCodeMapper {

	//공통코드 테이블의 파일 타입 리스트 가져오기
	List<CommonCodeDTO> selectCodeList(String code);

	//넘어온 지역명에 맞는 행정구 목록 가져오기
	List<CommonCodeDTO> selectCityList(@Param("code")String code, @Param("city")String city);

}
