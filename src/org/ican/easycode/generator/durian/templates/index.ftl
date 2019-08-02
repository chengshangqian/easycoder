<#assign headCount=0>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    java.util.HashMap resultMap = (java.util.HashMap)request.getAttribute("resultMap");
    String cssPath = ${metadata.packageName}.util.AppUtil.getCssImageServerPath(request,resultMap);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META http-equiv="Content-Type" content="text/html; charset=GBK">
<title>管理首页</title>
<link rel="stylesheet" type="text/css" href="<%=cssPath%>/skin/skin2/cms_common.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssPath%>/skin/skin2/cms_sytle.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="/plugin/jquery-validate/css/screen.css" />
</head>
<body class="main_bg">

<div class="weizhi"><span class="weizhi_icon">&nbsp;</span>您目前所在位置：平台管理  &gt; 信息管理 </div>

<form id="queryForm" name="queryForm" action="" method="post">
<div class="search_k">
<fieldset class="search">
<div class="search_content">
<#list metadata.tables[0].columns as column>
<#if (column.isQuery())>
${column.remarks}:<#if column.standardType = "DATE"><input type="text" readonly="readonly" onclick="WdatePicker({dateFmt:'${column.format}'})" name="formMap.${MROUtil.tableNameToBeanName(column.columnName)}" value="<s:date format="${column.format}" name="resultMap.${MROUtil.tableNameToBeanName(column.columnName)}"/>" /><#else><input type="text" name="formMap.${MROUtil.tableNameToBeanName(column.columnName)}" value="<s:property value="resultMap.${MROUtil.tableNameToBeanName(column.columnName)}"/>" /></#if>&nbsp;&nbsp;
</#if>
</#list>
<input type="submit" value="开始查询" class="input_btn_style1"/>&nbsp;&nbsp;
<input type="reset" value="重置" class="input_btn_style1"/>
</div>
</fieldset>
</div>
<div class="select">
<span style="float:right;"><input id="createBt" type="button" value="新增"  class="input_btn_style2" />&nbsp;&nbsp;<input id="deleteSelected" type="button" value="删除所选"  class="input_btn_style1" /></span>
</div>
<div class="table_bg">
<table align="center">
<tr>
<th>选择 <input type="checkbox" name="allCheckBox" id="allCheckBox" /></th>
<#list metadata.tables[0].columns as column>
<#if (column.isHead())>
<#assign headCount = headCount + 1>
<th>${column.remarks}</th>
</#if>
</#list>
<th nowrap>操作</th>
</tr>

<s:iterator value="resultList">
<tr>
<td align="center"><input type="checkbox" class="chekcbox-cls" name="formMap.delete${MROUtil.upperFirstChar(MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey))}"  value="<s:property value="${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}"/>" /></td>
<#list metadata.tables[0].columns as column>
<#if (column.isHead())>
<#switch column.standardType> 
  <#case "DATE"> 
     <td align="center"><s:date format="${column.format}" name="${MROUtil.tableNameToBeanName(column.columnName)}"/></td>
     <#break>
  <#default> 
     <td align="center"><s:property value="${MROUtil.tableNameToBeanName(column.columnName)}"/></td>
</#switch>
</#if>
</#list>
<td align="center">
<a href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do?formMap.${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}=<s:property value="${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}"/>" class="edit">修改</a>
<a href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/remove.do?formMap.delete${MROUtil.upperFirstChar(MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey))}=<s:property value="${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}"/>" class="delete">删除</a>
</td>
</tr>
</s:iterator>

<tr>
<td colspan="${headCount + 2}" class="fenye"><%@include file="/include/common/page_control.jsp"%></td>
</tr>
</table>
</div>
</form>
<script type="text/javascript" src="/js/${metadata.projectName}/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/js/common/escoder/escoder-core-1.0.js" charset="gbk"></script>
<script type="text/javascript" src="/js/common/escoder/escoder-manager-1.0.js" charset="gbk"></script>
<script type="text/javascript" src="/js/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(metadata.tables[0].tableName)}_index.js" charset="utf-8"></script>
<script type="text/javascript" src="/plugin/jquery-validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/jquery-validate/localization/messages_cn.js"></script>
<script type="text/javascript" src="/plugin/time/WdatePicker.js"></script>
</body>
</html>