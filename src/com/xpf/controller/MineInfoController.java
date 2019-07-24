package com.xpf.controller;

import com.github.pagehelper.PageInfo;
import com.xpf.entity.Category;
import com.xpf.entity.MineInfo;
import com.xpf.service.CategoryService;
import com.xpf.service.FileService;
import com.xpf.service.MineInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("mineInfo")
public class MineInfoController {

	@Autowired
	private MineInfoService mineInfoService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private FileService fileService;

	/**
	 * 项目查询
	 * @param category 技术分类
	 * @param context  内容
	 * @param pageNum  页码
	 * @return
	 */
	@RequestMapping("indexQuery")
	public ModelAndView indexQuery(String category,String context,@RequestParam(defaultValue="1")Integer pageNum){
		PageInfo<MineInfo> pageInfo = mineInfoService.indexQuery(category, context, pageNum,3);
		ModelAndView view = new ModelAndView();
		view.addObject("pageInfo",pageInfo);
		view.addObject("category",category);
		view.addObject("context",context);
		view.setViewName("main/main");
		return view;
	}

	/**
	 * 进入项目主页
	 * @param context
	 * @param pageNum
	 * @return
	 */
	@RequestMapping("showAll")
	public ModelAndView showAll(String context,@RequestParam(defaultValue="1")Integer pageNum){
		PageInfo<MineInfo> pageInfo = mineInfoService.queryMineInfo(context, pageNum, 3);
		ModelAndView view = new ModelAndView();
		view.addObject("pageInfo",pageInfo);
		view.addObject("context",context);
		view.setViewName("main/main");
		return view;
	}
	
	@RequestMapping("deleteProject")
	public String deleteProject(Integer id){
		mineInfoService.deleteProject(id);
		return "redirect:/mineInfo/showAll";
	}
	
	@RequestMapping("addProject")
	public String addProject(MineInfo mineInfo){
		mineInfoService.addProject(mineInfo);
		return "redirect:/mineInfo/showAll";
	}

	/**
	 *	通过id查询项目
	 * @param op 操作码
	 * @param id 项目id
	 * @return
	 */
	@RequestMapping("queryOne")
	public ModelAndView queryOne(String op,Integer id){
		ModelAndView view = new ModelAndView();
		MineInfo mineInfo = mineInfoService.queryOne(id);
		view.addObject("mineInfo", mineInfo);
		if("tech".equals(op)){
			view.setViewName("main/techInsert");
		}else if("manager".equals(op)){
			view.setViewName("main/managerInsert");
		}else if("detail".equals(op)){
			//技术分类
			if(StringUtils.isNotBlank(mineInfo.getTechCategory())){
				Category category = categoryService.findById(Integer.parseInt(mineInfo.getTechCategory()));
				if(StringUtils.isNotBlank(category.getName())){
					view.addObject("techCategory",category.getName());
				}
			}
			view.setViewName("main/detail");
		}
		//项目报告
		else if("report".equals(op)){
			if(fileService.getByDataId(id,"report").size()>0){
				view.addObject("file",fileService.getByDataId(id,"report").get(0));
			}else {
				view.addObject("file",null);
			}

			view.setViewName("main/report");
		}
		return view;
	}
	
	@RequestMapping("updateTech")
	public String updateTech(MineInfo mineInfo){
		mineInfoService.updateMineInfo(mineInfo);
		return "redirect:/mineInfo/showAll";
	}
	
	@RequestMapping("updateManager")
	public String updateManager(MineInfo mineInfo, @RequestParam("organUpload") MultipartFile organUpload,
								@RequestParam("workProceUpload") MultipartFile workProceUpload, @RequestParam("workFileUpload") MultipartFile workFileUpload,
								@RequestParam("operProceUpload") MultipartFile operProceUpload,
								@RequestParam("manageRespUpload") MultipartFile manageRespUpload, HttpSession session
	) {

		mineInfoService.updateMineInfo(mineInfo);
		return "redirect:/mineInfo/showAll";
	}
	


	

}
