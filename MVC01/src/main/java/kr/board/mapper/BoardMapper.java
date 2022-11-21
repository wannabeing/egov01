package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;

@Mapper
public interface BoardMapper {
	// 모든 글 조회 
	public List<Board> getLists();
	
	// 글 생성 
	public void boardCreate(Board board);
	
	// 상세 글 조회 
	public Board BoardDetail(int idx);
	
	// 글 삭제 
	public void boardDel(int idx);
	
	// 글 수정 
	@Update("update board set title=#{title}, content=#{content} where idx=#{idx}")
	public void boardUpdate(Board board);
	
	// 글 조회수 증가 
	@Update("update board set count=count+1 where idx=#{idx}")
	public void boardCount(int idx);
}
