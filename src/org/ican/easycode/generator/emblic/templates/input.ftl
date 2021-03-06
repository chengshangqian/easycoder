<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    java.util.HashMap resultMap = (java.util.HashMap)request.getAttribute("resultMap");
    String cssPath = ${metadata.packageName}.util.AppUtil.getCssImageServerPath(request,resultMap);
	String editorUploadAction = ${metadata.packageName}.util.AppUtil.getUploadAction(request,resultMap);    
%>
<s:set name="to" value="resultMap.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}To"/>
<#list metadata.tables[0].columns as column>
<s:set name="${column.columnName}" value="#to.${column.columnName}"/>
</#list>
<s:set name="isModifing" value="#${metadata.tables[0].primaryKey} != null && #${metadata.tables[0].primaryKey} != ''"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><s:if test="#isModifing">修改</s:if><s:else>新增</s:else></title>
<link rel="stylesheet" type="text/css" href="<%=cssPath %>/skin/skin2/cms_common.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssPath %>/skin/skin2/cms_sytle.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="/plugin/jquery-validate/css/screen.css" />
</head>
<body class="main_bg">
<div class="weizhi"><span class="weizhi_icon"> </span>您目前所在位置：平台管理 &gt; 信息管理 &gt; <s:if test="#isModifing">修改</s:if><s:else>新增</s:else></div>
<form id="inputForm" name="inputForm" method="post" action="<s:if test="#isModifing">/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/modify.do</s:if><s:else>/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/create.do</s:else>">
<input class="cmxform" type="hidden" name="formMap.${metadata.tables[0].primaryKey}" id="formMap.${metadata.tables[0].primaryKey}" value="<s:property value="#${metadata.tables[0].primaryKey}"/>" />
<div class="table_bg2">
  <table align="center" >
  <#list metadata.tables[0].columns as column>
  <#if (column.isIuput())>
  <#switch StringUtils.trimToEmpty(column.inputType)> 
  <#case "textarea"> 
  <#case "htmlEditor"> 
        <tr>
        	<td class="td2" align="right" width="25%">${column.remarks}</td>
        	<td width="75%">
        	<#if (column.isRequired())>
        	<textarea id="${column.columnName}" rows="15" cols="60" class="required" name="formMap.${column.columnName}"><s:property value="#${column.columnName}"/></textarea>
        	<#else>
        	<textarea id="${column.columnName}" rows="15" cols="60"  name="formMap.${column.columnName}"><s:property value="#${column.columnName}"/></textarea>
        	</#if>
        	</td>
    	</tr>
  <#break>
  <#case "hidden">
  <input type="hidden" id="${column.columnName}" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
  <#break>
  <#default> 
        <tr>
        	<td class="td2" align="right" width="25%"> ${column.remarks}</td>
        	<td width="75%">
        	<#if (column.isRequired())>
	        	<#if column.standardType = "DATE">
	        	<input type="text" id="${column.columnName}" class="required" readonly="readonly" onclick="WdatePicker({dateFmt:'${column.format}'})" class="required" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
	        	<#else>
	        	<input type="text" id="${column.columnName}" class="required" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
	        	</#if>
        	<#else>
	        	<#if column.standardType = "DATE">
	        	<input type="text" id="${column.columnName}" readonly="readonly" onclick="WdatePicker({dateFmt:'${column.format}'})" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
	        	<#else>
	        	<input type="text" id="${column.columnName}" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
	        	</#if>        	
        	</#if>
        	</td>
    	</tr>
  </#switch>
  </#if>
  </#list>
  </table>
  </div>
  <div class="submi">
  <input type="submit" value="保存" class="input_btn_style1"/>&nbsp;&nbsp;
  <input id="backBt" type="button" value="返回" class="input_btn_style1" /></div>
 </form>
 <input id="editorUploadAction" type="hidden" value="<%=editorUploadAction %>" />
<script type="text/javascript" src="/js/${metadata.projectName}/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/js/common/escoder/escoder-core-1.0.js" charset="gbk"></script>
<script type="text/javascript" src="/js/common/escoder/escoder-merger-1.0.js" charset="gbk"></script>
<script type="text/javascript" src="/js/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(metadata.tables[0].tableName)}_input.js" charset="utf-8"></script>
<script type="text/javascript" src="/plugin/jquery-validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/jquery-validate/localization/messages_cn.js"></script>
<script type="text/javascript" src="/plugin/time/WdatePicker.js"></script>
<script type="text/javascript" src="/plugin/xheditor/xheditor-zh-cn.min.js"></script>
</body>
</html>