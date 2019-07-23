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
    <div style="margin-left: 80px;margin-bottom: 80px;">
        <div>
            <img class="logo" src="${path}/images/logo.png" >
            <span style="text-align:center; font:normal 14px/24px 'MicroSoft YaHei';position: absolute;">
                <a href="${path}/mineInfo/showAll" target="_blank" style="text-decoration: none;">
                    <img src="${path}/images/font.png" alt="" style="width: 400px;">
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
        <ul id="cate" class="picker-list">
            <li value="1">基础理论研究</li>
            <li value="2">探测、预测及预警技术</li>
            <li value="3">增透及抽采技术</li>
            <li value="4">管理体系</li>
            <li value="5">钻进技术及装备</li>
            <li value="6">瓦斯利用技术</li>
            <li value="7">其他</li>
        </ul>
    </div>
    <div id="query" class="search"></div>
</div>

<script type="text/javascript">
    $(function(){
        helangSearch.init();

        var cate="";
        $("#cate > li").click(function () {
            var content=$(this).text();
            cate=$(this).val();
            $("#search-input").prop("placeholder","技术分类选定为："+content+"");
        })

        $("#query").click(function () {
            var context=$("#search-input").val();
            window.location.href="${path}/mineInfo/indexQuery?category="+cate+"&context="+context+"";
            console.log("test")
        })
    })
</script>
</body>


</html>