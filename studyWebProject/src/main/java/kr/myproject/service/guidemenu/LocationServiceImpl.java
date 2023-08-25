package kr.myproject.service.guidemenu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
