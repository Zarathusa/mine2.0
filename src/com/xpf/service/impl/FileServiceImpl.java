package com.xpf.service.impl;

import com.xpf.dao.FileMapper;
import com.xpf.entity.File;
import com.xpf.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
@Transactional
public class FileServiceImpl implements FileService {

    @Autowired
    private FileMapper fileMapper;

    @Override
    public int save(File file) {
        return fileMapper.insert(file);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public File getById(Integer id) {
        return fileMapper.selectByPrimaryKey(id);
    }


    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<File> getByDataId(Integer dataId,String type) {
        Example example = new Example(File.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("dataId",dataId);
        criteria.andEqualTo("type",type);
        List<File> files = fileMapper.selectByExample(example);
        return files;
    }
}
