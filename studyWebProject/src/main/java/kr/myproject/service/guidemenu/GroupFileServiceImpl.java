package kr.myproject.service.guidemenu;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.myproject.domain.FileDTO;
import kr.myproject.domain.GroupDTO;
import kr.myproject.mapper.guidemenu.GroupFileMapper;

@Service
public class GroupFileServiceImpl implements GroupFileService {

	@Autowired
	private GroupFileMapper groupFileMapper;
	
	//자료실 페이지 이동 시 유저의 그룹 리스트 가져오기
	@Override
	public List<GroupDTO> getUserGroupList(String id) {
		
		return groupFileMapper.selectStudyList(id);
	}

	//스터디 그룹별 파일 리스트 가져오기
	@Override
	public List<FileDTO> getFileList(String groupName) {
	
		return groupFileMapper.selectFileList(groupName);
	}

	//파일, 게시글 등록
	@Override
	public void upLoadFileAndPost(MultipartHttpServletRequest multipart, HttpServletRequest request) throws Exception {
		
		
		//모임별 폴더 만들기
		
		String groupName = multipart.getParameter("group_name");
		System.out.println("그룹네임 : " + groupName);
		String path = "/resources/FileAndPost/"+groupName;
		
		File folder = new File(path);
		
		//해당 폴더가 없는 경우
		if(!folder.exists()) {
			folder.mkdir();
			
			System.out.println("폴더 : " + folder);
			
			String savePath = request.getServletContext().getRealPath("") + File.separator + path;
		
			System.out.println("savePath : " + savePath);
			
			Map<String, String> map = new HashMap<>();
			
			// mhr 텍스트파일, 바이너리 파일의 저옵를 모두 얻어올 수 있다.

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
					groupFileMapper.saveFileAndPost(map);
				}
				
				
			}
			
		}else {
			
		}

		
	}

}
