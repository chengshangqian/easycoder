<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" 
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
	doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="GBK" />
	<xsl:template match="/">
<xsl:text disable-output-escaping="yes"><![CDATA[<]]></xsl:text>%@ page language="java" pageEncoding="GBK"<xsl:text disable-output-escaping="yes"><![CDATA[%>]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<]]></xsl:text>%@ taglib prefix="s" uri="/struts-tags" <xsl:text disable-output-escaping="yes"><![CDATA[%>]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<]]></xsl:text>%
	java.util.HashMap resultMap = (java.util.HashMap)request.getAttribute("resultMap");
	String cssPath = <xsl:value-of select="metadata/packageName" />.util.AppUtil.getCssImageServerPath(request,resultMap);
	String editorUploadAction = <xsl:value-of select="metadata/packageName" />.util.AppUtil.getUploadAction(request,resultMap);
%<xsl:text disable-output-escaping="yes"><![CDATA[>]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[
<s:set name="to" value="resultMap.]]></xsl:text><xsl:value-of select="metadata/tables/table/beanName" /><xsl:text disable-output-escaping="yes"><![CDATA[To"/>]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:for-each select="metadata/tables/table/columns/column">
<xsl:text disable-output-escaping="yes"><![CDATA[<s:set name="]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" value="#to.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/>]]></xsl:text>
<xsl:text>
</xsl:text>
</xsl:for-each>
<xsl:text disable-output-escaping="yes"><![CDATA[
<s:set name="isModifing" value="#]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /><xsl:text disable-output-escaping="yes"><![CDATA[ != null && #]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /><xsl:text disable-output-escaping="yes"><![CDATA[ != ''"/>
]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text>
</xsl:text>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<title><s:if test="#isModifing">修改</s:if><s:else>新增</s:else></title>]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<link rel="stylesheet" type="text/css" href="<%=cssPath %>/skin/skin2/cms_common.css"/>]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<link rel="stylesheet" type="text/css" href="<%=cssPath %>/skin/skin2/cms_sytle.css"/>]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<link rel="stylesheet" type="text/css" media="screen" href="/plugin/jquery-validate/css/screen.css" />]]></xsl:text>
</head>
<body class="main_bg">
<xsl:text disable-output-escaping="yes"><![CDATA[<div class="weizhi"><span class="weizhi_icon"> </span>您目前所在位置：平台管理 &gt; 信息管理 &gt; <s:if test="#isModifing">修改</s:if><s:else>新增</s:else></div>]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<form id="inputForm" name="inputForm" method="post" action="<s:if test="#isModifing">/]]></xsl:text><xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" /><xsl:text disable-output-escaping="yes"><![CDATA[/modify.do</s:if><s:else>/]]></xsl:text><xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" /><xsl:text disable-output-escaping="yes"><![CDATA[/create.do</s:else>">]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[
<input class="cmxform" type="hidden" name="formMap.]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /><xsl:text disable-output-escaping="yes"><![CDATA[" id="formMap.]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /><xsl:text disable-output-escaping="yes"><![CDATA[" value="<s:property value="#]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" />]]></xsl:text>
<xsl:text>
</xsl:text>
<div class="table_bg2">
  <table align="center" >
  <xsl:for-each select="metadata/tables/table/columns/column">
  <xsl:if test="isInput = 'true'">
        <xsl:choose>
        <xsl:when test="inputType = 'textarea' or inputType = 'htmlEditor'">
        <tr>
        	<td class="td2" align="right" width="25%"><xsl:value-of select="remarks" /></td>
        	<td width="75%">
			<xsl:choose>        	
	        <xsl:when test="requried = 'true'">
	        	<xsl:text disable-output-escaping="yes"><![CDATA[<textarea id="]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" rows="15" cols="60" class="required" name="formMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["><s:property value="#]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/></textarea>]]></xsl:text>
	        </xsl:when>
	        <xsl:otherwise>
	        	<xsl:text disable-output-escaping="yes"><![CDATA[<textarea id="]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" rows="15" cols="60"  name="formMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["><s:property value="#]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/></textarea>]]></xsl:text>
	        </xsl:otherwise>
	        </xsl:choose>
        	</td>
    	</tr>
        </xsl:when>
        <xsl:when test="inputType = 'hidden'">
        <xsl:text disable-output-escaping="yes"><![CDATA[<input type="hidden" id="]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" name="formMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" value="<s:property value="#]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" />]]></xsl:text>
        </xsl:when>
        <xsl:otherwise>
        <tr>
        	<td class="td2" align="right" width="25%"> <xsl:value-of select="remarks" /></td>
        	<td width="75%">
        	<xsl:choose>
        	<xsl:when test="requried = 'true'">
        	<xsl:choose>
        	<xsl:when test="standardType = 'DATE'">
        	<xsl:text disable-output-escaping="yes"><![CDATA[<input type="text" id="]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" class="required" readonly="readonly" onclick="WdatePicker({dateFmt:']]></xsl:text><xsl:value-of select="format" /><xsl:text disable-output-escaping="yes"><![CDATA['})" class="required" name="formMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" value="<s:date format="]]></xsl:text><xsl:value-of select="format" /><xsl:text disable-output-escaping="yes"><![CDATA[" name="#]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" />]]></xsl:text>
        	</xsl:when>
        	<xsl:otherwise>
        	<xsl:text disable-output-escaping="yes"><![CDATA[<input type="text" id="]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" class="required" name="formMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" value="<s:property value="#]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" />]]></xsl:text>
        	</xsl:otherwise>
        	</xsl:choose>
        	</xsl:when>
        	<xsl:otherwise>
        	<xsl:choose>
        	<xsl:when test="standardType = 'DATE'">
        	<xsl:text disable-output-escaping="yes"><![CDATA[<input type="text" id="]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" readonly="readonly" onclick="WdatePicker({dateFmt:']]></xsl:text><xsl:value-of select="format" /><xsl:text disable-output-escaping="yes"><![CDATA['})" name="formMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" value="<s:date format="]]></xsl:text><xsl:value-of select="format" /><xsl:text disable-output-escaping="yes"><![CDATA[" name="#]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" />]]></xsl:text>
        	</xsl:when>
        	<xsl:otherwise>
        	<xsl:text disable-output-escaping="yes"><![CDATA[<input type="text" id="]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" name="formMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" value="<s:property value="#]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" />]]></xsl:text>
        	</xsl:otherwise>
        	</xsl:choose>        	
        	</xsl:otherwise>
        	</xsl:choose>
        	</td>
    	</tr>
        </xsl:otherwise>
        </xsl:choose>
  </xsl:if>
  </xsl:for-each>
  </table>
  </div>
  <xsl:text disable-output-escaping="yes"><![CDATA[
  <div class="submi">
  <input type="submit" value="保存" class="input_btn_style1"/>&nbsp;&nbsp;
  <input id="backBt" type="button" value="返回" class="input_btn_style1" /></div>
</form>
<input id="editorUploadAction" type="hidden" value="<%=editorUploadAction %>" />
]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<script type="text/javascript" src="/js/]]></xsl:text><xsl:value-of select="metadata/projectName" /><xsl:text disable-output-escaping="yes"><![CDATA[/common/jquery/jquery.js"></script>]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<script type="text/javascript" src="/js/]]></xsl:text><xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/lowerTableName" /><xsl:text disable-output-escaping="yes"><![CDATA[_input.js"></script>]]></xsl:text>
<xsl:text>
</xsl:text>
<script type="text/javascript" src="/plugin/jquery-validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/jquery-validate/localization/messages_cn.js"></script>
<script type="text/javascript" src="/plugin/xheditor/xheditor-zh-cn.min.js"></script>
<script type="text/javascript" src="/plugin/time/WdatePicker.js"></script>
</body>
</html>
	</xsl:template>
</xsl:stylesheet>