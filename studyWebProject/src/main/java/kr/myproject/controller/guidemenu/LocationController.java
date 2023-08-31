package kr.myproject.controller.guidemenu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.myproject.domain.PlaceDTO;
import kr.myproject.service.guidemenu.LocationService;

//모임장소 담당 컨트롤러

@Controller
@RequestMapping("/location")
public class LocationController {
	
	@Autowired
	private LocationService locationService;
	
	//마이페이지 나의 위시리스트 이동
	@GetMapping("/myWishList")
	public String myWish(HttpServletRequest request, Model model) {
		
		List<PlaceDTO> placeList = locationService.getWishList(request);
		
		model.addAttribute("list", placeList);
		
		return "usermenu/myWishSpace";
	}
	
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

		return "redirect:/location/myWishList";
	}
	
	
	//찜한 모임 장소 삭제하기
	@GetMapping("/deleteWish")
	public String deleteWish(int no) {
		
		locationService.deleteWish(no);
		
		return "redirect:/location/myWishList";
	
	}

}
