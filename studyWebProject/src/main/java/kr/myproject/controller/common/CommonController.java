package kr.myproject.controller.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.myproject.domain.CommonCodeDTO;
import kr.myproject.service.common.CommonCodeService;

//공통으로 자주 사용되는 기능 담당 컨트롤러
//공통 코드 테이블 담당

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	private CommonCodeService commonCodeService;
	
	//넘어온 공통코드에 맞는 코드 목록 가져오기
	@PostMapping("/getCommonCodeList")
	@ResponseBody
	public List<CommonCodeDTO> CodeList(@RequestParam("code") String code){
		
		List<CommonCodeDTO> codeList = commonCodeService.getCommonCodeList(code);
		
		return codeList;
	}
	
	//넘어온 지역코드와 지역명에 맞는 행정구 목록 가져오기
	@PostMapping("/getCityList")
	@ResponseBody
	public List<CommonCodeDTO> cityList(@RequestParam("code") String code,
										@RequestParam("cityName") String city){
		
		System.out.println("넘어온 지역명" + city);
		
		List<CommonCodeDTO> cityList = commonCodeService.getCityList(code,city);
		
		return cityList;
		
	}

}
