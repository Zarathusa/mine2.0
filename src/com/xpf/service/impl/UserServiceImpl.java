package com.xpf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

import com.xpf.dao.UserMapper;
import com.xpf.entity.User;
import com.xpf.service.UserService;

@Service
@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User login(String username, String password) {
		Example example = new Example(User.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("username", username);
		criteria.andEqualTo("password", password);
		User user = (User)userMapper.selectOneByExample(example);
		return user;
	}

	@Override
	@Transactional
	public void addUser(User user) {
		userMapper.insert(user);
	}

}
