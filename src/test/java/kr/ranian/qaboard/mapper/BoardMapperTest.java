package kr.ranian.qaboard.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ranian.qaboard.entity.Board;
import kr.ranian.qaboard.entity.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTest {
	
	@Autowired
	BoardMapper boardMapper;
	
	@Test
	public void testInsertSelectKey() throws Exception {
		Board board = new Board();
		board.setMemID("test01");
		board.setTitle("새로 작성한 글2");
		board.setContent("새로 작성한 글2");
		board.setWriter("관리자");
		boardMapper.insertSelectKey(board);
		
		log.info(board);
	}
	
	@Test
	public void testInsert() throws Exception {
		Board board = new Board();
		board.setMemID("test01");
		board.setTitle("새로 작성한 글");
		board.setContent("새로 작성한 글");
		board.setWriter("관리자");
		boardMapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		List<Board> list = boardMapper.getList(cri);
		for (Board board : list) {
			log.info(board);
		}
	}

}
