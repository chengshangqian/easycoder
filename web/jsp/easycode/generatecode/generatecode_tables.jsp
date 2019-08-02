<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="org.ican.easycode.generator.common.model.*"%>
<%
	Map resultMap = (Map)request.getAttribute("resultMap");
	if(null == resultMap){
		resultMap = new HashMap();
	}
	
	MDMetaData mdMetaData = (MDMetaData)resultMap.get("mdMetaData");
	if(null == mdMetaData){
		mdMetaData = new MDMetaData();
	}
	
	List<MDTable> tables = mdMetaData.getTables();
	if(null == tables){
		tables = new ArrayList<MDTable>();
	}
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set name="cssPath" value="@org.ican.easycode.common.config.EasycodeConfig@getProperty('web.system.css.url')"/>
<s:set name="mdMetaData" value="resultMap.mdMetaData"/>

<div id="tables" class="search_k">
<fieldset class="search">
	<legend><img src="<s:property value="#cssPath"/>/images/search_btn.gif" align="middle"/>&nbsp;选择表</legend>
	<div class="search_content">
		<div class="table_bg">
			<table id="dataTable" style="table-layout: fixed;word-break: break-all; word-wrap: break-word;text-align:left;">
			   <tr>
			   <th style="width:100%;padding-left:10px;text-align:left;" colspan="5">全选 <input type="checkbox" name="allCheckBox" id="allCheckBox" /></th>
			  </tr>	
			  <%
			  if(!tables.isEmpty()){
				  int lineTableCount = 5;
				  int i = 0;
				  for(MDTable table : tables){
					  boolean turnStart = (i%lineTableCount == 0);
					  boolean turnEnd = (i%lineTableCount == (lineTableCount -1));
					  String tableName = table.getTableName();
					  if(turnStart){
				 	  %>
				 	  <tr>
				 	  <%
				 	  }
					  %>
				 	  <td width="20%">
				 	  <input type="checkbox" class="chekcbox-cls" value="<%=tableName %>" />&nbsp;
				 	  <a class="edit optionsConfigCls" title="<%=tableName %>" href="#<%=tableName %>"><%=tableName %></a>
				 	  </td>							  
					  <%
				 		if(i == tables.size() - 1){
				 			if(!turnEnd){
				 				int len = lineTableCount - (tables.size() % lineTableCount);
				 				for(int l = 0; l < len; l++){
				 				%>
				 				<td width="20%">&nbsp;&nbsp;</td>
				 			    <%
				 				}
				 			}
				 			turnEnd = true;
				 		}
				 		
				 		if(turnEnd){
				 		%>
				 		</tr>
				 		<%
				 		}						  
					  i++;
				  }
			  }
			  %>	  
			</table>
		</div>	
	</div>
</fieldset>
</div>

