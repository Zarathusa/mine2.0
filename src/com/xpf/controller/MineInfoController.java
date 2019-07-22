package com.xpf.controller;

import com.github.pagehelper.PageInfo;
import com.xpf.entity.Category;
import com.xpf.entity.MineInfo;
import com.xpf.service.CategoryService;
import com.xpf.service.MineInfoService;
import com.xpf.util.XDocService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;

@Controller
@RequestMapping("mineInfo")
public class MineInfoController {

	@Autowired
	private MineInfoService mineInfoService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping("showAll")
	public ModelAndView showAll(String projectName,@RequestParam(defaultValue="1")Integer pageNum){
		PageInfo<MineInfo> pageInfo = mineInfoService.queryMineInfo(projectName, pageNum, 3);
		ModelAndView view = new ModelAndView();
		view.addObject("pageInfo",pageInfo);
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
			Category category = categoryService.findById(Integer.parseInt(mineInfo.getTechCategory()));
			if(StringUtils.isNotBlank(category.getName())){
				view.addObject("techCategory",category.getName());
			}

			view.setViewName("main/detail");
		}else if("report".equals(op)){
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
	public String updateManager(MineInfo mineInfo,@RequestParam("organUpload")MultipartFile organUpload,
			@RequestParam("workProceUpload")MultipartFile workProceUpload,@RequestParam("workFileUpload")MultipartFile workFileUpload,
			@RequestParam("operProceUpload")MultipartFile operProceUpload,
			@RequestParam("manageRespUpload")MultipartFile manageRespUpload,HttpSession session
			){
		if(!organUpload.isEmpty()){
			String organ = upload("organUpload",organUpload,session);
			mineInfo.setOrgan(organ);
		}
		if(!workProceUpload.isEmpty()){
			String workProce = upload("workProceUpload",workProceUpload,session);
			mineInfo.setWorkProce(workProce);
		}
		if(!workFileUpload.isEmpty()){
			String workFile = upload("workFileUpload",workFileUpload,session);
			mineInfo.setWorkFile(workFile);
		}
		if(!operProceUpload.isEmpty()){
			String operProce = upload("operProceUpload",operProceUpload,session);
			mineInfo.setOperProce(operProce);
		}
		if(!manageRespUpload.isEmpty()){
			String manageRespFile = upload("manageRespUpload",manageRespUpload,session);
			mineInfo.setManageRespFile(manageRespFile);
		}
		mineInfoService.updateMineInfo(mineInfo);
		return "redirect:/mineInfo/showAll";
	}
	
	@RequestMapping("updateReport")
	public String updateReport(Integer id,@RequestParam("reportUpload")MultipartFile reportUpload,HttpSession session){
		if(!reportUpload.isEmpty()){
			String report = upload("reportUpload", reportUpload, session);
			MineInfo mineInfo = new MineInfo();
			mineInfo.setId(id);
			mineInfo.setProjectReport(report);
			mineInfoService.updateMineInfo(mineInfo);
		}
		return "redirect:/mineInfo/showAll";
	}
	
	
	
	/**
	 * 
	 * @param dir
	 * @param upload
	 * @param session
	 * @return
	 */
	public String upload(String dir,MultipartFile upload,HttpSession session){
		//获取文件名
		String filename = upload.getOriginalFilename();
		//获取上传文件夹路径
		String realPath = session.getServletContext().getRealPath("/"+dir);
		//若没有文件夹则创建文件夹
		File file = new File(realPath);
		if(!file.exists()){
			file.mkdir();
		}
		//给文件名加上时间戳，使文件名唯一，不会被覆盖
		//linux中文文件名上传乱码（用英文代替）
		String newName=new Date().getTime()+"-"+dir;
		if(filename.endsWith(".pdf")){
			try {
				upload.transferTo(new File(realPath,newName+".pdf"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(filename.endsWith(".docx")||filename.endsWith(".doc")){
			//文件上传
			try {
				upload.transferTo(new File(realPath,newName+".docx"));
				//再存一份pdf
				XDocService service = new XDocService();
				service.to(realPath+"/"+newName+".docx", new File(realPath+"/"+newName+".pdf"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String url=null;
		if(filename.endsWith(".pdf")||filename.endsWith(".docx")||filename.endsWith(".doc")){
			url="/"+dir+"/"+newName;
		}
		return url;
	}
}
