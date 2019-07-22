package com.xpf.service;

import com.xpf.entity.User;

public interface UserService {

	User login(String username,String password);
	
	void addUser(User user);
}
