<#assign headCount=0>
<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ include file="/include/common/top.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>信息管理 - <%@include file="/include/common/title.jsp"%></title>
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
							<h3 class="s-resize">信息管理</h3>
							<div class="ctrl">
							    <!-- 
                                <gzdec:rightsButton rightCode="${metadata.tables[0].tableName}_ADD" value="新增" cssClass="button" elementId="createBt"></gzdec:rightsButton>
                                <gzdec:rightsButton rightCode="${metadata.tables[0].tableName}_DEL_SELECTED" value="删除所选" cssClass="button" elementId="deleteSelected"></gzdec:rightsButton>
                                -->
								<input type="button" value="新增" class="button" id="createBt" />
								<input type="button" value="删除所选" class="button" id="deleteSelected" />
							</div>
							</header>
							<article class="content-box-content">
							<form method="post" name="mainForm" id="mainForm" action="">
								<input type="hidden" name="formMap.partMenuId" id="partMenuId" value="<s:property value="formMap.partMenuId" />" />
								<input type="hidden" name="formMap.subPartMenuId" id="subPartMenuId" value="<s:property value="formMap.subPartMenuId" />" />
								
								<!-- 查询 -->
								<div class="searchArea">
									<#list metadata.tables[0].columns as column>
									<#if (column.isQuery())>
									<label>${column.remarks}:</label><#if column.standardType = "DATE"><input type="text" class="text-input sec-input" readonly="readonly" onclick="WdatePicker({dateFmt:'${column.format}'})" name="formMap.${column.columnName}" value="<s:date format="${column.format}" name="resultMap.${column.columnName}"/>" /><#else><input type="text" class="text-input sec-input" name="formMap.${column.columnName}" value="<s:property value="resultMap.${column.columnName}"/>" /></#if>&nbsp;&nbsp;
									</#if>
									</#list>								
									 <input type="submit" value="搜索" class="button" />
                                   <!-- 
									<a href="javascript:;" onClick="$('#highSec').toggle()">高级搜索&raquo;</a>
									<div class="font-size12" id="highSec" style="display: none;">
										<p></p>
										<label>
											标签名:
										</label>
										<input name="_inputName" id="_inputId" class="text-input sec-input" />
									</div>
								   -->
								</div>
								<br />
 
 
								<!--//查询-->
								<!--表格模版-->
								<table class="tableStyle01">
									<thead>
										<tr>
											<th><input type="checkbox" id="allCheckBox" name="checkbox" class="check-all" /></th>
											<#list metadata.tables[0].columns as column>
											<#if (column.isHead())>
											<#assign headCount = headCount + 1>
											<th>${column.remarks}</th>
											</#if>
											</#list>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="resultList">
										<tr>
										<td><input type="checkbox" class="chekcbox-cls" name="formMap.delete${MROUtil.upperFirstChar(MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey))}"  value="<s:property value="${metadata.tables[0].primaryKey}"/>" /></td>
										<#list metadata.tables[0].columns as column>
										<#if (column.isHead())>
										<td><s:property value="${column.columnName}"/></td>
										</#if>
										</#list>
										<td align="left">
                                        <%-- 
                                        <gzdec:rightsHref href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do?formMap.${metadata.tables[0].primaryKey}=<s:property value="${metadata.tables[0].primaryKey}"/>" rightCode="${metadata.tables[0].tableName}_VIEW" text="查看明细" cssClass="go" />
                                        <gzdec:rightsHref href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do?formMap.${metadata.tables[0].primaryKey}=<s:property value="${metadata.tables[0].primaryKey}"/>&formMap.partMenuId=<s:property value="formMap.partMenuId" />&formMap.subPartMenuId=<s:property value="formMap.subPartMenuId" />" rightCode="${metadata.tables[0].tableName}_EDIT" text="修改" cssClass="edit" />
                                        <gzdec:rightsHref href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/remove.do?formMap.delete${MROUtil.upperFirstChar(MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey))}=<s:property value="${metadata.tables[0].primaryKey}"/>&formMap.partMenuId=<s:property value="formMap.partMenuId" />&formMap.subPartMenuId=<s:property value="formMap.subPartMenuId" />" rightCode="${metadata.tables[0].tableName}_DEL" text="删除" cssClass="delete" />
                                        --%>										
										<a href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do?formMap.${metadata.tables[0].primaryKey}=<s:property value="${metadata.tables[0].primaryKey}"/>&formMap.partMenuId=<s:property value="formMap.partMenuId" />&formMap.subPartMenuId=<s:property value="formMap.subPartMenuId" />" class="edit">修改</a>
										<a href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/remove.do?formMap.delete${MROUtil.upperFirstChar(MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey))}=<s:property value="${metadata.tables[0].primaryKey}"/>&formMap.partMenuId=<s:property value="formMap.partMenuId" />&formMap.subPartMenuId=<s:property value="formMap.subPartMenuId" />" class="delete">删除</a>
										</td>
										</tr>
										</s:iterator>										
									</tbody>
									<tfoot>
										<tr>
											<td colspan="${headCount + 2}" align="center">
											<jsp:include page="/include/common/page_control.jsp" />
											</td>
										</tr>
									</tfoot>
								</table>
								<!--表格模版//-->
							</form>
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
<script type="text/javascript" src="/js/common/escoder/escoder-manager-1.0.js" charset="gbk"></script>
<script type="text/javascript" src="/js/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(metadata.tables[0].tableName)}_index.js" charset="utf-8"></script>
</body>
</html>