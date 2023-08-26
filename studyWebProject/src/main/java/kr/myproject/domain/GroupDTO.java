package kr.myproject.domain;

import java.sql.Date;

import lombok.Data;

//스터디모임 DTO
@Data
public class GroupDTO {
	
	private int group_no; //모임 순번
	private String group_key; //모임 고유번호
	private String group_category; //모임 카테고리
	private String group_name; //모임명
	private String group_maker; //모임 개설자 아이디
	private int group_boundary; //모임 인원 설정
	private String group_info; //모임 소개 내용
	private String member_count; //모임의 참가인원 숫자
	private String use_yn; //모임 활성화 여부
	private Date register_dt; //모임 개설 일자
	
	private String member_id; //참가인원 아이디
	private String member_nickname; //참가인원 닉네임
	private String member_role; //멤버 권한
	private String member_code; //멤버 구분(개설자, 참여자)
	private Date join_dt; //가입일자

}
