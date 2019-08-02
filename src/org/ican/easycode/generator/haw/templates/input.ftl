<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    java.util.HashMap resultMap = (java.util.HashMap)request.getAttribute("resultMap");
    //String cssPath = ${metadata.packageName}.util.AppUtil.getCssImageServerPath(request,resultMap);
	String editorUploadAction = ${metadata.packageName}.util.AppUtil.getUploadAction(request,resultMap);    
%>
<s:set name="to" value="resultMap.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}To"/>
<#list metadata.tables[0].columns as column>
<s:set name="${column.columnName}" value="#to.${column.columnName}"/>
</#list>
<s:set name="isModifing" value="#${metadata.tables[0].primaryKey} != null && #${metadata.tables[0].primaryKey} != ''"/>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title><s:if test="#isModifing">修改</s:if><s:else>新增</s:else></title>
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
                   
					<form id="inputForm" name="inputForm" method="post" action="<s:if test="#isModifing">/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/modify.do</s:if><s:else>/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/create.do</s:else>">
					<input type="hidden" name="formMap.${metadata.tables[0].primaryKey}" id="formMap.${metadata.tables[0].primaryKey}" value="<s:property value="#${metadata.tables[0].primaryKey}"/>" />
					<!-- 表单模板2 -->
					<section class="content-box bottom10">
					  <header class="content-box-header clearfix">
					      <h3 class="s-resize"><s:if test="#isModifing">修改</s:if><s:else>新增</s:else></h3>
					  </header>
					  <article class="content-box-content20">
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
						        	<textarea tips="请填写${column.remarks}" id="${column.columnName}" cols="30" rows="10" class="full_input required" name="formMap.${column.columnName}"><s:property value="#${column.columnName}"/></textarea>
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
						        	<td width="60">${column.remarks}</td>
						        	<td>
						        	<#if (column.isRequired())>
							        	<#if column.standardType = "DATE">
							        	<input tips="请填写${column.remarks}" type="text" id="${column.columnName}" class="small_input required" readonly="readonly" onclick="WdatePicker({dateFmt:'${column.format}'})" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
							        	<#else>
							        	<input tips="请填写${column.remarks}" type="text" id="${column.columnName}" class="small_input required" name="formMap.${column.columnName}" value="<s:property value="#${column.columnName}"/>" />
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
					            
					            <tr>
					              <td></td>
					              <td>
					                <a class="staic_btn_style01" id="submitBt" href=""><span>确定</span></a>
					                <a class="staic_btn_style02" id="backBt" href=""><span>取消</span></a>
					              </td>
					            </tr>
					          </tbody>
					      </table>
					      
					  </article>
					  
					</section>
					<!--//表单模板2-->
                    </form>

                        
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
<input id="editorUploadAction" type="hidden" value="<%=editorUploadAction %>" />
</body>
<%@include file="/include/common/js.jsp"%>
<%@include file="/include/common/js_merger.jsp"%>
<script type="text/javascript" src="/js/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(metadata.tables[0].tableName)}_input.js" charset="utf-8"></script>
</html>