package com.xpf.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

@Table(name = "t_file")
public class File {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 所对应的项目id
     */
    @Column(name = "data_id")
    private Integer dataId;

    /**
     * 文件类型
     * report:报告
     * organ:组织机构
     * workProce:作业控制程序
     * workFile:作业指导文件
     * operProce:操作规程
     * manageResp:管理职责
     */
    @Column
    private String type;

    /**
     * doc docx pdf
     */
    @Column
    private String fileType;

    @Column
    private String name;

    @Column
    private String url;

    @Column
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createDate;

    public File() {
    }

    public File(Integer dataId, String type, String fileType, String name, String url, Date createDate) {
        this.dataId = dataId;
        this.type = type;
        this.fileType = fileType;
        this.name = name;
        this.url = url;
        this.createDate = createDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDataId() {
        return dataId;
    }

    public void setDataId(Integer dataId) {
        this.dataId = dataId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
