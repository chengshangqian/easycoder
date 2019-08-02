<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
package <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.to;

/**
 * @author 成尚谦
 */
public class <xsl:value-of select="metadata/tables/table/className" />To {
	<xsl:for-each select="metadata/tables/table/columns/column">
	private <xsl:value-of select="javaTypeName" /><xsl:text disable-output-escaping="yes"> </xsl:text><xsl:value-of select="lowerName" />;
	</xsl:for-each>

	<xsl:for-each select="metadata/tables/table/columns/column">
	public <xsl:value-of select="javaTypeName" /> get<xsl:value-of select="upperName" />() {
		return <xsl:value-of select="lowerName" />;
	}
	public void set<xsl:value-of select="upperName" />(<xsl:value-of select="javaTypeName" /><xsl:text disable-output-escaping="yes"> </xsl:text><xsl:value-of select="lowerName" />) {
		this.<xsl:value-of select="lowerName" /> = <xsl:value-of select="lowerName" />;
	}
	</xsl:for-each>
}
	</xsl:template>
</xsl:stylesheet>