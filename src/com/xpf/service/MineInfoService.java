package com.xpf.service;


import com.github.pagehelper.PageInfo;
import com.xpf.entity.MineInfo;

public interface MineInfoService {

	PageInfo<MineInfo> queryMineInfo(String projectName,Integer pageNum,Integer pageSize);
	
	void deleteProject(Integer id);
	
	void addProject(MineInfo mineInfo);
	
	MineInfo queryOne(Integer id);
	
	void updateMineInfo(MineInfo mineInfo);

	PageInfo<MineInfo> indexQuery(String category,String context,Integer pageNum,Integer pageSize);
}
