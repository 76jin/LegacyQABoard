package kr.ranian.qaboard.mapper;

import java.util.List;

import kr.ranian.qaboard.entity.Board;

//import org.apache.ibatis.annotations.Mapper;

//@Mapper
public interface BoardMapper {	// @, XML
	
	public List<Board> getList();

}
