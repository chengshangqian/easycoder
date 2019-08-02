<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"	
	omit-xml-declaration="yes" 
	doctype-system="http://ibatis.apache.org/dtd/sql-map-2.dtd"
	doctype-public="-//ibatis.apache.org//DTD SQL Map 2.0//EN"  encoding="GBK" />
	<xsl:template match="/">
    <xsl:variable name="package"><xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" /></xsl:variable>
    <xsl:variable name="namespaces"><xsl:value-of select="metadata/projectName" />.<xsl:value-of select="metadata/moduleName" /></xsl:variable>
    <xsl:variable name="primaryColumnKey"><xsl:value-of select="metadata/tables/table/primaryKey/columnKey" /></xsl:variable>
    <xsl:variable name="primaryLowerKey"><xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /></xsl:variable>
<xsl:element name="sqlMap">
<xsl:attribute name="namespace"><xsl:value-of select="$namespaces" />.<xsl:value-of select="metadata/tables/table/beanName" /></xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>
<xsl:element name="typeAlias">
<xsl:attribute name="alias"><xsl:value-of select="metadata/tables/table/beanName" />To</xsl:attribute>
<xsl:attribute name="type"><xsl:value-of select="$package" />.to.<xsl:value-of select="metadata/tables/table/className" />To</xsl:attribute>
</xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>
<xsl:element name="resultMap">
<xsl:attribute name="id"><xsl:value-of select="metadata/tables/table/beanName" />Result</xsl:attribute>
<xsl:attribute name="class"><xsl:value-of select="metadata/tables/table/beanName" />To</xsl:attribute>
<xsl:for-each select="metadata/tables/table/columns/column">
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text>
<xsl:element name="result"><xsl:attribute name="property"><xsl:value-of select="lowerName" /></xsl:attribute><xsl:attribute name="column"><xsl:value-of select="columnName" /></xsl:attribute></xsl:element>
</xsl:for-each>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text></xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>
<xsl:element name="select">
<xsl:attribute name="id">query</xsl:attribute>
<xsl:attribute name="parameterClass"><xsl:value-of select="metadata/tables/table/beanName" />To</xsl:attribute>
<xsl:attribute name="resultMap"><xsl:value-of select="metadata/tables/table/beanName" />Result</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>SELECT <xsl:for-each select="metadata/tables/table/columns/column"><xsl:variable name="index" select="position()"/><xsl:if test="$index &gt; 1">,</xsl:if><xsl:value-of select="columnName" /></xsl:for-each>
<xsl:text>  </xsl:text>FROM <xsl:value-of select="metadata/tables/table/upperTableName" /> WHERE 1 = 1
<xsl:text>  </xsl:text>
<dynamic prepend="">
<xsl:for-each select="metadata/tables/table/columns/column">
<xsl:if test="lowerName != 'isDeleted'">
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text>
<xsl:element name="isNotNull">
<xsl:attribute name="property"><xsl:value-of select="lowerName" /></xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text>
<xsl:element name="isNotEmpty"><xsl:attribute name="property"><xsl:value-of select="lowerName" /></xsl:attribute><xsl:attribute name="prepend">AND</xsl:attribute><xsl:text> </xsl:text><xsl:value-of select="columnName" /><xsl:choose><xsl:when test="isQuery = 'true' and (standardType = 'VARCHAR')"> like '%$<xsl:value-of select="lowerName" />$%'</xsl:when><xsl:otherwise> = #<xsl:value-of select="lowerName" />#</xsl:otherwise></xsl:choose><xsl:text> </xsl:text></xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
</xsl:if>
</xsl:for-each>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></dynamic>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text></xsl:element>


<xsl:text>
</xsl:text>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>
<xsl:element name="insert">
<xsl:attribute name="id">create</xsl:attribute>
<xsl:attribute name="parameterClass"><xsl:value-of select="metadata/tables/table/beanName" />To</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>INSERT INTO <xsl:value-of select="metadata/tables/table/upperTableName" /> (<xsl:value-of select="$primaryColumnKey" />
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>
<dynamic prepend="">
<xsl:for-each select="metadata/tables/table/columns/column">
<xsl:if test="lowerName != $primaryLowerKey">
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text>
<xsl:element name="isNotNull">
<xsl:attribute name="property"><xsl:value-of select="lowerName" /></xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text>
<xsl:element name="isNotEmpty"><xsl:attribute name="property"><xsl:value-of select="lowerName" /></xsl:attribute><xsl:attribute name="prepend">,</xsl:attribute><xsl:value-of select="columnName" /></xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
</xsl:if>
</xsl:for-each>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>
</dynamic>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>) VALUES (#<xsl:value-of select="$primaryLowerKey" />#
<xsl:text>  </xsl:text>
<dynamic prepend="">
<xsl:for-each select="metadata/tables/table/columns/column">
<xsl:if test="lowerName != $primaryLowerKey">
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text>
<xsl:element name="isNotNull">
<xsl:attribute name="property"><xsl:value-of select="lowerName" /></xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text>
<xsl:element name="isNotEmpty"><xsl:attribute name="property"><xsl:value-of select="lowerName" /></xsl:attribute><xsl:attribute name="prepend">,</xsl:attribute>#<xsl:value-of select="lowerName" />#</xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
</xsl:if>
</xsl:for-each>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>
</dynamic>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>)
<xsl:text>  </xsl:text></xsl:element>


<xsl:text>
</xsl:text>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>
<xsl:element name="update">
<xsl:attribute name="id">modify</xsl:attribute>
<xsl:attribute name="parameterClass"><xsl:value-of select="metadata/tables/table/beanName" />To</xsl:attribute>
<xsl:text>
</xsl:text><xsl:text>  </xsl:text>UPDATE <xsl:value-of select="metadata/tables/table/upperTableName" /> SET <xsl:value-of select="$primaryColumnKey" /> = #<xsl:value-of select="$primaryLowerKey" />#
<xsl:text>  </xsl:text>
<dynamic prepend="">
<xsl:for-each select="metadata/tables/table/columns/column">
<xsl:if test="lowerName != $primaryLowerKey">
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text>
<xsl:element name="isNotNull">
<xsl:attribute name="property"><xsl:value-of select="lowerName" /></xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>        </xsl:text>
<xsl:element name="isNotEmpty"><xsl:attribute name="property"><xsl:value-of select="lowerName" /></xsl:attribute><xsl:attribute name="prepend">,</xsl:attribute><xsl:value-of select="columnName" /> = #<xsl:value-of select="lowerName" />#</xsl:element>
<xsl:text>
</xsl:text>
<xsl:text>    </xsl:text></xsl:element>
</xsl:if>
</xsl:for-each>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>	
</dynamic>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>WHERE <xsl:value-of select="$primaryColumnKey" /> = #<xsl:value-of select="$primaryLowerKey" />#
<xsl:text>  </xsl:text></xsl:element>


<xsl:text>
</xsl:text>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>
<xsl:element name="update">
<xsl:attribute name="id">remove</xsl:attribute>
<xsl:attribute name="parameterClass"><xsl:value-of select="metadata/tables/table/beanName" />To</xsl:attribute>
<xsl:text>
</xsl:text>
<xsl:text>  </xsl:text>DELETE FROM <xsl:value-of select="metadata/tables/table/upperTableName" /> WHERE <xsl:value-of select="$primaryColumnKey" /> = #<xsl:value-of select="$primaryLowerKey" />#
<xsl:text>  </xsl:text></xsl:element>


</xsl:element>
	</xsl:template>
</xsl:stylesheet>