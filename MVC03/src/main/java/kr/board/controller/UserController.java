package kr.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.mapper.UserMapper;
import kr.board.entity.User;

@Controller
public class UserController {
	
	@Autowired
	private UserMapper userMapper;
	
	@Inject
	private PasswordEncoder pwEncoder;
	
	/**
	 * 
	 * @return 회원가입 페이지 
	 */
	@RequestMapping("/signup.do")
	public String Signup() {
		return "user/signup";
	}
	
	/**
	 * 존재하는 유저인지 확인하는 메소드 
	 * @param userId
	 * @return true/false
	 */
	@RequestMapping("/userCheck.do")
	public @ResponseBody boolean userCheck(@RequestParam("userId") String userId) {
		User user = userMapper.userCheck(userId);
		if(user != null || userId.equals("")) {
			return false; // 존재하는 유저  
		}
		return true; // 사용가능한 ID
		
	}
	@PostMapping("/userRegister.do")
	public @ResponseBody String userRegister(User paramUser, HttpSession session) {
		paramUser.setProfile("");
		
		// pw 암호화 
		String pwEnc = pwEncoder.encode(paramUser.getPw());
		paramUser.setPw(pwEnc);
		
		userMapper.userRegister(paramUser);
		session.setAttribute("userInfo", paramUser);
		
		return paramUser.getUserId();
		
		/* 성공적으로 유저 생성시, 아래 코드 생성하고 싶은데
		resultType boolean으로 받고 어케 true/false로 받는지 모르겠
		boolean isSuccess = userMapper.userRegister(paramUser);
		if(isSuccess) {
			session.setAttribute("userInfo", paramUser);
			return "redirect:/";
		} else {
			return "redirect:/signup.do";
		}
		 */
	}
	@RequestMapping("/login.do")
	public String Login() {
		return "login";
	}
	
}
