package kr.myproject.controller.guidemenu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.myproject.service.guidemenu.LocationService;

//모임장소 둘러보기

@Controller
@RequestMapping("/location")
public class LocationController {
	
	@Autowired
	private LocationService locationService;
	
	//모임 장소 둘러보기 페이지 이동
	@GetMapping("/movetoMap")
	public String mapSearchingPage() {
		
		return "guidemenu/mapSearching";
	}
	
	//모임 장소 찜하기
	@GetMapping("/addWishPlace")
	public String addWishPlace(String name, String addr, String tel, HttpServletRequest request) {
		
		System.out.println("넘어온 주소 정보 : " + name + addr + tel);
		
		locationService.addWishPlaceInfo(name, addr, tel, request);
		
		
		
		return "home";
	}

}
