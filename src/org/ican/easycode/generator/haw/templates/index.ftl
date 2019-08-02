<#assign headCount=0>
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    //java.util.HashMap resultMap = (java.util.HashMap)request.getAttribute("resultMap");
    //String cssPath = ${metadata.packageName}.util.AppUtil.getCssImageServerPath(request,resultMap);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>管理系统</title>
<%@include file="/include/common/css.jsp"%>
<!--[if IE]>
<script type="text/javascript" src="http://css.gzedu.com/common/js/resetHTML5_forIE.js"></script>
<![endif]-->
<!--[if lte IE 6]>
<script type="text/javascript" src="http://css.gzedu.com/common/js/DD_belatedPNG_0.0.8a.js"></script>
<script type="text/javascript">
    DD_belatedPNG.fix('.bg_png, .dh_lt, .ui_close');
</script>
<![endif]-->
</head>
<body class="body">
<div class="wrap"> 
    <!-- body -->
  <div class="body-wrapper clearfix">
  
        <!-- 主栏 -->
        <div class="main-wrapper">
            <div id="main-content">
                   <section class="loaction" id="currentLocation">您目前所在位置：</section>
                   <div class="main_content">
						<!-- 表格模板 -->
						<section class="content-box bottom10">
						<header class="content-box-header clearfix">
						   <div class="ctrl">
						       <div class="head_nav">
						            <a href="" id="createBt" class="btn_icon btn_icon_add right5"><span>新增</span></a>
						            <a href="" id="deleteSelected" class="btn_icon btn_icon_delete"><span>删除所选</span></a>
						        </div>
						  </div>
						</header>
						<article>
						<form id="queryForm" name="queryForm" action="" method="post">
						  <div class="searchArea">
								<#list metadata.tables[0].columns as column>
								<#if (column.isQuery())>
								<label for="">${column.remarks}: </label>
								<#if column.standardType = "DATE"><input type="text" class="small_input" readonly="readonly" onclick="WdatePicker({dateFmt:'${column.format}'})" name="formMap.${column.columnName}" value="<s:date format="${column.format}" name="resultMap.${column.columnName}"/>" /><#else><input type="text" class="small_input" name="formMap.${column.columnName}" value="<s:property value="resultMap.${column.columnName}"/>" /></#if>
								</#if>
								</#list>
								&nbsp;&nbsp;<a class="btn_search" href="" id="submitQueryBt"><span>搜索</span></a>     
						  </div>
						 
						    <div style="width:100%;"> 
						        <div>     
						              <table class="tableStyle01">
						                  <thead>
						                      <tr>
						                          <th width="4%" style="text-align:center"><input type="checkbox" class="check-all" name="allCheckBox" id="allCheckBox"/></th>
												  <#list metadata.tables[0].columns as column>
												  <#if (column.isHead())>
												  <#assign headCount = headCount + 1>
												  <th width="15%"><span>${column.remarks}</span></th>
												  </#if>
												  </#list>
						                          <th>操作</th>
						                      </tr>
						                  </thead>
						                  
						                  <tbody>
						                      <s:iterator value="resultList">
						                      <tr class="alt-row">
						                          <td align="center"><input type="checkbox" class="chekcbox-cls" name="formMap.delete${MROUtil.upperFirstChar(MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey))}"  value="<s:property value="${metadata.tables[0].primaryKey}"/>" /></td>
												  <#list metadata.tables[0].columns as column>
												  <#if (column.isHead())>
												  <td><s:property value="${column.columnName}"/></td>
												  </#if>
												  </#list>
						                          <td>
						                              <a href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do?formMap.${metadata.tables[0].primaryKey}=<s:property value="${metadata.tables[0].primaryKey}"/>&formMap.result=view" title="查看" class="a_ctrl">查看</a>
						                              <a href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do?formMap.${metadata.tables[0].primaryKey}=<s:property value="${metadata.tables[0].primaryKey}"/>" title="修改" class="a_ctrl">修改</a>
						                              <a href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/remove.do?formMap.delete${MROUtil.upperFirstChar(MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey))}=<s:property value="${metadata.tables[0].primaryKey}"/>" title="删除" class="a_ctrl del">删除</a>
						                         </td>
						                      </tr>
						                      </s:iterator>
						                  </tbody>
						              </table>
						        </div>
						    </div>
						    
						  <%@include file="/include/common/number_pagination.jsp"%>
						  
						  </form>
						</article>
						</section>
						<!--//表格模板-->   
                   </div>
            </div>
        </div>
        <!--//主栏-->
        
        <!-- 侧栏 include -->
        <!-- 侧栏 -->
        <aside id="side-nav">
            <div class="logo"></div>        
            <%@include file="/include/common/menu.jsp"%>
        </aside>
        <!--//侧栏-->
        <!--//侧栏 include-->
</div>
    <!--//body-->
    
</div>
</body>
<%@include file="/include/common/js.jsp"%>
<%@include file="/include/common/js_manager.jsp"%>
<script type="text/javascript" src="/js/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(metadata.tables[0].tableName)}_index.js" charset="utf-8"></script>
</html>