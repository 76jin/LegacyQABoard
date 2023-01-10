package kr.ranian.qaboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ranian.qaboard.entity.Member;
import kr.ranian.qaboard.service.BoardService;

@Controller
@RequestMapping("/login/")
public class LoginController {
	
	@Autowired
	private BoardService boardService;
	
	@PostMapping("/loginProcess")
	public String login(Member member, HttpSession session) {
		Member loginMember = boardService.login(member);
		if (loginMember != null) {
			session.setAttribute("member", loginMember);
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/logoutProcess")
	public String logout(HttpSession session) {
		session.invalidate();	// 세션 무효화
		return "redirect:/board/list";
	}

}
