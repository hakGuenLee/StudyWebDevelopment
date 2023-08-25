package kr.myproject.service.guidemenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.myproject.domain.PlaceDTO;
import kr.myproject.handler.UserInfoHandler;
import kr.myproject.mapper.guidemenu.LocationMapper;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationMapper locationMapper;
	
	@Autowired
	private UserInfoHandler userInfoHandler;
	
	//모임 장소 찜하기
	@Override
	public void addWishPlaceInfo(String name, String addr, String tel, HttpServletRequest request) {
		
		String id = userInfoHandler.getUserId(request);
		
		locationMapper.insertWishPlace(name, addr, tel, id);
		
	}

	//회원의 모임 위시리스트 가져오기
	@Override
	public List<PlaceDTO> getWishList(HttpServletRequest request) {
		String userId = userInfoHandler.getUserId(request);
		
		return locationMapper.selectWishList(userId);
	}

	//찜한 모임 장소 삭제하기
	@Override
	public void deleteWish(int no) {
		locationMapper.deleteWishPlace(no);
		
	}

}
