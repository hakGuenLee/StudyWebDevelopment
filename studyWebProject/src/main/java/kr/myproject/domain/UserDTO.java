package kr.myproject.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class UserDTO {
	
	private int user_no; //회원 번호
	private String user_id; //회원 아이디
	private String user_nickname; //회원 닉네임
	private String user_pw; //패스워드
	private String user_nm; //회원명
	private String user_home; //자택번호
	private String user_phone; //휴대번호
	private String user_email; //회원이메일
	private Date birth_ymd; //생년월일
	private String zipcode; //우편번호
	private String addr_jibun; //지번주소
	private String addr_road; //도로명주소
	private String addr_detail; //상세주소
	private String use_yn; //계정 활성화 여부
	private Date register_dt; //가입일자
	
	

}
