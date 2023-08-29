package kr.myproject.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class FileDTO {

	private int file_no; //파일 순번
	private String group_key; //모임 고유번호
	private String group_name; //모임 이름
	private String file_name; //파일명
	private String file_type; //파일 자료형
	private String content; //내용
	private String user_id; //업로더 아이디
	private int hit; //조회수
	private Date upload_dt; //업로드일자
	
}
