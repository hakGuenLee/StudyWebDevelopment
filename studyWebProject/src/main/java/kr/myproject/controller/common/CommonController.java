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
	
	
	@PostMapping("/getFileType")
	@ResponseBody
	public List<CommonCodeDTO> fileType(@RequestParam("code") String fileCode){
		
		System.out.println("filecode : " + fileCode);
		
		List<CommonCodeDTO> fileList = commonCodeService.getFileTypeList(fileCode);
		
		return fileList;
	}

}
