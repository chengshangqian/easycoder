<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
/**
 * @author 成尚谦
 */
 
 $(function(){
 	$('#createBt').click(toCreate);
 	$('#deleteSelected').click(toDeleteSelected);
 	$('#allCheckBox').click(allCheckBoxTrigger); 	
 	$('a.delete').each(function(){
 		$(this).click(toDelete);
 	});
 	$('#queryForm').attr('action','/<xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" />/findByPage.do');
 	initValidate();
 });
 
 function initValidate(){
    var rules = {};
 	<xsl:for-each select="metadata/tables/table/columns/column">
 	<xsl:if test="isQuery = 'true'">
 	<xsl:if test="columnDef = 'number' or columnDef = 'digits'">
 	rules['formMap.<xsl:value-of select="lowerName" />'] = {<xsl:value-of select="columnDef" />:true};
 	</xsl:if>
 	</xsl:if>
 	</xsl:for-each>
 	
	$('#queryForm').validate({rules:rules});
 }
 
 function toCreate(evt){
 	window.location.href='/<xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" />/doInput.do';
 }
 
 function toDeleteSelected(evt) {
	var hasChecked = false;
	$('.chekcbox-cls').each(function(){
		var checked = $(this).attr('checked');
		if(checked){
			hasChecked = true;
			return false;
		}
	});
	
	var msg;
	
	if(!hasChecked){
		msg = $('#selectedTips').html();
		alert(msg);
		return false;
	}  
	
	msg = $('#deleteSelectedConfirmTips').html();
 	if(window.confirm(msg)){
 		$('#queryForm').attr('action','/<xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" />/remove.do').submit();
 	}
 }

 function allCheckBoxTrigger(evt){
 	var checked = $(this).attr('checked');
 	$('.chekcbox-cls').attr('checked',checked);
 }
 
 function toDelete(evt){
 	evt.preventDefault();
 	var msg = $('#deleteConfirmTips').html();
 	if(window.confirm(msg)){
 		var href = $(this).attr('href');
 		window.location.href = href;
 	}
 }
	</xsl:template>
</xsl:stylesheet>