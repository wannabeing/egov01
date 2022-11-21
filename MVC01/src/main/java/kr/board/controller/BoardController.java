package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	/**
	 * 모든 글을 보여준다. 
	 * @param model
	 * @return 모든 글
	 */
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		
		List<Board> list = boardMapper.getLists();
		
		model.addAttribute("list", list);
		return "boardList";
	}
	/**
	 * 작성 폼을 보여준다.
	 * @return 글 작성 폼 
	 */
	@GetMapping("/boardForm.do")
	public String boardForm() {
		return "boardForm";
	}
	/**
	 * 글 작성 후에 모든 글을 보여준다.  
	 * @return 모든 글 
	 */
	@PostMapping(value="boardCreate.do")
	public String boardCreate(Board board) { // parameter를 자동으로 Board객체에 넣어준다.
		System.out.println(board.getTitle());
		boardMapper.boardCreate(board);
		return "redirect:/boardList.do";
	}
	
	

}
