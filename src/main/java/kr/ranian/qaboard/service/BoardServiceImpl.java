package kr.ranian.qaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ranian.qaboard.entity.Board;
import kr.ranian.qaboard.entity.Member;
import kr.ranian.qaboard.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<Board> getList() {
		List<Board> list = boardMapper.getList();
		return list;
	}

	@Override
	public Member login(Member member) {
		Member loginMember = boardMapper.login(member);
		return loginMember;
	}

	@Override
	public void register(Board board) {
		boardMapper.insertSelectKey(board);
	}

	@Override
	public Board get(int idx) {
		Board board = boardMapper.read(idx);
		return board;
	}

	@Override
	public void modify(Board board) {
		boardMapper.update(board);
	}

	@Override
	public void remove(int idx) {
		boardMapper.delete(idx);
	}

}
