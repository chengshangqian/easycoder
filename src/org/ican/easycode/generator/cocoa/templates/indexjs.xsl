<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
/**
 * @author 成尚谦
 */
 
  $(function(){
    var rules = {};
 	<xsl:for-each select="metadata/tables/table/columns/column">
 	<xsl:if test="isQuery = 'true'">
 	<xsl:if test="columnDef = 'number' or columnDef = 'digits'">
 	rules['formMap.<xsl:value-of select="lowerName" />'] = {<xsl:value-of select="columnDef" />:true};
 	</xsl:if>
 	</xsl:if>
 	</xsl:for-each>
 	    
 	var cfg = {
 		 queryAction : '/<xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" />/findByPage.do'
 		 ,deleteAction : '/<xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" />/remove.do'
 		 ,createAction : '/<xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" />/doInput.do'
 		 ,rules : rules 			
		 //,createBt : 'createBt'
		 //,deleteSelected : 'deleteSelected'
		 //,allCheckBox : 'allCheckBox'
		 //,deleteSelector : 'a.delete'
		 //,queryForm : 'queryForm'
		 //,selectedTips : '请选择一条记录!'
 	     //,deleteSelectedConfirmTips : '确定删除所选记录吗?'
	     //,deleteConfirmTips : '确定删除该信息吗?'	 
 	};
 	var <xsl:value-of select="metadata/tables/table/beanName" />Manager = new ESCoder.Manager(cfg);
 	<xsl:value-of select="metadata/tables/table/beanName" />Manager.start(); 	
 });
	</xsl:template>
</xsl:stylesheet>