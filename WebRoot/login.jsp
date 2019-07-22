<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8"
	isELIgnored="false"%>
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
<link rel="stylesheet" href="${path}/css/pintuer.css">
<link rel="stylesheet" href="${path}/css/admin.css">
<link rel="stylesheet"
	href="${path}/boot/css/bootstrapValidator.min.css">
<script src="${path}/boot/js/jquery-3.3.1.min.js"></script>
<script src="${path}/boot/js/bootstrap.min.js"></script>
<script src="${path}/boot/js/bootstrapValidator.min.js"></script>

<script type="text/javascript">
	$(function(){
		/* 表单验证 */
    	$("#loginForm").bootstrapValidator({
    		message: 'This value is not valid',
           	fields:{
           		username:{
                    validators: {
                        notEmpty: {
                            message: '请输入账号'
                        }
                    }
           		},
           		password:{
                    validators: {
                        notEmpty: {
                            message: '请输入密码'
                        }
                    }
           		},
           		enCode:{
                    validators: {
                        notEmpty: {
                            message: '请输入验证码'
                        }
                    }
           		},
           	}
    	});
    	
	})
</script>
</head>
<body>
	<div class="bg"></div>
	<div class="container">
		<div class="line bouncein">
			<div class="xs6 xm4 xs3-move xm4-move">
				<div style="height:150px;"></div>
				<div class="media media-y margin-big-bottom">
				</div>
				<form id="loginForm" action="<c:url value='/user/login'/>" method="post">
					<div class="panel loginbox">
						<div class="text-center margin-big padding-big-top">
							<h2>阳泉矿区瓦斯差异化防控项目管理系统</h2>
						</div>
						<div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="text" class="input input-big" name="username" placeholder="登录账号" data-validate="required:请填写账号" />
									<span class="icon icon-user margin-small"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
									<span class="icon icon-key margin-small"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="field">
									<input type="text" class="input input-big" name="enCode" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
									<img src="<c:url value='/validationCode/createImage'/>" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
								</div>
							</div>
						</div>
						<div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="登录"></div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>