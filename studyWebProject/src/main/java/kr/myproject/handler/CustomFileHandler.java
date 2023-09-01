package kr.myproject.handler;

import java.io.File;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class CustomFileHandler {
	
	//모임용 파일 및 게시글 업로드 메서드
	public Map<String, String> fileAndPostUploader(MultipartHttpServletRequest multipart, 
			HttpServletRequest request) throws Exception{
			
		String groupName = multipart.getParameter("group_name");
		System.out.println("그룹네임 : " + groupName);
		String path =  "C:\\Users\\User\\Desktop\\개인포폴\\스터디모임 사이트\\StudyWebDevelopment\\studyWebProject\\src\\main\\webapp\\resources\\upload\\" + groupName;
		
		File folder = new File(path);
		folder.mkdir();
		
		String savePath = path;
		
		Map<String, String> map = new HashMap<>();
		
		Enumeration<String> enu = multipart.getParameterNames();
		
		// 일반 텍스트 파일의 파라미터명(key), 해당 key의 value값을 가져오기
		while (enu.hasMoreElements()) {

			String paramName = enu.nextElement();
			String paramValue = multipart.getParameter(paramName);

			System.out.println(paramName);
			System.out.println(paramValue);

			map.put(paramName, paramValue);
		} // while문
		
		Iterator<String> iterator = multipart.getFileNames();
		
		while(iterator.hasNext()) {
			
			String fileName = iterator.next();
			
			MultipartFile multipartFile = multipart.getFile(fileName);
			
			String originName = multipartFile.getOriginalFilename();
			
			File file = new File(savePath + "\\" + fileName);
			
			if(multipartFile.getSize() !=0) { //업로드 된 경우
				if(!file.exists()) {
					if(file.getParentFile().mkdir()) {
						file.createNewFile();
					}
				}
				
				
				File uploadFile = new File(savePath + "\\" + originName);
				
				if(uploadFile.exists()) {
					originName = System.currentTimeMillis() + "_" + originName;
					uploadFile = new File(savePath + "\\" + originName);
				}
				
				multipartFile.transferTo(uploadFile);
				
				map.put(fileName, originName);

			}						
		}
		
		return map;
	}

}
