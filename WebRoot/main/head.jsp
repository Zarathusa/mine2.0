<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>阳泉矿区瓦斯差异化防控项目管理系统</title>
    <link rel="stylesheet" href="${path}/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/boot/css/back.css">
    <link rel="stylesheet" href="${path}/boot/css/bootstrapValidator.min.css">
    <script src="${path}/boot/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/boot/js/bootstrap.min.js"></script>
    <script src="${path}/boot/js/bootstrapValidator.min.js"></script>
    <script src="${path}/boot/js/jquery.media.js"></script>
    <style type="text/css">
    	.navbar-brand {
		    font-size: 25px;
		    line-height: 20px;
		}
		body {
		    font-size: 16px;
		}
    </style>
    
    <script type="text/javascript">
    	$(function(){
    		$("#addUser").click(function(){
    			$("#addUserModal").modal('show');	
    			
    		});
    		
    	/* 表单验证 */
    	$("#addUserForm").bootstrapValidator({
    		message: 'This value is not valid',
            feedbackIcons: {
             	valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
           	},
           	fields:{
           		username:{
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
           		},
           		password:{
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
           		}
           	}
    	});
    	
    	
   });
    	
    	
    	
    </script>
    
</head>
<nav class="navbar navbar-default>
    <div class="container-fluid">
        <!--导航标题-->
        <div class="navbar-header ">
            <a href="javascript:location.reload(true);" class="navbar-brand"><strong>阳泉矿区瓦斯差异化防控项目管理系统 </strong></a>
        </div>
        <!--导航内容-->
        <ul class="nav navbar-nav navbar-right">
            <li><a >欢迎: <span class="text-primary">${sessionScope.user.username} </span></a></li>
          
            <li class="dropdown">
					<a 
						data-toggle="dropdown" > 用户管理 <span class="glyphicon glyphicon-user"></span> <span class="caret"></span>
					</a>

					<ul class="dropdown-menu">
						<c:if test="${sessionScope.user.status==1}">
							<li><a id="addUser">新增用户  <span class="glyphicon glyphicon-plus"></span> </a></li>
						</c:if>
						<li><a href="<c:url value='/user/exit' />">退出登录  <span class="glyphicon glyphicon-log-out"></span> </a></li>
					</ul>
			</li> 
            
        </ul>
        <form action="<c:url value='/mineInfo/showAll'/>" method="post" class="navbar-form navbar-right" >
			  <div class="form-group">
			    <input type="text" name="context" class="form-control" placeholder="请输入项目名" value="${context}">
			  </div>
			  <input type="submit" class="btn btn-default" value="搜索">
		</form>
    </div>
</nav>
<!-- 导航结束 -->

<!-- 新增用户模态框 -->
<div class="modal fade" id="addUserModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<!--模态框标题-->
			<form id="addUserForm" action="<c:url value='/user/addUser'/>" method="post" class="form-horizontal" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times; </span>
				</button>
				<h4 class="modal-title">新增用户</h4>
			</div>
			<!--模态框内容体-->
			<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" name="username"  placeholder="请输入用户名"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" name="password" placeholder="请输入密码"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">用户级别</label>
						<div class="col-sm-10">
							<select name="status"  class="form-control">
								<option value="0" selected="selected">普通用户（只可查看）</option>
								<option value="1">管理员</option>
							</select>
						</div>
					</div>
					
				</div>
			<!--模态页脚-->
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">保存</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消
				</button>
			</div>
			</form>
		</div>
	</div>
</div>
