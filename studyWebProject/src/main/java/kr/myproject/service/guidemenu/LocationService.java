package kr.myproject.service.guidemenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.myproject.domain.PageDTO;
import kr.myproject.domain.PlaceDTO;

//모임 장소 둘러보기, 찜하기 서비스
public interface LocationService {

	//모임 장소 찜하기
	void addWishPlaceInfo(String name, String addr, String tel, HttpServletRequest request);

	//회원의 위시리스트 가져오기
	List<PlaceDTO> getWishList(HttpServletRequest request, PageDTO pageDTO);

	//찜한 모임 장소 삭제하기
	void deleteWish(int no);

}
