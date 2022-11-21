package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.board.entity.Board;

@Mapper
public interface BoardMapper {
	// 모든 글 조회 
	public List<Board> getLists();
	
	// 글 생성 
	public void boardCreate(Board board);
	
}
