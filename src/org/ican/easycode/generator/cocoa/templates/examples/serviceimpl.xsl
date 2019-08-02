<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
package <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.service.impl;

import <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.dao.<xsl:value-of select="metadata/tables/table/className" />Dao;
import <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.service.inter.<xsl:value-of select="metadata/tables/table/className" />Service;

/**
 * @author s2sicoder
 */
public class <xsl:value-of select="metadata/tables/table/className" />ServiceImpl extends <xsl:value-of select="metadata/tables/table/className" />RESTServiceImpl implements <xsl:value-of select="metadata/tables/table/className" />Service{
	private <xsl:value-of select="metadata/tables/table/className" />Dao <xsl:value-of select="metadata/tables/table/beanName" />Dao;

	public <xsl:value-of select="metadata/tables/table/className" />Dao get<xsl:value-of select="metadata/tables/table/className" />Dao() {
		return <xsl:value-of select="metadata/tables/table/beanName" />Dao;
	}

	public void set<xsl:value-of select="metadata/tables/table/className" />Dao(<xsl:value-of select="metadata/tables/table/className" />Dao <xsl:value-of select="metadata/tables/table/beanName" />Dao) {
		this.<xsl:value-of select="metadata/tables/table/beanName" />Dao = <xsl:value-of select="metadata/tables/table/beanName" />Dao;
	}
}
	</xsl:template>
</xsl:stylesheet>