/**
 * @author ³ÉÉÐÇ«
 */
 
  $(function(){
	 var xhEditorUploadUrl = $('#editorUploadAction').val();
	 var xhEditors = [];
	 <#list metadata.tables[0].columns as column>
	 <#if (column.isIuput())>
	 <#if column.inputType = "htmlEditor">
	 xhEditors.push('${column.columnName}');
	 </#if>
	 </#if>
	 </#list>
 	 
     var rules = {};
	 <#list metadata.tables[0].columns as column>
	 <#if (column.isIuput())>
	 <#switch StringUtils.trimToEmpty(column.columnDef)>
	 <#case "">
	 <#if (column.isRequired())>
	 rules['formMap.${column.columnName}'] = {required:true};
	 </#if>		 
	 <#break>
	 <#case "email">
	 <#case "url">
	 <#case "date">
	 <#case "number">
	 <#case "digits">
	 <#if (column.isRequired())>
	 <#switch StringUtils.trimToEmpty(column.columnDef)>
	 <#case "date">
	 rules['formMap.${column.columnName}'] = {required:true};
	 <#break>
	 <#default>
	 rules['formMap.${column.columnName}'] = {required:true,${column.columnDef}:true};
	 </#switch>
	 <#else>
	 rules['formMap.${column.columnName}'] = {${column.columnDef}:true};
	 </#if>
	 <#break>
	 <#default>
	 <#if (column.isRequired())>
	 rules['formMap.${column.columnName}'] = {required:true,${column.columnDef}:${column.format}};
	 <#else>
	 rules['formMap.${column.columnName}'] = {${column.columnDef}:${column.format}};
	 </#if>		 
	 </#switch>
	 </#if>
	 </#list>
 	  	 
	 var cfg = {
		backIndex : '/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}/index.do'
		//,backBt : 'backBt'
		//,inputForm : 'inputForm'
		,xhEditors : xhEditors
		,rules : rules
		,uploadCfg : {
			upLinkUrl:xhEditorUploadUrl
			//,upLinkExt:"zip,rar,txt"
			,upImgUrl:xhEditorUploadUrl
			//,upImgExt:"jpg,jpeg,gif,png,bmg"
			,upFlashUrl:xhEditorUploadUrl
			//,upFlashExt:"swf"
			,upMediaUrl:xhEditorUploadUrl
			//,upMediaExt:"wmv,avi,wma,mp3,mid"
		}
		//,uploadEnabled : true
	    //,requiredErrorHtml : '<span style="font-weight:bold; color:#F00;">&nbsp;*</span>'
	 };
	 var ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Merger = new ESCoder.Merger(cfg);
	 ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Merger.start();
 });