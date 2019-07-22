package com.xpf.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xpf.entity.User;
import com.xpf.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("login")
	public String login(String username,String password,String enCode,HttpSession session){
		User user = userService.login(username, password);
		String validationCode=(String)session.getAttribute("validationCode");
		if(user!=null&&validationCode.equals(enCode)){
			session.setAttribute("user", user);
			return "redirect:/mineInfo/showAll";
		}
		return "redirect:/login.jsp";
	}
	
	@RequestMapping("exit")
	public String exit(HttpSession session){
		session.invalidate();
		return "redirect:/login.jsp";
	}
	
	@RequestMapping("addUser")
	public String addUser(User user){
		if(!user.getUsername().isEmpty()&&!user.getPassword().isEmpty()){
			userService.addUser(user);
		}
		return "redirect:/login.jsp";
	}
}
