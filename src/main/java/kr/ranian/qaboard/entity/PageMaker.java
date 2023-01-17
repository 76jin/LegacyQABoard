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
	
	// 총 게시물의 수를 구하는 메서드
	public void setTotalCount(int totalCount) {
		this.totalCount =  totalCount;
		makePaging();
	}

	private void makePaging() {
		// 1. 화면에 보여질 마지막 페이지 번호 
		// endPage = ceil(1.7/10) x 10
		endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		
		// 2. 화면에 보여질 시작 페이지 번호 
		startPage = (endPage - displayPageNum) + 1;
		if (startPage <= 0) {
			startPage = 1;
		}
		
		// 3. 마지막 페이지 계산
		int tempEndPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()));
		
		// 4. 화면에 보여질 마지막 페이지 유효성 검사
		if (tempEndPage < endPage) {
			endPage = tempEndPage;
		}
		
		// 5. 이전페이지 버튼(링크) 존재여부 
		prev = (startPage == 1) ? false : true;
		
		// 6. 다음페이지 버튼(링크) 존재여부
		next = (endPage < tempEndPage) ? true : false;
	}

}
