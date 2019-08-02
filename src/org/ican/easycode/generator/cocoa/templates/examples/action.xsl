<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
package <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.actions;

import <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.service.inter.<xsl:value-of select="metadata/tables/table/className" />Service;
import <xsl:value-of select="metadata/packageName" />.util.AppUtil;

import com.gzdec.framework.action.BaseAction;

/**
 * @author s2sicoder
 */
public class <xsl:value-of select="metadata/tables/table/className" />Action extends BaseAction{
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -19600611L;
	
	private <xsl:value-of select="metadata/tables/table/className" />Service <xsl:value-of select="metadata/tables/table/beanName" />Service;
	
	public <xsl:value-of select="metadata/tables/table/className" />Service get<xsl:value-of select="metadata/tables/table/className" />Service() {
		return <xsl:value-of select="metadata/tables/table/beanName" />Service;
	}
	
	public void set<xsl:value-of select="metadata/tables/table/className" />Service(<xsl:value-of select="metadata/tables/table/className" />Service <xsl:value-of select="metadata/tables/table/beanName" />Service) {
		this.<xsl:value-of select="metadata/tables/table/beanName" />Service = <xsl:value-of select="metadata/tables/table/beanName" />Service;
	}
	
	/**
	 * Index
	 * @return
	 */
	public String index(){
		this.resultList = this.<xsl:value-of select="metadata/tables/table/beanName" />Service.findByPage(this.formMap,this.pagination);
		return SUCCESS;
	}

	/**
	 * Query List
	 * @return
	 */
	public String findAll(){
		this.resultList = this.<xsl:value-of select="metadata/tables/table/beanName" />Service.findAll(this.formMap);
		return SUCCESS;
	}
	
	/**
	 * Query Page List
	 * @return
	 */
	@SuppressWarnings("unchecked") 
	public String findByPage() throws Exception{
	    this.resultMap.putAll(this.formMap);
	    <xsl:for-each select="metadata/tables/table/columns/column">
	    <xsl:variable name="index" select="0"/>
	    <xsl:if test="isQuery = 'true' and (standardType = 'DATE')">
		String <xsl:value-of select="lowerName" /> = this.formMap.get("<xsl:value-of select="lowerName" />");
		</xsl:if>		    
	    </xsl:for-each>
	    <xsl:for-each select="metadata/tables/table/columns/column">
	    <xsl:if test="isQuery = 'true' and (standardType = 'DATE')">
	    if(null != <xsl:value-of select="lowerName" /> &amp;&amp; !"".equals(<xsl:value-of select="lowerName" />.trim())){
		    this.resultMap.put("<xsl:value-of select="lowerName" />", AppUtil.toDate(<xsl:value-of select="lowerName" />));
		}
		</xsl:if>		    
	    </xsl:for-each>	    	
		this.resultList = this.<xsl:value-of select="metadata/tables/table/beanName" />Service.findByPage(this.formMap,this.pagination);
		return SUCCESS;
	}
	
	/**
	 * Ready To Create Or Modify
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String doInput(){
		this.resultMap.put("<xsl:value-of select="metadata/tables/table/beanName" />To", this.<xsl:value-of select="metadata/tables/table/beanName" />Service.findById(this.formMap));
		return SUCCESS;
	}
	
	/**
	 * Creating
	 * @return
	 */
	public String create(){
		this.<xsl:value-of select="metadata/tables/table/beanName" />Service.create(this.formMap);
		return SUCCESS;
	}
	
	/**
	 * Modifing
	 * @return
	 */
	public String modify(){
		this.<xsl:value-of select="metadata/tables/table/beanName" />Service.modify(this.formMap);
		return SUCCESS;
	}
	
	/**
	 * Deleting
	 * @return
	 */
	public String remove(){
		this.<xsl:value-of select="metadata/tables/table/beanName" />Service.remove(this.formMap);
		return SUCCESS;
	}
}
	</xsl:template>
</xsl:stylesheet>