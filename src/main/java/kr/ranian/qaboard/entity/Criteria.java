package kr.ranian.qaboard.entity;

import lombok.Data;

@Data
public class Criteria {
	
	private int page;		// 현재 페이지 번호 
	private int perPageNum;	// 한 페이지에 보여줄 개시글의 수
	
	// 검색 조건 
	private String type;
	private String keyword;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 5;	// 기본값 
	}
	
	// 현재 페이지 게시글의 시작 페이지번호 
	public int getPageStart() {
		return (page - 1) * perPageNum;	// 1page: 0~, 2page: 10~, 3page: 20~ :: limit 0, ?
	}

}
