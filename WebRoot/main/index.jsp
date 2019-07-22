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
    <link rel="stylesheet" href="${path}/css/index.css">
    <script src="${path}/boot/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/js/index.js"></script>
</head>

<body>

<div class="container">
    <div class="logo" style="background-image: url(${path}/images/projectlogo.png)">
    </div>
    <div class="input">
        <input type="text" placeholder="请输入要搜索的内容" autocomplete="off" id="search-input">
        <div class="picker"></div>
        <div class="hot-list"></div>
        <ul class="picker-list">
            <li ></li>
            <li ></li>
            <li ></li>
            <li ></li>
        </ul>
    </div>
    <div class="search"></div>
</div>

<script type="text/javascript">
    $(function(){
        helangSearch.init();
    })
</script>
<div style="text-align:center;margin:100px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p><a href="http://sc.chinaz.com/" target="_blank">阳煤集团瓦斯防控技术管理系统</a></p>
</div>
</body>


</html>