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
%<xsl:text disable-output-escaping="yes"><![CDATA[>]]></xsl:text>
<xsl:text>
</xsl:text>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理首页</title>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[
<link rel="stylesheet" type="text/css" href="<%=cssPath%>/skin/skin2/cms_common.css"/>
]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[
<link rel="stylesheet" type="text/css" href="<%=cssPath%>/skin/skin2/cms_sytle.css"/>
]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<link rel="stylesheet" type="text/css" media="screen" href="/plugin/jquery-validate/css/screen.css" />]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<script type="text/javascript" src="/js/]]></xsl:text><xsl:value-of select="metadata/projectName" /><xsl:text disable-output-escaping="yes"><![CDATA[/common/jquery/jquery.js"></script>]]></xsl:text>
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<script type="text/javascript" src="/js/]]></xsl:text><xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/lowerTableName" /><xsl:text disable-output-escaping="yes"><![CDATA[_index.js" charset="utf-8"></script>]]></xsl:text>
<xsl:text>
</xsl:text>
<script type="text/javascript" src="/plugin/jquery-validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/jquery-validate/localization/messages_cn.js"></script>
<script type="text/javascript" src="/plugin/time/WdatePicker.js"></script>
</head>
<body class="main_bg">
<xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[
<div class="weizhi"><span class="weizhi_icon">&nbsp;</span>您目前所在位置：平台管理  &gt; 信息管理 </div>
]]></xsl:text>	
<xsl:text>
</xsl:text>
<form id="queryForm" name="queryForm" action="" method="post">
<div class="search_k">
<fieldset class="search">
	<legend><xsl:text disable-output-escaping="yes"><![CDATA[<img src="<%=cssPath%>/skin/images/search_btn.gif" align="middle"/>&nbsp;高级查找]]></xsl:text>	</legend>
	<div class="search_content">
	<xsl:for-each select="metadata/tables/table/columns/column">
	<xsl:if test="isQuery = 'true'">
	<xsl:choose><xsl:when test="standardType = 'DATE'"><xsl:value-of select="remarks" />:<xsl:text disable-output-escaping="yes"><![CDATA[<input type="text" readonly="readonly" onclick="WdatePicker({dateFmt:']]></xsl:text><xsl:value-of select="format" /><xsl:text disable-output-escaping="yes"><![CDATA['})" name="formMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" value="<s:date format="]]></xsl:text><xsl:value-of select="format" /><xsl:text disable-output-escaping="yes"><![CDATA[" name="resultMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" />&nbsp;&nbsp;]]></xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="remarks" />:<xsl:text disable-output-escaping="yes"><![CDATA[<input type="text" name="formMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA[" value="<s:property value="resultMap.]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" />&nbsp;&nbsp;]]></xsl:text></xsl:otherwise></xsl:choose>
	</xsl:if>
	</xsl:for-each>
	<xsl:text disable-output-escaping="yes"><![CDATA[<input type="submit" value="开始查询" class="input_btn_style1"/>&nbsp;&nbsp;<input type="reset" value="重置" class="input_btn_style1"/>]]></xsl:text>
	</div>
</fieldset>
</div>
<div class="select">
<span style="float:right;">
<xsl:text disable-output-escaping="yes"><![CDATA[<input id="createBt" type="button" value="新增"  class="input_btn_style2" />&nbsp;&nbsp;<input id="deleteSelected" type="button" value="删除所选"  class="input_btn_style1" />]]></xsl:text>
</span>
</div>
<div class="table_bg">
<table align="center">
   <tr>
    <th>选择<xsl:text disable-output-escaping="yes"><![CDATA[ <input type="checkbox" name="allCheckBox" id="allCheckBox" />]]></xsl:text></th>
    <xsl:for-each select="metadata/tables/table/columns/column">
    <xsl:if test="isHead = 'true'">
    <th><xsl:value-of select="remarks" /></th>
    </xsl:if>
    </xsl:for-each>
    <th nowrap="nowrap">操作</th>
  </tr>
<xsl:text>
</xsl:text>  
<xsl:text disable-output-escaping="yes"><![CDATA[
  <s:iterator value="resultList">
]]></xsl:text>	
  <tr>
	 <td align="center"><xsl:text disable-output-escaping="yes"><![CDATA[<input type="checkbox" class="chekcbox-cls" name="formMap.delete]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/upperKey" /><xsl:text disable-output-escaping="yes"><![CDATA["  value="<s:property value="]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" />]]></xsl:text></td>
	<xsl:for-each select="metadata/tables/table/columns/column">
    <xsl:if test="isHead = 'true'">
    <td align="center">
   	<xsl:choose>
	<xsl:when test="standardType = 'DATE'">
	<xsl:text disable-output-escaping="yes"><![CDATA[<s:date format="]]></xsl:text><xsl:value-of select="format" /><xsl:text disable-output-escaping="yes"><![CDATA[" name="]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/>]]></xsl:text>
	</xsl:when>
	<xsl:otherwise>
	<xsl:text disable-output-escaping="yes"><![CDATA[<s:property value="]]></xsl:text><xsl:value-of select="lowerName" /><xsl:text disable-output-escaping="yes"><![CDATA["/>]]></xsl:text>
	</xsl:otherwise>
	</xsl:choose>   
    </td>
    </xsl:if>
    </xsl:for-each>
	 <td align="center">
	 <xsl:text disable-output-escaping="yes"><![CDATA[
	 <a href="]]></xsl:text>/<xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" /><xsl:text disable-output-escaping="yes"><![CDATA[/doInput.do?formMap.]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /><xsl:text disable-output-escaping="yes"><![CDATA[=<s:property value="]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" class="edit">修改</a>]]></xsl:text>
	 <xsl:text>
</xsl:text>
<xsl:text disable-output-escaping="yes"><![CDATA[<a href="]]></xsl:text>/<xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" /><xsl:text disable-output-escaping="yes"><![CDATA[/remove.do?formMap.delete]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/upperKey" /><xsl:text disable-output-escaping="yes"><![CDATA[=<s:property value="]]></xsl:text><xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /><xsl:text disable-output-escaping="yes"><![CDATA["/>" class="delete">删除</a>
	 ]]></xsl:text>
	 </td>
  </tr>
<xsl:text>
</xsl:text>  
 <xsl:text disable-output-escaping="yes"><![CDATA[
  </s:iterator>
]]></xsl:text>  
<xsl:text>
</xsl:text>  
<xsl:text disable-output-escaping="yes"><![CDATA[
  <tr>
  <td colspan="]]></xsl:text><xsl:value-of select="metadata/tables/table/headCount + 2" /><xsl:text disable-output-escaping="yes"><![CDATA[" class="fenye"><%@include file="/include/common/page_control.jsp"%></td></tr>]]></xsl:text>
</table>
</div>
</form>
<div style="display:none;">
	<span id="selectedTips">请选择一条记录!</span>
	<span id="deleteSelectedConfirmTips">确定删除所选记录吗?</span>
	<span id="deleteConfirmTips">确定删除该信息吗?</span>
</div>
</body>
</html>
	</xsl:template>
</xsl:stylesheet>