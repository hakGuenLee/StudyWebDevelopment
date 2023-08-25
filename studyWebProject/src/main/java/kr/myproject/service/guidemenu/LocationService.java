package kr.myproject.service.guidemenu;

import javax.servlet.http.HttpServletRequest;

//모임 장소 둘러보기, 찜하기 서비스
public interface LocationService {

	//모임 장소 찜하기
	void addWishPlaceInfo(String name, String addr, String tel, HttpServletRequest request);

}
