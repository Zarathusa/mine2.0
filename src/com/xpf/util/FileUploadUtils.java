package com.xpf.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class FileUploadUtils {

    /**
     *
     * @param dir
     * @param upload
     * @param session
     * @return
     */
    public static Map<String,String> upload(String dir, MultipartFile upload, HttpSession session){
        Map<String, String> map = new HashMap<>();
        //获取文件名
        String filename = upload.getOriginalFilename();
        map.put("name",filename);
        map.put("fileType",null);
        map.put("url",null);
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
                map.put("fileType","pdf");
                map.put("url","/"+dir+"/"+newName+".pdf");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(filename.endsWith(".docx")){
            //文件上传
            try {
                upload.transferTo(new File(realPath,newName+".docx"));
                map.put("fileType","docx");
                map.put("url","/"+dir+"/"+newName+".docx");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(filename.endsWith(".doc")){
            try {
                upload.transferTo(new File(realPath,newName+".doc"));
                map.put("fileType","doc");
                map.put("url","/"+dir+"/"+newName+".doc");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return map;
    }
}
