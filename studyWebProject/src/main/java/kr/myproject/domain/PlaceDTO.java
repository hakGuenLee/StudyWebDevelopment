package kr.myproject.domain;

import lombok.Data;

@Data
public class PlaceDTO {
	private int wish_no; //모임 위시리스트 순번
	private String user_id; //회원 아이디
	private String space_name; //장소명
	private String space_addr; //장소 주소
	private String space_tel; //장소 연락처

}
