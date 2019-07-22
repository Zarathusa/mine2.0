package com.xpf.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.github.pagehelper.PageInfo;
import com.xpf.entity.MineInfo;
import com.xpf.service.MineInfoService;

public class MineInfoServiceTest {

	@Resource
	private MineInfoService mineInfoService;
	
	@Test
	public void testQuery(){
		PageInfo<MineInfo> pageInfo = mineInfoService.queryMineInfo("测试",1,3);
		System.out.println(pageInfo);
		List<MineInfo> list = pageInfo.getList();
		for (MineInfo mineInfo : list) {
			System.out.println(mineInfo);
		}
	}
	@Test
	public void test1(){
		
	}
}
