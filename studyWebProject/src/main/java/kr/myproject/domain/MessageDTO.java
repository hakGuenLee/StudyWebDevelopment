package kr.myproject.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MessageDTO {
	
	private int msg_no; //메시지 번호
	private String msg_sender; //발신자 닉네임
	private String msg_category; //메시지 유형
	private String msg_title; //메시지 제목
	private String msg_content; //메시지 내용
	private String msg_receiver; //수신자
	private String msg_check; //수신 여부
	private Date msg_dt; //도착일자
	private Date read_dt; //메시지 확인 일자

}
