<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"	
	omit-xml-declaration="yes" 
	doctype-system="http://struts.apache.org/dtds/struts-2.0.dtd"
	doctype-public="-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"  encoding="GBK" />
	<xsl:template match="/">
    <xsl:variable name="actionPackage">
    <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.actions</xsl:variable>
    <xsl:variable name="project">
    <xsl:value-of select="metadata/projectName" />
    </xsl:variable>
    <xsl:variable name="module">
    <xsl:value-of select="metadata/moduleName" />
    </xsl:variable>
<struts>
<xsl:for-each select="metadata/tables/table">
<xsl:text>
</xsl:text>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text><xsl:element name="package">
<xsl:attribute name="name"><xsl:value-of select="$project" />_<xsl:value-of select="$module" />_<xsl:value-of select="beanName" /></xsl:attribute>
<xsl:attribute name="extends">struts-default</xsl:attribute>
<xsl:attribute name="namespace">/<xsl:value-of select="$project" />/<xsl:value-of select="$module" />/<xsl:value-of select="beanName" /></xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text><xsl:element name="action">
    <xsl:attribute name="name">index</xsl:attribute>
    <xsl:attribute name="method">index</xsl:attribute>
    <xsl:attribute name="class"><xsl:value-of select="$actionPackage" />.<xsl:value-of select="className" />Action</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text><xsl:element name="result"><xsl:attribute name="name">success</xsl:attribute>/jsp/<xsl:value-of select="$project" />/<xsl:value-of select="$module" />/<xsl:value-of select="lowerTableName" />_index.jsp</xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
<xsl:text>
</xsl:text>

<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text><xsl:element name="action">
    <xsl:attribute name="name">findAll</xsl:attribute>
    <xsl:attribute name="method">findAll</xsl:attribute>
    <xsl:attribute name="class"><xsl:value-of select="$actionPackage" />.<xsl:value-of select="className" />Action</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text><xsl:element name="result"><xsl:attribute name="name">success</xsl:attribute>/jsp/<xsl:value-of select="$project" />/<xsl:value-of select="$module" />/<xsl:value-of select="lowerTableName" />_index.jsp</xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
<xsl:text>
</xsl:text>

<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text><xsl:element name="action">
    <xsl:attribute name="name">findByPage</xsl:attribute>
    <xsl:attribute name="method">findByPage</xsl:attribute>
    <xsl:attribute name="class"><xsl:value-of select="$actionPackage" />.<xsl:value-of select="className" />Action</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text><xsl:element name="result"><xsl:attribute name="name">success</xsl:attribute>/jsp/<xsl:value-of select="$project" />/<xsl:value-of select="$module" />/<xsl:value-of select="lowerTableName" />_index.jsp</xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>
</xsl:text>

<xsl:text>    </xsl:text><xsl:element name="action">
    <xsl:attribute name="name">doInput</xsl:attribute>
    <xsl:attribute name="method">doInput</xsl:attribute>
    <xsl:attribute name="class"><xsl:value-of select="$actionPackage" />.<xsl:value-of select="className" />Action</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text><xsl:element name="result"><xsl:attribute name="name">success</xsl:attribute>/jsp/<xsl:value-of select="$project" />/<xsl:value-of select="$module" />/<xsl:value-of select="lowerTableName" />_input.jsp</xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
<xsl:text>
</xsl:text>

<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text><xsl:element name="action">
    <xsl:attribute name="name">create</xsl:attribute>
    <xsl:attribute name="method">create</xsl:attribute>
    <xsl:attribute name="class"><xsl:value-of select="$actionPackage" />.<xsl:value-of select="className" />Action</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text><xsl:element name="result"><xsl:attribute name="name">success</xsl:attribute><xsl:attribute name="type">redirectAction</xsl:attribute>index</xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
<xsl:text>
</xsl:text>

<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text><xsl:element name="action">
    <xsl:attribute name="name">modify</xsl:attribute>
    <xsl:attribute name="method">modify</xsl:attribute>
    <xsl:attribute name="class"><xsl:value-of select="$actionPackage" />.<xsl:value-of select="className" />Action</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text><xsl:element name="result"><xsl:attribute name="name">success</xsl:attribute><xsl:attribute name="type">redirectAction</xsl:attribute>index</xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
<xsl:text>
</xsl:text>

<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text><xsl:element name="action">
    <xsl:attribute name="name">remove</xsl:attribute>
    <xsl:attribute name="method">remove</xsl:attribute>
    <xsl:attribute name="class"><xsl:value-of select="$actionPackage" />.<xsl:value-of select="className" />Action</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text><xsl:element name="result"><xsl:attribute name="name">success</xsl:attribute><xsl:attribute name="type">redirectAction</xsl:attribute>index</xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text></xsl:element>
    </xsl:for-each>
</struts>
	</xsl:template>
</xsl:stylesheet>