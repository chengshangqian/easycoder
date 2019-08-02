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
	
 	var cfg = {
 		 queryAction : '/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/findByPage.do'
 		 ,deleteAction : '/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/remove.do'
 		 ,createAction : '/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/doInput.do'
 		 ,rules : rules 			
		 //,createBt : 'createBt'
		 //,deleteSelected : 'deleteSelected'
		 //,allCheckBox : 'allCheckBox'
		 ,deleteSelector : 'a.del'
		 //,queryForm : 'queryForm'
		 //,selectedTips : '请选择一条记录!'
 	     //,deleteSelectedConfirmTips : '确定删除所选记录吗?'
	     //,deleteConfirmTips : '确定删除该信息吗?'
	     //,submitQueryBt : 'submitQueryBt'
		 ,submitQueryHandler : submitQueryHandler			 
		 //,initNoHrefMenuEvent : true
		 //,initCurrentLocation : true
 	};
 	var ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Manager = new ESCoder.Manager(cfg);
 	${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Manager.start(); 	
 });
 
  /**
   * 可以自定义"查询/搜索"按钮处理函数:非必须，如果需要对输入的查询条件做验证或限制，则可以用方式实现
   * @evt 点击事件
   * @el "查询/搜索"元素
   * @manager 管理页对象
   */
  function submitQueryHandler(evt,el,manager){
	  evt.preventDefault();
	  
	  // TODO 可以对查询条件做一些验证;
	  
	  $('#' + manager.getQueryForm()).submit();
  } 