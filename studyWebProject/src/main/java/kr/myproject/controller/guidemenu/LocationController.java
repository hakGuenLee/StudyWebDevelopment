package kr.myproject.controller.guidemenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//모임장소 둘러보기

@Controller
@RequestMapping("/location")
public class LocationController {
	
	//모임장소 둘러보기로 이동
	@GetMapping("/movetoMap")
	public String mapSite() {
		
		return "guidemenu/locationSearch";
	}
}
