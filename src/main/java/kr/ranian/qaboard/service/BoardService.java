package kr.ranian.qaboard.service;

import java.util.List;

import kr.ranian.qaboard.entity.Board;
import kr.ranian.qaboard.entity.Member;

public interface BoardService {
	
	public List<Board> getList();
	public Member login(Member member);

}
