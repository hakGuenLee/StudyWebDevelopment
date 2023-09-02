package kr.myproject.mapper.guidemenu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.myproject.domain.PageDTO;
import kr.myproject.domain.PlaceDTO;

@Mapper
public interface LocationMapper {

	//모임장소 찜하기
	void insertWishPlace(@Param("name")String name, @Param("addr")String addr, 
			@Param("tel")String tel, @Param("id")String id);

	//회원의 모임 위시리스트 가져오기
	List<PlaceDTO> selectWishList(@Param("userId")String userId, @Param("pageDTO")PageDTO pageDTO);

	//찜한 모임 장소 삭제하기
	void deleteWishPlace(int no);

	//회원이 찜한 장소 총 개수 카운트
	int countWishLocationAll(String userId);

}
