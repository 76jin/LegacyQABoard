package kr.ranian.qaboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 한글 인코딩 주의
	@PostMapping("/register")
	public String register(Board board, RedirectAttributes rttr) {
		
		boardService.register(board);
		
		rttr.addFlashAttribute("result", board.getIdx());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("idx") int idx, Model model) {
		Board board = boardService.get(idx);
		model.addAttribute("board", board);
		return "board/get";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("idx") int idx, Model model) {
		Board board = boardService.get(idx);
		model.addAttribute("board", board);
		return "board/modify";
	}
	
	@PostMapping("/modify")
	public String modify(Board board) {
		boardService.modify(board);
		return "redirect:/board/list";
	}
	
	@GetMapping("/remove")
	public String remove(int idx) {
		boardService.remove(idx);
		return "redirect:/board/list";
	}

}
