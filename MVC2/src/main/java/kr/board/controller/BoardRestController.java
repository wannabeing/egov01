package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@RequestMapping("/board")
@RestController
public class BoardRestController {
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/list")
	public List<Board> boardList(){
		List<Board> list = boardMapper.getLists();
		return list; // @ResponseBody를 통하여 json형태로 return
	}
	@GetMapping("/{idx}")
	public Board detailBoard(@PathVariable("idx") int idx) {
		boardMapper.boardCount(idx); // 조회수 증가 
		Board board = boardMapper.BoardDetail(idx);
		return board; // @ResponseBody를 통하여 JSON 형태로 return
	}
	@PostMapping("/create")
	public void createBoard(Board paramBoard) {
		boardMapper.boardCreate(paramBoard);
		// return이 없으니, 제어권을 넘긴다.
	}
	@DeleteMapping("/{idx}")
	public void delBoard(@PathVariable("idx") int idx) {
		boardMapper.boardDel(idx);
		// return이 없으니, 제어권을 넘긴다. 
	}
	@PutMapping("/edit")
	public void editBoard(@RequestBody Board editBoard) {
		boardMapper.boardUpdate(editBoard);
		// return이 없으니, 제어권을 넘긴다. 
	}
}
