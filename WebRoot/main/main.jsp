<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<jsp:include page="./head.jsp"/>
<body>
<div class="container-fluid">
	<script type="text/javascript">
	$(function(){
		/* 增加项目的模态框 */
    	$("#addProject").click(function(){
    		$("#addModal").modal('show');
    	});
    	
    	
    	/* 表单验证 */
    	$("#addProjectForm").bootstrapValidator({
    		message: 'This value is not valid',
            feedbackIcons: {
             	valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
           	},
           	fields:{
           		projectName:{
                    validators: {
                        notEmpty: {
                            message: '项目名不能为空'
                        }
                    }
           		},
           		mineName:{
                    validators: {
                        notEmpty: {
                            message: '矿井名称不能为空'
                        }
                    }
           		}
           	}
    	});

    	/* 技术分类下拉列表 */
		$.ajax({
			url:'${path}/category/list',
			success:function (data) {
				data=data.list;
				for(var i=0;i<data.length;i++){
					$("#techCategory ").append($("<option value="+data[i].id+">"+data[i].name+"</option>"));
				}
			}
		})

		/*返回搜索主页*/
		$("#backIndex").click(function(){
			window.location.href="${path}/main/index.jsp";
		})
	});
	
	/* 刪除项目 */
	function deleteProject(id){
		$("#deleteModal").modal('show');
		$("#deleteThis").click(function(){
			window.location.href="${path}/mineInfo/deleteProject?id="+id+"";
		});
	}
	
	/* 上传项目报告 */
	function uploadReport(id){
		$("#uploadReportModal").modal("show");
		$("#projectId").prop("value",id);
	}
	
</script>
<div class="row">
<div class="col-sm-12">
	<div class="page-header">
  		<h3>&nbsp;&nbsp;项目展示
			<div class="pull-right">
  			<c:if test="${sessionScope.user.status==1}">
  				<button type="button" id="addProject" class="btn btn-primary">增加项目 <span class="glyphicon glyphicon-plus"></span></button>
  			</c:if>
			&nbsp;&nbsp;
			<button type="button" id="backIndex" class="btn btn-success pull-right">返回搜索 <span class="glyphicon glyphicon-share-alt"></span></button>
			</div>
  		</h3>
	</div>
</div>
</div>


<!-- 项目展示 -->
<c:forEach items="${pageInfo.list}" var="mineInfo">
	<div class="row">
	<div class="col-sm-3">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown">
					项目名称<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
					<li>
						<c:if test="${sessionScope.user.status==1}">
							<a onclick="uploadReport('${mineInfo.id}')">上传项目报告</a>	
						</c:if>
					</li>
					<li><a href="<c:url value='/mineInfo/queryOne'/>?op=report&id=${mineInfo.id}">查看项目报告</a></li>
					<li class="divider"></li>
					<li>
						<c:if test="${sessionScope.user.status==1}">
							<a onclick="deleteProject('${mineInfo.id}')">删除此项目</a>
						</c:if>
						
					</li>
					</ul>
				</div>
			</div>
			<div class="panel-body">
				<a href="<c:url value='/mineInfo/queryOne'/>?op=detail&id=${mineInfo.id}">${mineInfo.projectName}</a>
			</div>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="panel panel-info">
			<div class="panel-heading">矿井名称</div>
			<div class="panel-body">${mineInfo.mineName}</div>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="panel panel-info">
			<div class="panel-heading">技术特征</div>
			<div class="panel-body">
				<c:if test="${sessionScope.user.status==1}">
					<a href="<c:url value='/mineInfo/queryOne' />?op=tech&id=${mineInfo.id}">点击开始录入/修改</a>
				</c:if>
				<c:if test="${sessionScope.user.status!=1}">
					普通用户不可录入/修改
				</c:if>
			</div>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="panel panel-info">
			<div class="panel-heading">管理体系</div>
			<div class="panel-body">
				<c:if test="${sessionScope.user.status==1}">
					<a href="<c:url value='/mineInfo/queryOne' />?op=manager&id=${mineInfo.id}" >点击开始录入/修改</a>
				</c:if>
				<c:if test="${sessionScope.user.status!=1}">
					普通用户不可录入/修改
				</c:if>
			</div>
		</div>
	</div>
