package kr.myproject.domain;

import lombok.Getter;
import lombok.Setter;

//PageNation 담당

@Getter
@Setter
public class PageDTO {

	private int viewPage = 1;
	
	private int blockSize = 5;
	private int blockNum;
	private int blockStart;
	private int blockEnd;
	private int prevPage;
	private int nextPage;
	private int totalPage;
	private int totalCnt;
	private int startRowNum;
	
	private int startIndex;
	private int cntPerPage = 10;
	
	public void setValue(int totalCnt, int cntPerPage) {// 처음에는 113, 10이 넘어옴
		this.totalCnt = totalCnt;
		//전체 페이지 수 구하기
		
		this.totalPage = (int)Math.ceil((double)totalCnt/cntPerPage);  // 전체 게시글 수 (113) / 10     
										
		//페이지별 시작값
		this.startIndex = (viewPage-1)*cntPerPage;   // 2일경우 (2-1)*10 > 
			//10
		// 현재 페이지의 블럭 위치 : 0부터 시작
		
		this.blockNum = (viewPage-1)/blockSize; // 2일 경우 (2-1)/5 > 5
	  	//5
		//블럭의 시작값 : 1, 6, 11, 
		this.blockStart = (blockSize*blockNum)+1;
		//1 
		this.blockEnd = blockStart+(blockSize - 1); 
		if(blockEnd > totalPage) blockEnd = totalPage;
		//5
		//이전 페이지
		this.prevPage = blockStart - 1;
		//1 > 0
		//다음 페이지
		this.nextPage = blockEnd + 1;
		// 6
		// nextPage는 전체 페이지를 초과할 수 없다
		if(nextPage > totalPage) nextPage = totalPage;
		
		//행번호 구하기
		// totalCnt(전체게시글 수) : 116, cntPerPage : 10, totalPage : 12   내림차순정렬

		// 1페이지 > 116 ~ 106
		// 2페이지 > 105

		//startRowNum : 페이지 시작 번호
		//1페이지 시작 번호 : totalCnt - 0
		//2페이지 시작 번호 : totalCnt - 10
		//3페이지 시작 번호 : totalCnt - 20

		startRowNum = totalCnt - (viewPage - 1)*cntPerPage;
		
		
	}
}
