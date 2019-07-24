<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<jsp:include page="./head.jsp"/>
<head>
	<style type="text/css">
		p{   text-indent:2em;   /*每个P段落，首行空出两个空格，即缩进两个字符*/}
	</style>
</head>
<body>
<script type="text/javascript">
	$(function(){
		$("#back").click(function(){
			/*window.location.href="${path}/mineInfo/showAll";*/
			window.history.back(-1);
		});

		<c:if test="${file!=null}">
		$("#projectReport").media({
			width: '100%',
			height: '1000px',
			autoplay: true,
        	src:"http://localhost/xoffice/xoffice?_xformat=${file.fileType}&_file=http://localhost${path}${file.url}",
		});
		</c:if>
	});
	
	function backTop () {
		  window.scrollBy(0, -100);
		
		  scrolldelay = setTimeout('backTop()', 10);
		
		  var sTop = document.documentElement.scrollTop + document.body.scrollTop;
		
		  if (sTop === 0) {
		    clearTimeout(scrolldelay);
		  }
	}
	
	
</script>
<div class="container-fluid">
<div class="row">
<div class="col-sm-12">
	<div class="page-header">
  		<h3>&nbsp;&nbsp;项目报告
  			<button type="button" id="back" class="btn btn-primary pull-right">返回首页 <span class="glyphicon glyphicon-share-alt"></span></button>
  		</h3>
	</div>
</div>
</div>
</div>

<div class="container">
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">${mineInfo.projectName}研究报告</h3>
	  			</div>
	  			<div class="panel-body">
					<c:if test="${file!=null}">
	  					<div id="projectReport" ></div>
	  				</c:if>
	  				<c:if test="${file==null}">
	  					请上传pdf/word文件
	  				</c:if>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div class="pull-right">
		<button  type="button" onclick="backTop()" class="btn btn-primary">返回顶部 <span class="glyphicon glyphicon-arrow-up"></span></button>
	</div>
	
</div>
</body>