</div>
<hr/>
</c:forEach>

<!-- 分页 -->
<c:if test="${pageInfo.list.size()!=0}">
<div class="row">
<div class="pull-right">
	<ul class="pagination ">
	<!-- 上一页 -->
	<li
	<c:if test="${!pageInfo.hasPreviousPage}">
		class="disabled"
	</c:if>
     >
      <a href='<c:url value="/mineInfo/indexQuery"/>?pageNum=${pageInfo.pageNum-1}&category=${category}&context=${context}' >
        <span >&laquo;</span>
      </a>
    </li>
    <!-- 显示所有页号，若是当前页就高亮显示，并且没有链接 -->
	<c:forEach var="page_num" items="${pageInfo.navigatepageNums}">
		<li
		<c:if test="${page_num == pageInfo.pageNum}">
			class="active"
		</c:if>
		><a href="<c:url value='/mineInfo/indexQuery'/>?pageNum=${page_num}&category=${category}&context=${context}">${page_num}</a></li>
	</c:forEach>
    <!-- 下一页 -->
    <li
	<c:if test="${!pageInfo.hasNextPage}">
		class="disabled"
	</c:if>
    >
      <a href='<c:url value="/mineInfo/indexQuery"/>?pageNum=${pageInfo.pageNum+1}&category=${category}&context=${context}'>
        <span >&raquo;</span>
      </a>
    </li>
  </ul>
</div>
</div>
</c:if>


<!-- 增加项目模态框 -->
<div class="modal fade" id="addModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<!--模态框标题-->
			<form id="addProjectForm" action="<c:url value='/mineInfo/addProject'/>" method="post" class="form-horizontal" >
			<div class="modal-header">
				<!--
用来关闭模态框的属性:data-dismiss="modal"
-->
				<button type="button" class="close" data-dismiss="modal">
					<span>&times; </span>
				</button>
				<h4 class="modal-title">项目信息</h4>
			</div>
			<!--模态框内容体-->
			<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-2 control-label">项目名称</label>
						<div class="col-sm-10">
							<input type="text" name="projectName" id="projectName" placeholder="请输入项目名"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">矿井名称</label>
						<div class="col-sm-10">
							<input type="text" name="mineName" id="mineName" placeholder="请输入矿井名"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">技术分类</label>
						<div class="col-sm-10">
							<select class="form-control" id="techCategory" name="techCategory">
							</select>
						</div>
					</div>

				
			</div>
			<!--模态页脚-->
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">保存</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
			</form>
		</div>
	</div>
</div>
</div>

<!-- 删除框 -->
	<div class="modal fade" id="deleteModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<!--模态框标题-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times; </span>
					</button>
					<h4 class="modal-title">是否删除此项目？</h4>
				</div>
				<!--模态页脚-->
				<div class="modal-footer">
					<button type="button" id="deleteThis" class="btn btn-danger">确定</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消
					</button>
				</div>
			</div>
		</div>
	</div>


<!-- 上传项目报告框 -->
	<div class="modal fade" id="uploadReportModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<!--模态框标题-->
				<form action="<c:url value='/file/uploadReport'/>" method="post" enctype="multipart/form-data" class="form-horizontal" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times; </span>
					</button>
					<h4 class="modal-title">上传项目报告</h4>
				</div>
				<!--模态框内容体-->
			<div class="modal-body">
					<input id="projectId" name="id" style="display:none" value=""/>
					<div class="form-group">
						<label class="col-sm-2 control-label">项目报告</label>
						<div class="col-sm-10">
							<input type="file" name="reportUpload">
							<p class="help-block">请上传项目报告文件（若文件较大，请上传pdf格式文件）</p>
						</div>
					</div>
			</div>
				<!--模态页脚-->
				<div class="modal-footer">
					<button type="submit" name="submit" class="btn btn-primary">保存</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
				</div>
				</form>
			</div>
		</div>
	</div>


</body>