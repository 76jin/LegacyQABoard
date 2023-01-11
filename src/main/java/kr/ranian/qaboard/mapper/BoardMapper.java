package kr.ranian.qaboard.mapper;

import java.util.List;

import kr.ranian.qaboard.entity.Board;
import kr.ranian.qaboard.entity.Member;

//import org.apache.ibatis.annotations.Mapper;

//@Mapper
public interface BoardMapper {	// @, XML
	
	public List<Board> getList();
	public void insert(Board board);
	public void insertSelectKey(Board board);
	public Member login(Member member);
	public Board read(int idx);

}
