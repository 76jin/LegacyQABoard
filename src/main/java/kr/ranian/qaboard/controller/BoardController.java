package kr.ranian.qaboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ranian.qaboard.entity.Board;
import kr.ranian.qaboard.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/list")
	public String getList(Model model) {
		List<Board> list = boardService.getList();
		
		model.addAttribute("list", list);
		return "board/list";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		return "board/register";
	}

}
