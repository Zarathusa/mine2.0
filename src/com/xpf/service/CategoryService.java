package com.xpf.service;

import com.xpf.entity.Category;

import java.util.List;

public interface CategoryService {

    List<Category> queryAll();

    Category findById(Integer id);
}
