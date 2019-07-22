package com.xpf.controller;

import com.xpf.entity.Category;
import com.xpf.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  技术分类
 */
@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @ResponseBody
    @RequestMapping("list")
    public Map<String, List> list(){
        HashMap<String, List> map = new HashMap<>();
        List<Category> list = categoryService.queryAll();
        map.put("list",list);
        return map;
    }
}
