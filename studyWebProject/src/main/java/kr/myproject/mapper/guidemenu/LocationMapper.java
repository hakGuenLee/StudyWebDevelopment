package kr.myproject.mapper.guidemenu;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LocationMapper {

	//모임장소 찜하기
	void insertWishPlace(@Param("name")String name, @Param("addr")String addr, 
			@Param("tel")String tel, @Param("id")String id);

}