<div id="advanceConfig" class="search_k" style="display:none;">
<fieldset class="search">
		<legend><img src="<s:property value="#cssPath"/>/skin/images/search_btn.gif" align="middle"/>&nbsp;高级选项</legend>
	<div class="search_content">
		<div class="table_bg">
		<input type="hidden" id="dbName" value="<s:property value="#mdMetaData.dbName" />"/>
		<s:iterator value="#mdMetaData.tables" status="tableStatus">
		<form id="<s:property value="tableName" />" action="" class="hide">
		<input type="hidden" name="primaryKey" value="<s:property value="primaryKey" />"/>
			<table style="table-layout: fixed;word-break: break-all; word-wrap: break-word;text-align:left;">
			   <tr>
				   <th width="15%">字段</th>
				   <th width="10%">类型</th>
				   <th width="20%">字段名</th>
				   <th width="5%">查询</th>
				   <th width="5%">表头</th>
				   <th width="5%">输入</th>
				   <th width="10%">输入类型</th>
				   <th width="5%">必填</th>
				   <th width="10%">验证规则</th>
				   <th width="15%">验证格式</th>
			   </tr>
			   <s:iterator value="columns">
			   <s:if test="columnName == #mdMetaData.tables[#tableStatus.index].primaryKey">
			   <tr>
				 <td style="color:#F00;"><s:property value="columnName" /></td>
				 <td style="color:#F00;"><s:property value="typeName" /></td>				 
				 <td><input type="text" name="formMap.remarks" value="<s:property value="remarks" />" /></td>
				 <td><input type="hidden" name="formMap.isQuery" value="false"/>&nbsp;&nbsp;</td>
				 <td><input type="hidden" name="formMap.isHead"  value="false"/>&nbsp;&nbsp;</td>
				 <td><input type="hidden" name="formMap.isIuput" value="false"/>&nbsp;&nbsp;</td>
				 <td><input type="hidden" name="formMap.inputType" value="text"/>&nbsp;&nbsp;</td>		 
				 <td><input type="hidden" name="formMap.required" value="false"/>&nbsp;&nbsp;</td>
				 <td><input type="hidden" name="formMap.columnDef" value=""/>&nbsp;&nbsp;</td>
				 <td><input type="hidden" name="formMap.format" value=""/>&nbsp;&nbsp;</td>	
			   </tr>		   
			   </s:if>
			   <s:else>
			   <tr>
				 <td><s:property value="columnName" /></td>
				 <td><s:property value="typeName" /></td>				 
				 <td><input type="text" name="formMap.remarks" value="<s:property value="remarks" />" /></td>
				 <td><input type="checkbox" name="formMap.isQuery" /></td>
				 <td><input type="checkbox" name="formMap.isHead" checked="checked"/></td>
				 <td><input type="checkbox" name="formMap.isIuput" checked="checked"/></td>
				 <td>
				 <s:if test='standardType == @org.ican.easycode.generator.common.util.MROUtil@TYPE_DATE'>
				 <select name="formMap.inputType" disabled="disabled">
					 <option value="text">text</option>
				 </select>				 
				 </s:if>
				 <s:else>
				 <select name="formMap.inputType">
					 <option value="text">text</option>
					 <option value="password">password</option>
					 <option value="textarea">textarea</option>
					 <option value="htmlEditor">htmlEditor</option>
					 <option value="hidden">hidden</option>
				 </select>
				 </s:else>
				 </td>		 
				 <td><input type="checkbox" name="formMap.required" /></td>
				 <td>
				 <s:if test='standardType == @org.ican.easycode.generator.common.util.MROUtil@TYPE_DATE'>
				 <select name="formMap.columnDef" disabled="disabled">
					 <option value="date">日期</option>
				 </select>				 
				 </s:if>
				 <s:elseif test="standardType == @org.ican.easycode.generator.common.util.MROUtil@TYPE_NUMBER">
				 <select name="formMap.columnDef">
					 <option value="number">数字</option>
					 <option value="digits">整数</option>
					 <option value="range">数值范围</option>
					 <option value="max">最大值</option>
					 <option value="min">最小值</option>
				 </select>					 
				 </s:elseif>
				 <s:else>				 
				 <select name="formMap.columnDef">
					 <option value="">无</option>
					 <option value="email">邮件</option>
					 <option value="url">网址</option>
					 <option value="number">数字</option>
					 <option value="digits">整数</option>
					 <option value="rangelength">长度范围</option>
					 <option value="maxlength">最大长度</option>
					 <option value="minlength">最小长度</option>
					 <option value="range">数值范围</option>
					 <option value="max">最大值</option>
					 <option value="min">最小值</option>
				 </select>
				 </s:else>
				 </td>
				 <td><input type="text" name="formMap.format" value="<s:property value="format" />"/></td>	
			   </tr>			   
			   </s:else>
			   </s:iterator>
   			   <tr>
				   <td colspan="10" align="center"><a class="submitCls" style="font-weight:bold;" href="#back"> 确定 </a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="resetCls" style="font-weight:bold;" href="#back"> 重置 </a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="cancelCls" style="font-weight:bold;" href="#back"> 返回 </a></td>
			   </tr>		  
			</table>
		</form>
		</s:iterator>			
		</div>	
	</div>
</fieldset>
</div>