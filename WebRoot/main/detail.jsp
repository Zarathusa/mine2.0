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
		
		$("#organ").media({
			width: '100%',
			height: '600px',
			autoplay: true,
        	src:"${path}${mineInfo.organ}.pdf",
		});
		
		$("#workProce").media({
			width: '100%',
			height: '600px',
			autoplay: true,
        	src:"${path}${mineInfo.workProce}.pdf",
		});
		
		$("#workFile").media({
			width: '100%',
			height: '600px',
			autoplay: true,
        	src:"${path}${mineInfo.workFile}.pdf",
		});
		
		$("#operProce").media({
			width: '100%',
			height: '600px',
			autoplay: true,
        	src:"${path}${mineInfo.operProce}.pdf",
		});
		
		$("#manageRespFile").media({
			width: '100%',
			height: '600px',
			autoplay: true,
        	src:"${path}${mineInfo.manageRespFile}.pdf",
		});
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
  		<h3>&nbsp;&nbsp;项目详情
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
	   				<h3 class="panel-title">项目名称</h3>
	  			</div>
	  			<div class="panel-body"><p class="">${mineInfo.projectName}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">试验矿井名称</h3>
	  			</div>
	  			<div class="panel-body"><p class="">${mineInfo.mineName}</p></div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">技术分类</h3>
				</div>
				<div class="panel-body"><p class="">${techCategory}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="page-header">
			<h4>技术特征 <span class="glyphicon glyphicon-arrow-right"></span> <small>适用条件</small></h4>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">项目作用</h3>
	  			</div>
	  			<div class="panel-body"><p class="">${mineInfo.projectEffect}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">矿井状态</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.mineStatus}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">矿井瓦斯等级</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.gasGrade}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="page-header">
			<h4>技术特征 <span class="glyphicon glyphicon-arrow-right"></span> <small>技术基础</small></h4>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">地质条件</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.geoCond}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">煤层赋存</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.coalSeamGive}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">开采顺序、方法、工艺</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.exploit}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">瓦斯赋存</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.gasGive}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">人员构成及素质</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.staffComp}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">人的技术基础</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.staffTech}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="page-header">
			<h4>技术特征 <span class="glyphicon glyphicon-arrow-right"></span> <small>工艺特征</small></h4>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">工艺适应条件</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.techCond}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">实施工期</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.implPeriod}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">是否需分别在煤、岩层中施工</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.implArea}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">技术复杂程度</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.techGrade}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">对矿井生产系统布局和采掘施工的影响</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.mineImpact}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="page-header">
			<h4>技术特征 <span class="glyphicon glyphicon-arrow-right"></span> <small>技术描述方法及技术特征指标</small></h4>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">技术描述</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.techDesc}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">技术特征</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.techFeature}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">达到的量化效果</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.quanEffect}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="page-header">
			<h4>管理体系 <span class="glyphicon glyphicon-arrow-right"></span> <small>管理体系结构</small></h4>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">组织机构</h3>
	  			</div>
	  			<div class="panel-body">
	  				<c:if test="${mineInfo.organ!=null}">
	  					<div id="organ"  style="height:450px"></div>
	  				</c:if>
	  				<c:if test="${mineInfo.organ==null}">
	  					请上传pdf/word文件
	  				</c:if>
	  			</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">管理职责</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.manageResp}</p>
	  				<c:if test="${mineInfo.manageRespFile!=null}">
	  					<div id="manageRespFile"  style="height:450px"></div>
	  				</c:if>
	  				<c:if test="${mineInfo.manageRespFile==null}">
	  					请上传pdf/word文件
	  				</c:if>
	  			</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">资源配套</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.resourceSupport}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="page-header">
			<h4>管理体系 <span class="glyphicon glyphicon-arrow-right"></span> <small>过程控制管理</small></h4>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">工作环节</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.workLink}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">技术过程控制文件</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.techFile}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">作业控制程序</h3>
	  			</div>
	  			<div class="panel-body">
	  				<c:if test="${mineInfo.workProce!=null}">
	  					<div id="workProce"></div>
	  				</c:if>
	  				<c:if test="${mineInfo.workProce==null}">
	  					请上传pdf/word文件
	  				</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">作业指导文件</h3>
	  			</div>
	  			<div class="panel-body">
	  				<c:if test="${mineInfo.workFile!=null}">
	  					<div id="workFile"></div>
	  				</c:if>
	  				<c:if test="${mineInfo.workFile==null}">
	  					请上传pdf/word文件
	  				</c:if>
	  			</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">操作规程</h3>
	  			</div>
	  			<div class="panel-body">
	  				<c:if test="${mineInfo.operProce!=null}">
	  					<div id="operProce"></div>
	  				</c:if>
	  				<c:if test="${mineInfo.operProce==null}">
	  					请上传pdf/word文件
	  				</c:if>
	  			</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="page-header">
			<h4>管理体系 <span class="glyphicon glyphicon-arrow-right"></span> <small>技术管理效果评价标准</small></h4>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">达到的最佳技术指标及标准</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.techStandard}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">完成效果的最佳时间标准</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.timeStandard}</p></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	   				<h3 class="panel-title">工程量</h3>
	  			</div>
	  			<div class="panel-body"><p>${mineInfo.workAmount}</p></div>
			</div>
		</div>
	</div>
	
	
	
	
	<div class="pull-right">
		<button  type="button" onclick="backTop()" class="btn btn-primary">返回顶部 <span class="glyphicon glyphicon-arrow-up"></span></button>
	</div>
	
</div>
</body>