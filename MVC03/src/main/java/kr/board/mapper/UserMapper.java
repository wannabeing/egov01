package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;
import kr.board.entity.User;

@Mapper
public interface UserMapper {
	// 존재하는 유저인지 ID로 확인 
	public User userCheck(String userId);
	
	// 유저 등록 
	public void userRegister(User user);
	
}
