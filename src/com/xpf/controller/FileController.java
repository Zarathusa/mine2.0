package com.xpf.controller;

import com.xpf.entity.File;
import com.xpf.service.FileService;
import com.xpf.util.FileUploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("file")
public class FileController {

    @Autowired
    private FileService fileService;

    /**
     * 上传项目报告
     * @param id
     * @param reportUpload
     * @param session
     * @return
     */
    @RequestMapping("uploadReport")
    public String updateReport(Integer id,@RequestParam("reportUpload")MultipartFile reportUpload,HttpSession session){
        if(!reportUpload.isEmpty()){
            Map<String,String> upload = FileUploadUtils.upload("reportUpload", reportUpload, session);
            File file = new File(id,"report",upload.get("fileType"),upload.get("name"),upload.get("url"),new Date());
            fileService.save(file);
        }
        return "redirect:/mineInfo/showAll";
    }

    @RequestMapping("singleUpload")
    public Map singleUpload(@RequestParam("singleFile") MultipartFile singleFile, @RequestParam("id")Integer id,
                            @RequestParam("type")String type , HttpSession session){
        Map upload= FileUploadUtils.upload(type,singleFile,session);
        Map<Object, Object> map = new HashMap<>();
        return map;
    }

}
