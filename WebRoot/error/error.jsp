<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>出现错误啦！</title>

    <style type="text/css">

        .head404{ width:580px; height:234px; margin:50px auto 0 auto; background:url(${path}/images/head404.png) no-repeat; }

        .txtbg404{ width:499px; height:169px; margin:10px auto 0 auto; background:url(${path}/images/txtbg404.png) no-repeat;}

        .txtbg404 .txtbox{ width:390px; position:relative; top:30px; left:60px;color:#eee; font-size:13px;}

        .txtbg404 .txtbox p {margin:5px 0; line-height:18px;}

        .txtbg404 .txtbox .paddingbox { padding-top:15px;}

        .txtbg404 .txtbox p a { color:#eee; text-decoration:none;}

        .txtbg404 .txtbox p a:hover { color:#FC9D1D; text-decoration:underline;}

    </style>

</head>


<body bgcolor="#494949">

<div class="txtbg404">

    <div class="txtbox">

        <p>出现错误啦！！!赶快联系开发人员</p>

        <p>${message}</p>

        <p class="paddingbox">请点击以下链接继续浏览网页</p>

        <p>》<a style="cursor:pointer" onclick="history.back()">返回上一页面</a></p>

        <p>》<a href="${path}/main/index.jsp">返回网站首页</a></p>

    </div>

</div>

</body>

</html>