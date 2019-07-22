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

<div class="container">
    <div style="margin-left: 140px;margin-bottom: 66px;">
        <div>
            <img class="logo" src="${path}/images/logo.png" >
            <span style="text-align:center; font:normal 14px/24px 'MicroSoft YaHei';position: absolute;">
                <a href="" target="_blank" style="text-decoration: none;">
                    <img src="${path}/images/font.png" alt="" style="width: 280px;">
                </a>
            </span>
        </div>

    </div>
    <div class="input">
        <span class="map">
            <img src="${path}/images/map.png" alt="" style="width: 30px;vertical-align: middle;">
        </span>
        <span class="picker">
            <img src="${path}/images/down.png" alt="">
        </span>
        <input type="text" placeholder="请输入要搜索的内容" autocomplete="off" id="search-input">
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
</body>


</html>