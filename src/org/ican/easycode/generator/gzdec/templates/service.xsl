<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
package <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.service.inter;

/**
 * @author 成尚谦
 */
public interface <xsl:value-of select="metadata/tables/table/className" />Service extends <xsl:value-of select="metadata/tables/table/className" />RESTService{

}
	</xsl:template>
</xsl:stylesheet>