package kr.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Board;

@Controller
public class BoardController {
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		
		Board vo = new Board();
		vo.setIdx(0);
		vo.setTitle("test");
		vo.setWriter("choihyuk");
		vo.setContent("test입니다");
		vo.setIndate("2022-01-30");
		vo.setCount(1);
		
		List<Board> list = new ArrayList<Board>();
		list.add(vo);
		
		model.addAttribute("list", list);
		return "boardList";
	}
	
	

}
