package kr.myproject.controller.guidemenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//모임장소 둘러보기

@Controller
@RequestMapping("/location")
public class LocationController {
	
	//모임 장소 둘러보기 페이지 이동
	@GetMapping("/movetoMap")
	public String mapSearchingPage() {
		
		return "guidemenu/mapSearching";
	}
	

}
