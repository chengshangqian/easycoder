<#assign headCount=0>
<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ include file="/include/common/top.jsp"%>
<%
	String editorUploadAction = ${metadata.packageName}.util.AppUtil.getUploadAction(request,((java.util.HashMap)request.getAttribute("resultMap")));    
%>
<s:set name="to" value="resultMap.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}To"/>
<#list metadata.tables[0].columns as column>
<s:set name="${column.columnName}" value="#to.${column.columnName}"/>
</#list>
<s:set name="isModifing" value="#${metadata.tables[0].primaryKey} != null && #${metadata.tables[0].primaryKey} != ''"/>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>信息管理 &gt; <s:if test="#isModifing">修改</s:if><s:else>新增</s:else> - <%@include file="/include/common/title.jsp"%></title>
<%@include file="/include/common/includecss.jsp"%>
</head>
<body>
<div class="wrap">
			<%@ include file="/include/common/header.jsp"%>
 
			<!-- body -->
			<div class="body-wrapper clearfix">
				<!-- 主栏 -->
				<div class="main-wrapper">
 
					<div id="main-content">
					    <%@ include file="/include/common/netplace.jsp"%>
						<!-- 展开收缩 -->
						<a href="javascript:;" class="shrink_area" onclick="toggle(this);"
							hidefocus><i></i> </a>
						<!--//展开收缩-->
						
						<div class="main_content">
							<!-- 模块三 -->
							<section class="content-box">
								<header class="content-box-header clearfix">
									<h3 class="s-resize">信息管理 &gt; <s:if test="#isModifing">修改</s:if><s:else>新增</s:else></h3>
								</header>
								<article class="content-box-content">
								<form id="inputForm" name="inputForm" method="post" action="<s:if test="#isModifing">/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/modify.do</s:if><s:else>/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/create.do</s:else>">
									<input type="hidden" name="formMap.partMenuId" id="partMenuId" value="<s:property value="formMap.partMenuId" />" />
									<input type="hidden" name="formMap.subPartMenuId" id="subPartMenuId" value="<s:property value="formMap.subPartMenuId" />" />
									<input type="hidden" name="formMap.${metadata.tables[0].primaryKey}" id="formMap.${metadata.tables[0].primaryKey}" value="<s:property value="#${metadata.tables[0].primaryKey}"/>" />
									<table class="general_tb0" width="100%">
										<tbody>
										  <#list metadata.tables[0].columns as column>
										  <#if (column.isIuput())>
										  <#switch StringUtils.trimToEmpty(column.inputType)> 
										  <#case "textarea"> 
										  <#case "htmlEditor"> 
									        <tr>
									        	<td>${column.remarks}</td>
									        	<td>
									        	<#if (column.isRequired())>
									        	<textarea id="${column.columnName}" cols="30" rows="10" class="required full_input" name="formMap.${column.columnName}"><s:property value="#${column.columnName}"/></textarea>
									        	<#else>
									        	<textarea id="${column.columnName}" cols="30" rows="10" class="full_input" name="formMap.${column.columnName}"><s:property value="#${column.columnName}"/></textarea>
									        	</#if>
									        	</td>
									    	</tr>
										  <#break>
										  <#case "hidden">
										  <input type="hidden" id="${column.columnName}" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
										  <#break>
										  <#default> 
									        <tr>
									        	<td> ${column.remarks}</td>
									        	<td>
									        	<#if (column.isRequired())>
										        	<#if column.standardType = "DATE">
										        	<input type="text" id="${column.columnName}" class="required small_input" readonly="readonly" onclick="WdatePicker({dateFmt:'${column.format}'})" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
										        	<#else>
										        	<input type="text" id="${column.columnName}" class="required small_input" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
										        	</#if>
									        	<#else>
										        	<#if column.standardType = "DATE">
										        	<input type="text" id="${column.columnName}" class="small_input" readonly="readonly" onclick="WdatePicker({dateFmt:'${column.format}'})" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
										        	<#else>
										        	<input type="text" id="${column.columnName}" class="small_input" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
										        	</#if>        	
									        	</#if>
									        	</td>
									    	</tr>
										  </#switch>
										  </#if>
										  </#list>											
										
										</tbody>
									</table>
									<p>
										<input type="submit" value="保存" class="button3" />&nbsp;&nbsp;	
										<input type="button" value="返回" class="button" id="backBt"/>										
									</p>
									
									</form>
 									<input id="editorUploadAction" type="hidden" value="<%=editorUploadAction %>" />
								</article>
								
							</section>
							
							<!--//模块三-->

						<%@ include file="/include/common/foot.jsp"%>
						</div>
					</div>
				</div>
				<!--//主栏-->
				<!-- 侧栏 -->
				
<!-- 侧栏 -->
<%@ include file="/include/common/left.jsp"%>
<!--//侧栏-->
</div>
<!--//body-->
</div>

<%@include file="/include/common/includejs.jsp"%>
<script type="text/javascript" src="/js/common/escoder/escoder-merger-1.0.js" charset="gbk"></script>
<script type="text/javascript" src="/js/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(metadata.tables[0].tableName)}_input.js" charset="utf-8"></script>
</body>
</html>