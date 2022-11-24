package kr.board.entity;

import lombok.Data;

@Data
public class User {
	private int idx;
	private String userId;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String email;
	private String profile;
	private String indate;
	// setter,getter는 Lombok API 사용
	
}
