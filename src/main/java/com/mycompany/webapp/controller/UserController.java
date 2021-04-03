package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycompany.webapp.dto.Users;
import com.mycompany.webapp.service.UsersService;

@Controller
public class UserController {
	private static final Logger logger =
			LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UsersService usersService;
	
	@GetMapping("/auth/login")
	public String openLogin() {
		return "user/login";
	}
	

	@GetMapping("/signup")
	public String openSignup() {
		return "user/signup";
	}
	
	@PostMapping("/signup")
	public String Signup(Users user) {
		
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		user.setUserPassword(bpe.encode(user.getUserPassword()));
		String encodedPassword = bpe.encode(user.getUserPassword());
		
		int result = usersService.join(user);
		
		
		return "redirect:/main";
	}
	
	@GetMapping("/findidpw")
	public String openFindIdPw() {
		return "user/findidpw";
	}
	
	@PostMapping("/findid")
	public String findId(String userName, String userPhone, Model model) {
		
		logger.info(userName);
		logger.info(userPhone);
		String id = usersService.findById(userName, userPhone);
		
		logger.info(id);
		model.addAttribute("userId", id);
		
		return "user/findid";
	}
	
	
	@GetMapping("/changePassword")
	public String changePassword() {
		return "user/changepassword";
	}
	
	

	
	
}
