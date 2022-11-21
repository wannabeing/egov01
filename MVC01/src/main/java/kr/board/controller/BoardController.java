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
	@GetMapping("/boardList.do")
	public String boardList(Model model) {
		
		List<Board> list = boardMapper.getLists();
		
		model.addAttribute("list", list);
		return "boardList"; // boardList.jsp
	}
	/**
	 * 작성 폼을 보여준다.
	 * @return 글 작성 폼 
	 */
	@GetMapping("/boardForm.do")
	public String boardForm() {
		return "boardForm"; // boardForm.jsp
	}
	/**
	 * 글 작성 후에 해당 글을 보여준다.   
	 * @return 모든 글 
	 */
	@PostMapping(value="boardCreate.do", produces = "application/text; charset=utf8")
	public String boardCreate(Board paramBoard) { // parameter를 자동으로 Board객체에 넣어준다.
		
		boardMapper.boardCreate(paramBoard); // 글 생성 
		
		return "redirect:/boardList.do";
	}
	/**
	 * 상세 글을 보여준다. 
	 * @param idx
	 * @param model
	 * @return 상세 글 
	 */
	@GetMapping("/boardDetail.do/{idx}")
	public String boardDetail(@PathVariable("idx") int idx, Model model) {
		Board board = boardMapper.BoardDetail(idx);
		boardMapper.boardCount(idx);
		model.addAttribute("board", board);
		
		return "boardContent"; // boardContent.jsp
	}
	/**
	 * 글을 삭제한다. 
	 * @param idx
	 * @return 모든 글 
	 */
	@GetMapping("/boardDel.do/{idx}")
	public String boardDel(@PathVariable("idx") int idx) {
		
		boardMapper.boardDel(idx); // 글 삭제 
		
		return "redirect:/boardList.do";
	}
	/**
	 * 글 수정 폼을 보여준다. 
	 * @param idx
	 * @param model
	 * @return 글 수정 폼 
	 */
	@GetMapping("/boardEditForm.do/{idx}")
	public String boardEditForm(@PathVariable("idx") int idx, Model model) {
		
		Board board = boardMapper.BoardDetail(idx);
		model.addAttribute("board", board);
		return "boardEditForm"; // boardEdit.jsp
	}
	
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(Board paramBoard) {
		
		boardMapper.boardUpdate(paramBoard); // 글 수정
		return "redirect:/boardList.do";
	}
	
	
	

}
