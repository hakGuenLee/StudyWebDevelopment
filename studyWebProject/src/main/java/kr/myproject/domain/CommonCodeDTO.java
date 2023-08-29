package kr.myproject.domain;

import java.sql.Date;

import lombok.Data;


@Data
public class CommonCodeDTO {

	private int cm_no; //코드 순번
	private String cm_cd; //코드 번호
	private String cm_nm; //코드명
	private String item_cd; //세부항목 번호
	private String item_nm; //세부항목 명
	private String use_yn; //사용여부
	private String proc_id; //등록자 아이디
	private Date proc_dt; //등록일자
}
