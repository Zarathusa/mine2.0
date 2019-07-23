package com.xpf.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xpf.dao.MineInfoMapper;
import com.xpf.entity.MineInfo;
import com.xpf.service.MineInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

import java.util.List;

@Service
@Transactional
public class MineInfoServiceImpl implements MineInfoService{

	@Autowired
	private MineInfoMapper mineInfoMapper;
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public PageInfo<MineInfo> queryMineInfo(String projectName, Integer pageNum,
			Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		Example example = new Example(MineInfo.class);
		example.setOrderByClause("id desc");
		Criteria criteria = example.createCriteria();
		if(projectName==null){
			criteria.andLike("projectName", "%");
		}else{
			criteria.andLike("projectName", "%"+projectName+"%");
		}
		List<MineInfo> list = mineInfoMapper.selectByExample(example);
		PageInfo<MineInfo> pageInfo = new PageInfo<MineInfo>(list);
		return pageInfo;
	}

	@Override
	public void deleteProject(Integer id) {
		mineInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void addProject(MineInfo mineInfo) {
		mineInfoMapper.insert(mineInfo);
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public MineInfo queryOne(Integer id) {
		MineInfo mineInfo = mineInfoMapper.selectByPrimaryKey(id);
		return mineInfo;
	}

	@Override
	public void updateMineInfo(MineInfo mineInfo) {
		mineInfoMapper.updateByPrimaryKeySelective(mineInfo);
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public PageInfo<MineInfo> indexQuery(String category, String context, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		Example example = new Example(MineInfo.class);
		example.setOrderByClause("id desc");
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotBlank(category)){
			criteria.andEqualTo("techCategory",category);
		}
		if(StringUtils.isNotBlank(context)){
			criteria.andLike("projectName", "%"+context+"%");
		}
		List<MineInfo> list = mineInfoMapper.selectByExample(example);
		if(list.size()==0){
			PageHelper.startPage(pageNum, pageSize);
			Example example2 = new Example(MineInfo.class);
			example2.setOrderByClause("id desc");
			Criteria criteria2 = example2.createCriteria();
			if(StringUtils.isNotBlank(category)){
				criteria2.andEqualTo("techCategory",category);
			}
			if(StringUtils.isNotBlank(context)){
				criteria2.andLike("mineName","%"+context+"%");
			}
			list = mineInfoMapper.selectByExample(example2);

		}
		return new PageInfo<MineInfo>(list);
	}

}
