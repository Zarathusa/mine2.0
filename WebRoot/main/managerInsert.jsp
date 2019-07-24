<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<jsp:include page="./head.jsp"/>

<body>
<script type="text/javascript">
	$(function(){
		$("#back").click(function(){
			/*window.location.href="${path}/mineInfo/showAll";*/
			window.history.back(-1);
		});

		/* 技术分类下拉列表 */
		$.ajax({
			url:'${path}/category/list',
			success:function (data) {
				data=data.list;
				for(var i=0;i<data.length;i++){
					<c:if test="${mineInfo.techCategory!=null}">
						if(data[i].id==${mineInfo.techCategory}){
							$("#techCategory ").append($("<option value="+data[i].id+" selected='selected'>"+data[i].name+"</option>"));
						}else {
					</c:if>
							$("#techCategory ").append($("<option value="+data[i].id+">"+data[i].name+"</option>"));
					<c:if test="${mineInfo.techCategory!=null}">
						}
					</c:if>

				}
			}
		})

	});
	
	function show_div(value){
		var obj_div=document.getElementById(value);
		obj_div.style.display=(obj_div.style.display=='none')?'block':'none';
		}
	
</script>
<div class="container-fluid">
<div class="row">
<div class="col-sm-12">
	<div class="page-header">
  		<h3>&nbsp;&nbsp;管理体系
  			<button type="button" id="back" class="btn btn-primary pull-right">返回首页 <span class="glyphicon glyphicon-share-alt"></span></button>
  		</h3>
	</div>
</div>
</div>


<div class="container">
		<form action="<c:url value='/mineInfo/updateManager' />" method="post" enctype="multipart/form-data">
			
			<input id="id" name="id" style="display:none;" value="${mineInfo.id}" class="form-control"/>
			
			<div class="row">
				<div class="form-group">
					<label for="projectName">项目名称:</label> 
					<input id="projectName" name="projectName" value="${mineInfo.projectName}" placeholder="请输入" class="form-control"/>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="mineName">矿井名称:</label> 
					<input id="mineName" name="mineName" value="${mineInfo.mineName}" placeholder="请输入" class="form-control"/>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<label >技术分类</label>
					<select class="form-control" id="techCategory" name="techCategory">
					</select>
				</div>
			</div>

			<div class="row">
				<div class="page-header">
					<h4><a href="javascript:show_div('gltxjg')">管理体系结构   <span class="glyphicon glyphicon-th-list"></span></a></h4>
				</div>
			</div>
			
			<div id="gltxjg" style="display:none;">
			
			<div class="row">
				<div class="form-group">
					<label for="singleUpload">组织机构:</label>
					<input type="file" id="singleUpload" name="singleFile" value="organ">
					<p class="help-block">请上传组织机构文件（pdf/word文件，若文件较大，请上传pdf格式文件）</p>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="manageResp">管理职责:</label> 
					<textarea rows="3" id="manageResp" name="manageResp" placeholder="请输入" class="form-control">${mineInfo.manageResp}</textarea>
					<input type="file" id="manageRespUpload" name="manageRespUpload">
					<p class="help-block">请上传管理职责文件（pdf/word文件，若文件较大，请上传pdf格式文件）</p>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="resourceSupport">资源配套:</label> 
					<textarea rows="3" id="resourceSupport" name="resourceSupport" placeholder="请输入" class="form-control">${mineInfo.resourceSupport}</textarea>
				</div>
			</div>
			
			</div>
			
			<div class="row">
				<div class="page-header">
					<h4><a href="javascript:show_div('gckzgl')">过程控制管理   <span class="glyphicon glyphicon-th-list"></span></a></h4>
				</div>
			</div>
			
			<div id="gckzgl" style="display:none">
			
			<div class="row">
				<div class="form-group">
					<label for="workLink">工作环节:</label> 
					<textarea rows="3" id="workLink" name="workLink" placeholder="请输入" class="form-control">${mineInfo.workLink}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="techFile">技术过程控制文件:</label> 
					<textarea rows="3" id="techFile" name="techFile" placeholder="请输入" class="form-control">${mineInfo.techFile}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="workProceUpload">作业控制程序:</label> 
					<input type="file" id="workProceUpload" name="workProceUpload"/>
					<p class="help-block">请上传作业控制程序文件（pdf/word文件，若文件较大，请上传pdf格式文件）</p>
				</div>
			</div>
			
			</div>
			
			<div class="row">
				<div class="page-header">
					<h4><a href="javascript:show_div('zyzdwj')">作业指导文件   <span class="glyphicon glyphicon-th-list"></span></a></h4>
				</div>
			</div>
			
			<div class="row" id="zyzdwj" style="display:none">
				<div class="form-group">
					<input type="file" name="workFileUpload"/>
					<p class="help-block">请上传作业指导文件（pdf/word文件，若文件较大，请上传pdf格式文件）</p>
				</div>
			</div>
			
			<div class="row">
				<div class="page-header">
					<h4><a href="javascript:show_div('czgc')">操作规程   <span class="glyphicon glyphicon-th-list"></span></a></h4>
				</div>
			</div>
			
			<div class="row" id="czgc" style="display:none">
				<div class="form-group">
					<input type="file" name="operProceUpload"/>
					<p class="help-block">请上传操作规程文件（pdf/word文件，若文件较大，请上传pdf格式文件）</p>
				</div>
			</div>
			
			<div class="row">
				<div class="page-header">
					<h4><a href="javascript:show_div('jsglxgpjbz')">技术管理效果评价标准    <span class="glyphicon glyphicon-th-list"></span></a></h4>
				</div>
			</div>
			
			<div id="jsglxgpjbz" style="display:none">
			
			<div class="row">
				<div class="form-group">
					<label for="techStandard">达到的最佳技术指标及标准:</label> 
					<textarea rows="3" id="techStandard" name="techStandard" placeholder="请输入" class="form-control">${mineInfo.techStandard}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="timeStandard">完成效果的最佳时间标准:</label> 
					<textarea rows="3" id="timeStandard" name="timeStandard" placeholder="请输入" class="form-control">${mineInfo.timeStandard}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="workAmount">工程量:</label> 
					<textarea rows="3" id="workAmount" name="workAmount" placeholder="请输入" class="form-control">${mineInfo.workAmount}</textarea>
				</div>
			</div>
			
			</div>
			
			<div class="pull-right">
				<button type="submit" name="submit" class="btn btn-success ">提交</button>
				<button  type="reset" class="btn btn-info ">重置</button>
			</div>
			
				
		</form>	
</div>
<hr/>			


</div>
</body>
<script src="${path}/fileinput/js/locales/zh.js" type="text/javascript"></script>
<script src="${path}/fileinput/js/myfileuplod.js"></script>
<script>
	initFileInput();
</script>