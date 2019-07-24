package com.xpf.service;

import com.xpf.entity.File;

import java.util.List;

public interface FileService {

    int save(File file);

    File getById(Integer id);

    /**
     * 通过项目id查询文件
     * @param dataId
     * @param type
     * @return
     */
    List<File> getByDataId(Integer dataId, String type);
}
