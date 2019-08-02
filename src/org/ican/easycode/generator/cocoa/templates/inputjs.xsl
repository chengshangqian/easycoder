<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
/**
 * @author 成尚谦
 */
 
  $(function(){
	 var xhEditorUploadUrl = $('#editorUploadAction').val();
	 var xhEditors = [];
	 <xsl:for-each select="metadata/tables/table/columns/column">
 	 <xsl:if test="isInput = 'true' and inputType = 'htmlEditor'">
 	 xhEditors.push('<xsl:value-of select="lowerName" />');
 	 </xsl:if>
 	 </xsl:for-each>
 	 
     var rules = {};
 	 <xsl:for-each select="metadata/tables/table/columns/column">
 	 <xsl:if test="isInput = 'true'">
 	 <xsl:choose>
 	 <xsl:when test="columnDef = ''">
	 <xsl:if test="requried = 'true'">
 	 rules['formMap.<xsl:value-of select="lowerName" />'] = {required:true};
 	 </xsl:if>
 	 </xsl:when>
 	 <xsl:when test="columnDef = 'email' or columnDef = 'url' or columnDef = 'date' or columnDef = 'number' or columnDef = 'digits'">
 	 <xsl:if test="requried = 'true'">
 	 <xsl:if test="columnDef = 'date'">
 	 rules['formMap.<xsl:value-of select="lowerName" />'] = {required:true};
 	 </xsl:if> 	
 	 <xsl:if test="columnDef != 'date'">
 	 rules['formMap.<xsl:value-of select="lowerName" />'] = {required:true,<xsl:value-of select="columnDef" />:true};
 	 </xsl:if>
 	 </xsl:if>
 	 <xsl:if test="requried != 'true'">
 	 <xsl:if test="columnDef != 'date'">
 	 rules['formMap.<xsl:value-of select="lowerName" />'] = {<xsl:value-of select="columnDef" />:true};
 	 </xsl:if>
 	 </xsl:if>
 	 </xsl:when>
 	 <xsl:otherwise>
	 <xsl:if test="requried = 'true'">
 	 rules['formMap.<xsl:value-of select="lowerName" />'] = {required:true,<xsl:value-of select="columnDef" />:<xsl:value-of select="format" />};
 	 </xsl:if>
 	 <xsl:if test="requried != 'true'">
 	 rules['formMap.<xsl:value-of select="lowerName" />'] = {<xsl:value-of select="columnDef" />:<xsl:value-of select="format" />};
 	 </xsl:if>
 	 </xsl:otherwise>
 	 </xsl:choose>
 	 </xsl:if>
 	 </xsl:for-each>
 	  	 
	 var cfg = {
		backIndex : '/<xsl:value-of select="metadata/projectName" />/<xsl:value-of select="metadata/moduleName" />/<xsl:value-of select="metadata/tables/table/beanName" />/index.do'
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
	    //,requiredErrorHtml : '<![CDATA[<span style="font-weight:bold; color:#F00;">&nbsp;*</span>]]>'
	 };
	 var <xsl:value-of select="metadata/tables/table/beanName" />Merger = new ESCoder.Merger(cfg);
	 <xsl:value-of select="metadata/tables/table/beanName" />Merger.start();
 });
	</xsl:template>
</xsl:stylesheet>