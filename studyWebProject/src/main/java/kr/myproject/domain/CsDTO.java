package kr.myproject.domain;

import java.sql.Date;

import lombok.Data;

//회원 1:1문의 DTO

@Data
public class CsDTO {
	
	private int cs_no; //문의 순번, 번호
	private String user_id; //회원 아이디
	private String cs_serial; //문의 고유번호
	private String cs_code; //문의 유형
	private Date cs_dt; //등록일자
	private String cs_title; //문의 제목
	private String cs_content; //문의 내용
	private String proc_id; //답변 처리자 아이디
	private String proc_sts; //답변 처리 상태
	private Date datetime; //상태 변경 일자

}
