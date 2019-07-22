package com.xpf.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xpf.dao.MineInfoMapper;
import com.xpf.dao.UserMapper;
import com.xpf.entity.MineInfo;
import com.xpf.entity.User;

public class MineInfoMapperTest {

	private ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring.xml");
	private MineInfoMapper mineInfoMapper = (MineInfoMapper)applicationContext.getBean("mineInfoMapper");
	private UserMapper userMapper = (UserMapper)applicationContext.getBean("userMapper");
	
	@Test
	public void test1(){
		List<MineInfo> list = mineInfoMapper.selectAll();
		for (MineInfo mineInfo : list) {
			System.out.println(mineInfo);
		}
	}
	
	@Test
	public void test2(){
		PageHelper.startPage(1, 3);
		Example example = new Example(MineInfo.class);
		Criteria criteria = example.createCriteria();
		criteria.andLike("projectName", "%"+""+"%");
		List<MineInfo> list = mineInfoMapper.selectByExample(example);
		PageInfo<MineInfo> pageInfo = new PageInfo<MineInfo>(list);
		List<MineInfo> list2 = pageInfo.getList();
		for (MineInfo mineInfo : list2) {
			System.out.println(mineInfo);
		}
	}
	
	@Test
	public void test3(){
		MineInfo mineInfo = new MineInfo();
		mineInfo.setId(9);
		mineInfo.setProjectEffect("2");
		mineInfoMapper.updateByPrimaryKeySelective(mineInfo);
	}
	
	@Test
	public void testLogin(){
		Example example = new Example(User.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("username", "wangqifei");
		criteria.andEqualTo("password", "abc123@@@");
		User user = userMapper.selectOneByExample(example);
		System.out.println(user);
	}
	
	@Test
	public void update(){
		
	}
}
