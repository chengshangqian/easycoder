/**
 * @author 成尚谦
 */
 
  $(function(){
    var rules = {};
    
	<#list metadata.tables[0].columns as column>
	<#if (column.isQuery())>
	<#switch column.columnDef> 
	<#case "number"> 
	rules['formMap.${column.columnName}'] = {${column.columnDef}:true};
	<#break>
	<#case "digits"> 
	rules['formMap.${column.columnName}'] = {${column.columnDef}:true};
	<#break>
	</#switch>
	</#if>
	</#list>

	var partMenuId = $('#partMenuId').val();
	var subPartMenuId = $('#subPartMenuId').val();
	
 	var cfg = {
 		 queryAction : '/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/findByPage.do'
 		 ,deleteAction : '/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/remove.do'
 		 ,createAction : '/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do?formMap.partMenuId=' + partMenuId + '&formMap.subPartMenuId=' + subPartMenuId
 		 ,rules : rules 			
		 //,createBt : 'createBt'
		 //,deleteSelected : 'deleteSelected'
		 //,allCheckBox : 'allCheckBox'
		 //,deleteSelector : 'a.delete'
		 ,queryForm : 'mainForm'
		 //,selectedTips : '请选择一条记录!'
 	     //,deleteSelectedConfirmTips : '确定删除所选记录吗?'
	     //,deleteConfirmTips : '确定删除该信息吗?'	 
 	};
 	var ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Manager = new ESCoder.Manager(cfg);
 	${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Manager.start(); 	
 	
	$("#leftpartMenuId").val($("#leftpartMenuId").val());
	$("#leftsubPartMenuId").val($("#leftsubPartMenuId").val());
	$("#netplaceDiv").html($("#netplaceHTML").html()); 	
 });