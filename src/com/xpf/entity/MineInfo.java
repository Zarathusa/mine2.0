package com.xpf.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="t_mine")
public class MineInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	/**
	 * 项目名称
	 */
	@Column
	private String projectName;

	/**
	 * 试验矿井名称
	 */
	@Column
	private String mineName;

	/**
	 * 项目作用
	 */
	@Column
	private String projectEffect;

	/**
	 * 矿井状态
	 */
	@Column
	private String mineStatus;

	/**
	 *矿井瓦斯等级
	 */
	@Column
	private String gasGrade;

	/**
	 *地质条件
	 */
	@Column
	private String geoCond;

	/**
	 *煤层赋存
	 */
	@Column
	private String coalSeamGive;

	/**
	 *开采顺序、方法、工艺
	 */
	@Column
	private String exploit;

	/**
	 *瓦斯赋存
	 */
	@Column
	private String gasGive;

	/**
	 *人员构成及素质
	 */
	@Column
	private String staffComp;

	/**
	 *人的技术基础
	 */
	@Column
	private String staffTech;

	/**
	 *工艺适应条件
	 */
	@Column
	private String techCond;

	/**
	 *实施工期
	 */
	@Column
	private String implPeriod;

	/**
	 *是否需分别在煤、岩层中施工
	 */
	@Column
	private String implArea;

	/**
	 *技术复杂程度
	 */
	@Column
	private String techGrade;

	/**
	 *对矿井生产系统布局和采掘施工的影响
	 */
	@Column
	private String mineImpact;

	/**
	 *技术描述
	 */
	@Column
	private String techDesc;

	/**
	 *技术特征
	 */
	@Column
	private String techFeature;

	/**
	 *达到的量化效果
	 */
	@Column
	private String quanEffect;

	/**
	 *组织机构
	 */
	@Column
	private String organ;

	/**
	 *管理职责
	 */
	@Column
	private String manageResp;

	/**
	 *管理职责文件
	 */
	@Column
	private String manageRespFile;

	/**
	 *资源配套
	 */
	@Column
	private String resourceSupport;

	/**
	 *工作环节
	 */
	@Column
	private String workLink;

	/**
	 *技术过程控制文件
	 */
	@Column
	private String techFile;

	/**
	 *作业控制程序
	 */
	@Column
	private String workProce;

	/**
	 *作业指导文件
	 */
	@Column
	private String workFile;

	/**
	 *操作规程
	 */
	@Column
	private String operProce;

	/**
	 *达到的最佳技术指标及标准
	 */
	@Column
	private String techStandard;

	/**
	 *完成效果的最佳时间标准
	 */
	@Column
	private String timeStandard;

	/**
	 *工程量
	 */
	@Column
	private String workAmount;

	/**
	 *项目报告
	 */
	@Column
	private String projectReport;

	/**
	 * 技术分类
	 */
	@Column
	private String techCategory;
	
	public MineInfo() {
		super();
	}

	public MineInfo(String projectName, String mineName, String projectEffect, String mineStatus, String gasGrade, String geoCond, String coalSeamGive, String exploit, String gasGive, String staffComp, String staffTech, String techCond, String implPeriod, String implArea, String techGrade, String mineImpact, String techDesc, String techFeature, String quanEffect, String organ, String manageResp, String manageRespFile, String resourceSupport, String workLink, String techFile, String workProce, String workFile, String operProce, String techStandard, String timeStandard, String workAmount, String projectReport, String techCategory) {
		this.projectName = projectName;
		this.mineName = mineName;
		this.projectEffect = projectEffect;
		this.mineStatus = mineStatus;
		this.gasGrade = gasGrade;
		this.geoCond = geoCond;
		this.coalSeamGive = coalSeamGive;
		this.exploit = exploit;
		this.gasGive = gasGive;
		this.staffComp = staffComp;
		this.staffTech = staffTech;
		this.techCond = techCond;
		this.implPeriod = implPeriod;
		this.implArea = implArea;
		this.techGrade = techGrade;
		this.mineImpact = mineImpact;
		this.techDesc = techDesc;
		this.techFeature = techFeature;
		this.quanEffect = quanEffect;
		this.organ = organ;
		this.manageResp = manageResp;
		this.manageRespFile = manageRespFile;
		this.resourceSupport = resourceSupport;
		this.workLink = workLink;
		this.techFile = techFile;
		this.workProce = workProce;
		this.workFile = workFile;
		this.operProce = operProce;
		this.techStandard = techStandard;
		this.timeStandard = timeStandard;
		this.workAmount = workAmount;
		this.projectReport = projectReport;
		this.techCategory = techCategory;
	}

	public String getTechCategory() {
		return techCategory;
	}

	public void setTechCategory(String techCategory) {
		this.techCategory = techCategory;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getMineName() {
		return mineName;
	}

	public void setMineName(String mineName) {
		this.mineName = mineName;
	}

	public String getProjectEffect() {
		return projectEffect;
	}

	public void setProjectEffect(String projectEffect) {
		this.projectEffect = projectEffect;
	}

	public String getMineStatus() {
		return mineStatus;
	}

	public void setMineStatus(String mineStatus) {
		this.mineStatus = mineStatus;
	}

	public String getGasGrade() {
		return gasGrade;
	}

	public void setGasGrade(String gasGrade) {
		this.gasGrade = gasGrade;
	}

	public String getGeoCond() {
		return geoCond;
	}

	public void setGeoCond(String geoCond) {
		this.geoCond = geoCond;
	}

	public String getCoalSeamGive() {
		return coalSeamGive;
	}

	public void setCoalSeamGive(String coalSeamGive) {
		this.coalSeamGive = coalSeamGive;
	}

	public String getExploit() {
		return exploit;
	}

	public void setExploit(String exploit) {
		this.exploit = exploit;
	}

	public String getGasGive() {
		return gasGive;
	}

	public void setGasGive(String gasGive) {
		this.gasGive = gasGive;
	}

	public String getStaffComp() {
		return staffComp;
	}

	public void setStaffComp(String staffComp) {
		this.staffComp = staffComp;
	}

	public String getStaffTech() {
		return staffTech;
	}

	public void setStaffTech(String staffTech) {
		this.staffTech = staffTech;
	}

	public String getTechCond() {
		return techCond;
	}

	public void setTechCond(String techCond) {
		this.techCond = techCond;
	}

	public String getImplPeriod() {
		return implPeriod;
	}

	public void setImplPeriod(String implPeriod) {
		this.implPeriod = implPeriod;
	}

	public String getImplArea() {
		return implArea;
	}

	public void setImplArea(String implArea) {
		this.implArea = implArea;
	}

	public String getTechGrade() {
		return techGrade;
	}

	public void setTechGrade(String techGrade) {
		this.techGrade = techGrade;
	}

	public String getMineImpact() {
		return mineImpact;
	}

	public void setMineImpact(String mineImpact) {
		this.mineImpact = mineImpact;
	}

	public String getTechDesc() {
		return techDesc;
	}

	public void setTechDesc(String techDesc) {
		this.techDesc = techDesc;
	}

	public String getTechFeature() {
		return techFeature;
	}

	public void setTechFeature(String techFeature) {
		this.techFeature = techFeature;
	}

	public String getQuanEffect() {
		return quanEffect;
	}

	public void setQuanEffect(String quanEffect) {
		this.quanEffect = quanEffect;
	}

	public String getOrgan() {
		return organ;
	}

	public void setOrgan(String organ) {
		this.organ = organ;
	}

	public String getManageResp() {
		return manageResp;
	}

	public void setManageResp(String manageResp) {
		this.manageResp = manageResp;
	}

	public String getManageRespFile() {
		return manageRespFile;
	}

	public void setManageRespFile(String manageRespFile) {
		this.manageRespFile = manageRespFile;
	}

	public String getResourceSupport() {
		return resourceSupport;
	}

	public void setResourceSupport(String resourceSupport) {
		this.resourceSupport = resourceSupport;
	}

	public String getWorkLink() {
		return workLink;
	}

	public void setWorkLink(String workLink) {
		this.workLink = workLink;
	}

	public String getTechFile() {
		return techFile;
	}

	public void setTechFile(String techFile) {
		this.techFile = techFile;
	}

	public String getWorkProce() {
		return workProce;
	}

	public void setWorkProce(String workProce) {
		this.workProce = workProce;
	}

	public String getWorkFile() {
		return workFile;
	}

	public void setWorkFile(String workFile) {
		this.workFile = workFile;
	}

	public String getOperProce() {
		return operProce;
	}

	public void setOperProce(String operProce) {
		this.operProce = operProce;
	}

	public String getTechStandard() {
		return techStandard;
	}

	public void setTechStandard(String techStandard) {
		this.techStandard = techStandard;
	}

	public String getTimeStandard() {
		return timeStandard;
	}

	public void setTimeStandard(String timeStandard) {
		this.timeStandard = timeStandard;
	}

	public String getWorkAmount() {
		return workAmount;
	}

	public void setWorkAmount(String workAmount) {
		this.workAmount = workAmount;
	}

	public String getProjectReport() {
		return projectReport;
	}

	public void setProjectReport(String projectReport) {
		this.projectReport = projectReport;
	}

	@Override
	public String toString() {
		return "MineInfo{" +
				"id=" + id +
				", projectName='" + projectName + '\'' +
				", mineName='" + mineName + '\'' +
				", projectEffect='" + projectEffect + '\'' +
				", mineStatus='" + mineStatus + '\'' +
				", gasGrade='" + gasGrade + '\'' +
				", geoCond='" + geoCond + '\'' +
				", coalSeamGive='" + coalSeamGive + '\'' +
				", exploit='" + exploit + '\'' +
				", gasGive='" + gasGive + '\'' +
				", staffComp='" + staffComp + '\'' +
				", staffTech='" + staffTech + '\'' +
				", techCond='" + techCond + '\'' +
				", implPeriod='" + implPeriod + '\'' +
				", implArea='" + implArea + '\'' +
				", techGrade='" + techGrade + '\'' +
				", mineImpact='" + mineImpact + '\'' +
				", techDesc='" + techDesc + '\'' +
				", techFeature='" + techFeature + '\'' +
				", quanEffect='" + quanEffect + '\'' +
				", organ='" + organ + '\'' +
				", manageResp='" + manageResp + '\'' +
				", manageRespFile='" + manageRespFile + '\'' +
				", resourceSupport='" + resourceSupport + '\'' +
				", workLink='" + workLink + '\'' +
				", techFile='" + techFile + '\'' +
				", workProce='" + workProce + '\'' +
				", workFile='" + workFile + '\'' +
				", operProce='" + operProce + '\'' +
				", techStandard='" + techStandard + '\'' +
				", timeStandard='" + timeStandard + '\'' +
				", workAmount='" + workAmount + '\'' +
				", projectReport='" + projectReport + '\'' +
				", techCategory='" + techCategory + '\'' +
				'}';
	}
}
