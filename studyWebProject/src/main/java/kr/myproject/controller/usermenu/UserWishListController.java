package kr.myproject.controller.usermenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//모임 장소 위시리스트 담당 컨트롤러

@Controller
@RequestMapping("/userWish")
public class UserWishListController {

	//나의 위시리스트 페이지 이동
	@GetMapping("/myWishList")
	public String userLocationWish() {
		
		return "usermenu/myWishSpace";
	}
	
	
}
