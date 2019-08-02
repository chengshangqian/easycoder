<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
package <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.service.inter;

import java.util.List;
import java.util.Map;

import <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.to.<xsl:value-of select="metadata/tables/table/className" />To;

import com.gzdec.framework.page.Pagination;

/**
 * @author 成尚谦
 */
public interface <xsl:value-of select="metadata/tables/table/className" />RESTService {

	/**
	 * Query List
	 * @param valueMap
	 * @return
	 */
	public List&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt; findAll(Map&lt;String,String&gt; valueMap);
	
	/**
	 * Query Page List
	 * @param valueMap
	 * @return
	 */
	public List&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt; findByPage(Map&lt;String,String&gt; valueMap,Pagination pagination);
	
	/**
	 * Get A Record
	 * @param valueMap
	 * @return
	 */
	public <xsl:value-of select="metadata/tables/table/className" />To find(Map&lt;String,String&gt; valueMap);
	
	/**
	 * Get A Record
	 * @param valueMap
	 * @return
	 */
	public <xsl:value-of select="metadata/tables/table/className" />To findById(Map&lt;String,String&gt; valueMap);
	
	/**
	 * Get A Record
	 * @param valueMap
	 * @return
	 */
	public <xsl:value-of select="metadata/tables/table/className" />To findByFilter(Map&lt;String,String&gt; valueMap);
	
	/**
	 * Creating
	 * @param valueMap
	 * @return
	 */
	public int create(Map&lt;String,String&gt; valueMap);	
	
	/**
	 * Modifing
	 * @param valueMap
	 * @return
	 */
	public int modify(Map&lt;String,String&gt; valueMap);	
	
	/**
	 * Deleting
	 * @param valueMap
	 * @return
	 */
	public int remove(Map&lt;String,String&gt; valueMap);
	
	/**
	 * Map mapping to To
	 * @param valueMap
	 * @return
	 */	
	public <xsl:value-of select="metadata/tables/table/className" />To mapToTo(Map&lt;String,String&gt; valueMap);

}
	</xsl:template>
</xsl:stylesheet>