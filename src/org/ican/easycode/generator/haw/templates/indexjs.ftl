/**
 * @author ����ǫ
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
		 //,selectedTips : '��ѡ��һ����¼!'
 	     //,deleteSelectedConfirmTips : 'ȷ��ɾ����ѡ��¼��?'
	     //,deleteConfirmTips : 'ȷ��ɾ������Ϣ��?'
	     //,submitQueryBt : 'submitQueryBt'
		 ,submitQueryHandler : submitQueryHandler			 
		 //,initNoHrefMenuEvent : true
		 //,initCurrentLocation : true
 	};
 	var ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Manager = new ESCoder.Manager(cfg);
 	${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Manager.start(); 	
 });
 
  /**
   * �����Զ���"��ѯ/����"��ť������:�Ǳ��룬�����Ҫ������Ĳ�ѯ��������֤�����ƣ�������÷�ʽʵ��
   * @evt ����¼�
   * @el "��ѯ/����"Ԫ��
   * @manager ����ҳ����
   */
  function submitQueryHandler(evt,el,manager){
	  evt.preventDefault();
	  
	  // TODO ���ԶԲ�ѯ������һЩ��֤;
	  
	  $('#' + manager.getQueryForm()).submit();
  } 