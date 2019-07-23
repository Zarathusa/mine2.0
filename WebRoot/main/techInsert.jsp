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
  		<h3>&nbsp;&nbsp;技术特征
  			<button type="button" id="back" class="btn btn-primary pull-right">返回首页 <span class="glyphicon glyphicon-share-alt"></span></button>
  		</h3>
	</div>
</div>
</div>


<div class="container">
		<form action="<c:url value='/mineInfo/updateTech' />" method="post">
			
			<input  name="id" style="display:none;" value="${mineInfo.id}" class="form-control"/>
			
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
					<h4><a href="javascript:show_div('sytj')">适用条件   <span class="glyphicon glyphicon-th-list"></span></a></h4>
				</div>
			</div>
			
			<div id="sytj" style="display:none">
				
			<div class="row">
				<div class="form-group">
					<label for="projectEffect">项目作用:</label> 
					<textarea rows="1" id="projectEffect" name="projectEffect"  placeholder="请输入" class="form-control">${mineInfo.projectEffect}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="mineStatus">矿井状态:</label> 
					<textarea rows="1" id="mineStatus" name="mineStatus" placeholder="请输入" class="form-control">${mineInfo.mineStatus}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="gasGrade">矿井瓦斯等级:</label> 
					<textarea rows="1" id="gasGrade" name="gasGrade" placeholder="请输入" class="form-control">${mineInfo.gasGrade}</textarea>
				</div>
			</div>
			
			</div>
			
			<div class="row">
				<div class="page-header">
					<h4><a href="javascript:show_div('jsjc')">技术基础   <span class="glyphicon glyphicon-th-list"></span></a></h4>
				</div>
			</div>
			
			<div id="jsjc" style="display:none">
			
			<div class="row">
				<div class="form-group">
					<label for="geoCond">地质条件:</label> 
					<textarea rows="3" id="geoCond" name="geoCond" placeholder="请输入" class="form-control">${mineInfo.geoCond}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="coalSeamGive">煤层赋存:</label> 
					<textarea rows="3" id="coalSeamGive" name="coalSeamGive" placeholder="请输入" class="form-control">${mineInfo.coalSeamGive}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="exploit">开采顺序、方法、工艺:</label> 
					<textarea rows="3" id="exploit" name="exploit" placeholder="请输入" class="form-control">${mineInfo.exploit}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="gasGive">瓦斯赋存:</label> 
					<textarea rows="3" id="gasGive" name="gasGive" placeholder="请输入" class="form-control">${mineInfo.gasGive}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="staffComp">人员构成及素质:</label> 
					<textarea rows="3" id="staffComp" name="staffComp" placeholder="请输入" class="form-control">${mineInfo.staffComp}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="staffTech">人的技术基础:</label> 
					<textarea rows="3" id="staffTech" name="staffTech" placeholder="请输入" class="form-control">${mineInfo.staffTech}</textarea>
				</div>
			</div>
			
			</div>
			
			<div class="row">
				<div class="page-header">
					<h4><a href="javascript:show_div('gytz')">工艺特征  <span class="glyphicon glyphicon-th-list"></span></a></h4>
				</div>
			</div>
			
			<div id="gytz" style="display:none">
			
			<div class="row">
				<div class="form-group">
					<label for="techCond">工艺适应条件:</label> 
					<textarea rows="3" id="techCond" name="techCond" placeholder="请输入" class="form-control">${mineInfo.techCond}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="implPeriod">实施工期:</label> 
					<textarea rows="3" id="implPeriod" name="implPeriod" placeholder="请输入" class="form-control">${mineInfo.implPeriod}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="implArea">是否需分别在煤、岩层中施工:</label> 
					<textarea rows="3" id="implArea" name="implArea" placeholder="请输入" class="form-control">${mineInfo.implArea}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="techGrade">技术复杂程度:</label> 
					<textarea rows="3" id="techGrade" name="techGrade" placeholder="请输入" class="form-control">${mineInfo.techGrade}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="mineImpact">对矿井生产系统布局和采掘施工的影响:</label> 
					<textarea rows="3" id="mineImpact" name="mineImpact" placeholder="请输入" class="form-control">${mineInfo.mineImpact}</textarea>
				</div>
			</div>
			
			</div>
			
			<div class="row">
				<div class="page-header">
					<h4><a href="javascript:show_div('jsmsff')">技术描述方法及技术特征指标  <span class="glyphicon glyphicon-th-list"></span></a></h4>
				</div>
			</div>
			
			<div id="jsmsff" style="display:none;">
			
			<div class="row">
				<div class="form-group">
					<label for="techDesc">技术描述:</label> 
					<textarea rows="3" id="techDesc" name="techDesc" placeholder="请输入" class="form-control">${mineInfo.techDesc}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="techFeature">技术特征:</label> 
					<textarea rows="3" id="techFeature" name="techFeature" placeholder="请输入" class="form-control">${mineInfo.techFeature}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<label for="quanEffect">达到的量化效果:</label> 
					<textarea rows="3" id="quanEffect" name="quanEffect" placeholder="请输入" class="form-control">${mineInfo.quanEffect}</textarea>
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