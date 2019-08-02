<#assign headCount=0>
<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ include file="/include/common/top.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>��Ϣ���� - <%@include file="/include/common/title.jsp"%></title>
<%@include file="/include/common/includecss.jsp"%>
</head>
<body>
<div class="wrap">
			<%@ include file="/include/common/header.jsp"%>
 
			<!-- body -->
			<div class="body-wrapper clearfix">
				<!-- ���� -->
				<div class="main-wrapper">
 
					<div id="main-content">
					    <%@ include file="/include/common/netplace.jsp"%>
						<!-- չ������ -->
						<a href="javascript:;" class="shrink_area" onclick="toggle(this);"
							hidefocus><i></i> </a>
						<!--//չ������-->
						
						<div class="main_content">
							<!-- ģ���� -->
							<section class="content-box">
							<header class="content-box-header clearfix">
							<h3 class="s-resize">��Ϣ����</h3>
							<div class="ctrl">
							    <!-- 
                                <gzdec:rightsButton rightCode="${metadata.tables[0].tableName}_ADD" value="����" cssClass="button" elementId="createBt"></gzdec:rightsButton>
                                <gzdec:rightsButton rightCode="${metadata.tables[0].tableName}_DEL_SELECTED" value="ɾ����ѡ" cssClass="button" elementId="deleteSelected"></gzdec:rightsButton>
                                -->
								<input type="button" value="����" class="button" id="createBt" />
								<input type="button" value="ɾ����ѡ" class="button" id="deleteSelected" />
							</div>
							</header>
							<article class="content-box-content">
							<form method="post" name="mainForm" id="mainForm" action="">
								<input type="hidden" name="formMap.partMenuId" id="partMenuId" value="<s:property value="formMap.partMenuId" />" />
								<input type="hidden" name="formMap.subPartMenuId" id="subPartMenuId" value="<s:property value="formMap.subPartMenuId" />" />
								
								<!-- ��ѯ -->
								<div class="searchArea">
									<#list metadata.tables[0].columns as column>
									<#if (column.isQuery())>
									<label>${column.remarks}:</label><#if column.standardType = "DATE"><input type="text" class="text-input sec-input" readonly="readonly" onclick="WdatePicker({dateFmt:'${column.format}'})" name="formMap.${column.columnName}" value="<s:date format="${column.format}" name="resultMap.${column.columnName}"/>" /><#else><input type="text" class="text-input sec-input" name="formMap.${column.columnName}" value="<s:property value="resultMap.${column.columnName}"/>" /></#if>&nbsp;&nbsp;
									</#if>
									</#list>								
									 <input type="submit" value="����" class="button" />
                                   <!-- 
									<a href="javascript:;" onClick="$('#highSec').toggle()">�߼�����&raquo;</a>
									<div class="font-size12" id="highSec" style="display: none;">
										<p></p>
										<label>
											��ǩ��:
										</label>
										<input name="_inputName" id="_inputId" class="text-input sec-input" />
									</div>
								   -->
								</div>
								<br />
 
 
								<!--//��ѯ-->
								<!--���ģ��-->
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
											<th>����</th>
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
                                        <gzdec:rightsHref href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do?formMap.${metadata.tables[0].primaryKey}=<s:property value="${metadata.tables[0].primaryKey}"/>" rightCode="${metadata.tables[0].tableName}_VIEW" text="�鿴��ϸ" cssClass="go" />
                                        <gzdec:rightsHref href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do?formMap.${metadata.tables[0].primaryKey}=<s:property value="${metadata.tables[0].primaryKey}"/>&formMap.partMenuId=<s:property value="formMap.partMenuId" />&formMap.subPartMenuId=<s:property value="formMap.subPartMenuId" />" rightCode="${metadata.tables[0].tableName}_EDIT" text="�޸�" cssClass="edit" />
                                        <gzdec:rightsHref href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/remove.do?formMap.delete${MROUtil.upperFirstChar(MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey))}=<s:property value="${metadata.tables[0].primaryKey}"/>&formMap.partMenuId=<s:property value="formMap.partMenuId" />&formMap.subPartMenuId=<s:property value="formMap.subPartMenuId" />" rightCode="${metadata.tables[0].tableName}_DEL" text="ɾ��" cssClass="delete" />
                                        --%>										
										<a href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do?formMap.${metadata.tables[0].primaryKey}=<s:property value="${metadata.tables[0].primaryKey}"/>&formMap.partMenuId=<s:property value="formMap.partMenuId" />&formMap.subPartMenuId=<s:property value="formMap.subPartMenuId" />" class="edit">�޸�</a>
										<a href="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/remove.do?formMap.delete${MROUtil.upperFirstChar(MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey))}=<s:property value="${metadata.tables[0].primaryKey}"/>&formMap.partMenuId=<s:property value="formMap.partMenuId" />&formMap.subPartMenuId=<s:property value="formMap.subPartMenuId" />" class="delete">ɾ��</a>
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
								<!--���ģ��//-->
							</form>
							</article>
							</section>
							<!--//ģ����-->

						<%@ include file="/include/common/foot.jsp"%>
						</div>
					</div>
				</div>
				<!--//����-->
				<!-- ���� -->
				
<!-- ���� -->
<%@ include file="/include/common/left.jsp"%>
<!--//����-->
</div>
<!--//body-->
</div>

<%@include file="/include/common/includejs.jsp"%>
<script type="text/javascript" src="/js/common/escoder/escoder-manager-1.0.js" charset="gbk"></script>
<script type="text/javascript" src="/js/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(metadata.tables[0].tableName)}_index.js" charset="utf-8"></script>
</body>
</html>