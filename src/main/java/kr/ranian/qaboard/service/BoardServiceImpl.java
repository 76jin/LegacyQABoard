package kr.ranian.qaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ranian.qaboard.entity.Board;
import kr.ranian.qaboard.entity.Criteria;
import kr.ranian.qaboard.entity.Member;
import kr.ranian.qaboard.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<Board> getList(Criteria cri) {
		List<Board> list = boardMapper.getList(cri);
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

	@Override
	public void replyProcess(Board board) {
		// - 답글 만들기
		// 1 부모글(원글)의 정보 가져오기 
		Board parent = boardMapper.read(board.getIdx());
		
		// 2 부모글의 boardGroup의 값을 답글 정보에 저장 
		board.setBoardGroup(parent.getBoardGroup());
		
		// 3 부모글의 boardSequence의 값을 답글 정보에 저장
		board.setBoardSequence(parent.getBoardSequence() + 1);
		
		// 4 부모글의 boardLevel의 값을 답글 정보에 저장
		board.setBoardLevel(parent.getBoardLevel() + 1);
		
		// 5 같은 boardSequence의 글 중에서 부모글의 boardSequence 보다 큰 값들을 모두 1씩 업데이트하기
		boardMapper.replySeqUpdate(parent);
		
		// 6 답글 저장 
		boardMapper.replyInsert(board);
	}

	@Override
	public int totalCount(Criteria cri) {
		return boardMapper.totalCount(cri);
	}

}
