package kr.ranian.qaboard.entity;

import lombok.Data;

// 페이징 처리를 만드는 클래스 (VO)
@Data
public class PageMaker {
	
	private Criteria cri;		// 페이지번호, 한 페이지당 개수, 현 페이지의 시작번호
	private int totalCount;		// 총 게시글의 수
	private int startPage;		// 시작 페이지번호
	private int endPage;		// 끝 페이지번호 (끝이 28일 경우 조정 필요) 
	private boolean prev;		// 이전버튼 여부 
	private boolean next;		// 다음버튼 여부 
	private int displayPageNum = 10;	// 하단에 몇 개씩 페이지를 보여줄 것인가

}
