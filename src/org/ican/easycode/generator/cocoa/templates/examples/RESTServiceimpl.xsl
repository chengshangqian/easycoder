<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
package <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.dao.<xsl:value-of select="metadata/tables/table/className" />RESTDao;
import <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.service.inter.<xsl:value-of select="metadata/tables/table/className" />RESTService;
import <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.to.<xsl:value-of select="metadata/tables/table/className" />To;
import <xsl:value-of select="metadata/packageName" />.util.AppUtil;

import com.gzdec.framework.page.Pagination;
import com.gzdec.framework.util.UniqueIDGenerator;

/**
 * @author s2sicoder
 */
public class <xsl:value-of select="metadata/tables/table/className" />RESTServiceImpl implements <xsl:value-of select="metadata/tables/table/className" />RESTService{
	private <xsl:value-of select="metadata/tables/table/className" />RESTDao <xsl:value-of select="metadata/tables/table/beanName" />RESTDao;
	
	public <xsl:value-of select="metadata/tables/table/className" />RESTDao get<xsl:value-of select="metadata/tables/table/className" />RESTDao() {
		return <xsl:value-of select="metadata/tables/table/beanName" />RESTDao;
	}

	public void set<xsl:value-of select="metadata/tables/table/className" />RESTDao(<xsl:value-of select="metadata/tables/table/className" />RESTDao <xsl:value-of select="metadata/tables/table/beanName" />RESTDao) {
		this.<xsl:value-of select="metadata/tables/table/beanName" />RESTDao = <xsl:value-of select="metadata/tables/table/beanName" />RESTDao;
	}

	public int create(Map&lt;String, String&gt; valueMap) {
		valueMap.put("<xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />", UniqueIDGenerator.getUUID());
		return this.<xsl:value-of select="metadata/tables/table/beanName" />RESTDao.create(this.mapToTo(valueMap));
	}

	public <xsl:value-of select="metadata/tables/table/className" />To find(Map&lt;String, String&gt; valueMap) {
		return this.findByFilter(valueMap);
	}
	
	public <xsl:value-of select="metadata/tables/table/className" />To findById(Map&lt;String, String&gt; valueMap) {
		String <xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /> = StringUtils.trimToEmpty(valueMap.get("<xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />"));
		if("".equals(<xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />)){
			return new <xsl:value-of select="metadata/tables/table/className" />To();
		}
		return this.findByFilter(valueMap);
	}
	
	public <xsl:value-of select="metadata/tables/table/className" />To findByFilter(Map&lt;String, String&gt; valueMap) {
		return this.<xsl:value-of select="metadata/tables/table/beanName" />RESTDao.find(this.mapToTo(valueMap));
	}

	public List&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt; findAll(Map&lt;String, String&gt; valueMap) {
		return this.<xsl:value-of select="metadata/tables/table/beanName" />RESTDao.findAll(this.mapToTo(valueMap));
	}

	public List&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt; findByPage(Map&lt;String, String&gt; valueMap,
			Pagination pagination) {
		return this.<xsl:value-of select="metadata/tables/table/beanName" />RESTDao.findByPage(this.mapToTo(valueMap), pagination);
	}

	public int modify(Map&lt;String, String&gt; valueMap) {
		return this.<xsl:value-of select="metadata/tables/table/beanName" />RESTDao.modify(this.mapToTo(valueMap));
	}

	public int remove(Map&lt;String, String&gt; valueMap) {
		String <xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />s = StringUtils.trimToEmpty(valueMap.get("delete<xsl:value-of select="metadata/tables/table/primaryKey/upperKey" />"));
		if(!"".equals(<xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />s)){
			String[] <xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />Arr = <xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />s.split(", ");
			if(null != <xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />Arr &amp;&amp; <xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />Arr.length &gt; 0){
				List&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt; list = new ArrayList&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt;();
				for(int i = 0; i &lt; <xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />Arr.length; i++){
					String <xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" /> = <xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />Arr[i];
					Map&lt;String, String&gt; toMap = new HashMap&lt;String, String&gt;();
					toMap.put("<xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />", <xsl:value-of select="metadata/tables/table/primaryKey/lowerKey" />);
					toMap.put("isDeleted", "Y");
					list.add(this.mapToTo(toMap));
				}
				return this.<xsl:value-of select="metadata/tables/table/beanName" />RESTDao.remove(list);
			}
		}
		return -1;
	}
	
	public <xsl:value-of select="metadata/tables/table/className" />To mapToTo(Map&lt;String, String&gt; valueMap){
		<xsl:value-of select="metadata/tables/table/className" />To to = new <xsl:value-of select="metadata/tables/table/className" />To();
		
		<xsl:for-each select="metadata/tables/table/columns/column">
		String <xsl:value-of select="lowerName" /> = StringUtils.trimToEmpty(valueMap.get("<xsl:value-of select="lowerName" />"));
		</xsl:for-each>
		
		<xsl:for-each select="metadata/tables/table/columns/column">
			<xsl:choose>
			<xsl:when test="standardType = 'DATE'">
		if (!"".equals(<xsl:value-of select="lowerName" />)) {
			try {
				to.set<xsl:value-of select="upperName" />(AppUtil.toTimestamp(<xsl:value-of select="lowerName" />));
			}
			catch (ParseException e) {
				e.printStackTrace();
			}
		}				
			</xsl:when>
			<xsl:when test="standardType = 'NUMBER'">
	    if(!"".equals(<xsl:value-of select="lowerName" />)){
		    to.set<xsl:value-of select="upperName" />(NumberUtils.createNumber(<xsl:value-of select="lowerName" />));
	    }				
			</xsl:when>			
			<xsl:otherwise>
	    if(!"".equals(<xsl:value-of select="lowerName" />)){
		    to.set<xsl:value-of select="upperName" />(<xsl:value-of select="lowerName" />);
	    }	
			</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>

		return to;
	}
}
	</xsl:template>
</xsl:stylesheet>