<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" encoding="GBK" />
	<xsl:template match="/">
    <xsl:variable name="package">
    <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />
    </xsl:variable>	
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xmlns:tx="http://www.springframework.org/schema/tx"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.0.xsd
           http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-2.0.xsd
           http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-2.0.xsd">
    <xsl:for-each select="metadata/tables/table">
<xsl:text>
</xsl:text>    
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text><xsl:element name="bean"><xsl:attribute name="id"><xsl:value-of select="beanName" />RESTDao</xsl:attribute><xsl:attribute name="class"><xsl:copy-of select="$package" />.dao.<xsl:value-of select="className" />RESTDao</xsl:attribute><xsl:attribute name="autowire">byName</xsl:attribute></xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text><xsl:element name="bean"><xsl:attribute name="id"><xsl:value-of select="beanName" />Dao</xsl:attribute><xsl:attribute name="class"><xsl:copy-of select="$package" />.dao.<xsl:value-of select="className" />Dao</xsl:attribute><xsl:attribute name="autowire">byName</xsl:attribute></xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text><xsl:element name="bean">
    <xsl:attribute name="id"><xsl:value-of select="beanName" />Service</xsl:attribute>
    <xsl:attribute name="class"><xsl:copy-of select="$package" />.service.impl.<xsl:value-of select="className" />ServiceImpl</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text><xsl:element name="property"><xsl:attribute name="name"><xsl:value-of select="beanName" />Dao</xsl:attribute><xsl:attribute name="ref"><xsl:value-of select="beanName" />Dao</xsl:attribute></xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text><xsl:element name="property"><xsl:attribute name="name"><xsl:value-of select="beanName" />RESTDao</xsl:attribute><xsl:attribute name="ref"><xsl:value-of select="beanName" />RESTDao</xsl:attribute></xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text></xsl:element>
<xsl:text>
</xsl:text>        
    </xsl:for-each>
</beans>
	</xsl:template>
</xsl:stylesheet>