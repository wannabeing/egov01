package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/")
	public String main() {
		return "single";
	}
	@RequestMapping("/boardList.do")
	public @ResponseBody List<Board> boardList(){
		List<Board> list = boardMapper.getLists();
		return list; // @ResponseBody를 통하여 json형태로 return
	}
	@PostMapping("/createBoard.do")
	public @ResponseBody void createBoard(Board paramBoard) {
		boardMapper.boardCreate(paramBoard);
		// return이 없으니, 제어권을 넘긴다.
	}
	@PostMapping("/delBoard.do")
	public @ResponseBody void delBoard(int idx) {
		boardMapper.boardDel(idx);
		// return이 없으니, 제어권을 넘긴다. 
	}
	@PostMapping("/editBoard.do")
	public @ResponseBody void editBoard(Board editBoard) {
		boardMapper.boardUpdate(editBoard);
		// return이 없으니, 제어권을 넘긴다. 
	}
	
}
