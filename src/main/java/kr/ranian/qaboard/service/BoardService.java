package kr.ranian.qaboard.service;

import java.util.List;

import kr.ranian.qaboard.entity.Board;
import kr.ranian.qaboard.entity.Criteria;
import kr.ranian.qaboard.entity.Member;

public interface BoardService {
	
	public List<Board> getList(Criteria cri);
	public Member login(Member member);
	public void register(Board board);
	public Board get(int idx);
	public void modify(Board board);
	public void remove(int idx);
	public void replyProcess(Board board);
	public int totalCount();

}
