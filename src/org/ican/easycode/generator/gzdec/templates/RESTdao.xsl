<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
package <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.dao;

import java.util.ArrayList;
import java.util.List;

import com.gzdec.framework.dao.SqlMapBaseDao;
import com.gzdec.framework.page.Pagination;
import <xsl:value-of select="metadata/packageName" />.<xsl:value-of select="metadata/moduleName" />.to.<xsl:value-of select="metadata/tables/table/className" />To;

/**
 * @author 成尚谦
 */
public class <xsl:value-of select="metadata/tables/table/className" />RESTDao extends SqlMapBaseDao{
	/**
	 * Query List
	 * @param valueMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt; findAll(<xsl:value-of select="metadata/tables/table/className" />To to){
		return this.queryForList("<xsl:value-of select="metadata/projectName" />.<xsl:value-of select="metadata/moduleName" />.<xsl:value-of select="metadata/tables/table/beanName" />.query", to);
	}
	
	/**
	 * Query Page List
	 * @param valueMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt; findByPage(<xsl:value-of select="metadata/tables/table/className" />To to,Pagination pagination){
		return this.queryForList("<xsl:value-of select="metadata/projectName" />.<xsl:value-of select="metadata/moduleName" />.<xsl:value-of select="metadata/tables/table/beanName" />.query", to, pagination);
	}
	
	/**
	 * Get A Record
	 * @param to
	 * @return
	 */
	public <xsl:value-of select="metadata/tables/table/className" />To find(<xsl:value-of select="metadata/tables/table/className" />To to){
		return (<xsl:value-of select="metadata/tables/table/className" />To)this.queryForObject("<xsl:value-of select="metadata/projectName" />.<xsl:value-of select="metadata/moduleName" />.<xsl:value-of select="metadata/tables/table/beanName" />.query", to);
	}
	
	/**
	 * Creating
	 * @param to
	 * @return
	 */
	public int create(<xsl:value-of select="metadata/tables/table/className" />To to){
		try{
			this.insert("<xsl:value-of select="metadata/projectName" />.<xsl:value-of select="metadata/moduleName" />.<xsl:value-of select="metadata/tables/table/beanName" />.create", to);
			return 1;
		}catch(Exception ex){
			System.err.println("Add Error : ");
			ex.printStackTrace();
		}
		return -1;
	}
	
	/**
	 * Modify
	 * @param to
	 * @return
	 */
	public int modify(<xsl:value-of select="metadata/tables/table/className" />To to){
		try{
			return this.update("<xsl:value-of select="metadata/projectName" />.<xsl:value-of select="metadata/moduleName" />.<xsl:value-of select="metadata/tables/table/beanName" />.modify", to);
		}catch(Exception ex){
			System.err.println("Modify Error : ");
			ex.printStackTrace();
		}
		return -1;
	}
	
	/**
	 * Deleting
	 * @param to
	 * @return
	 */
	public int remove(<xsl:value-of select="metadata/tables/table/className" />To to){
		try{
			List&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt; list = new ArrayList&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt;();
			list.add(to);
			return this.remove(list);
		}catch(Exception ex){
			System.err.println("Delete Error : ");
			ex.printStackTrace();
		}
		return -1;
	}
	
	/**
	 * Deleting List
	 * @param list
	 * @return
	 */
	public int remove(List&lt;<xsl:value-of select="metadata/tables/table/className" />To&gt; list){
		int count = 0;
		if(null == list || list.size() &lt;= 0){
			return count;
		}
		for(int i = 0; i &lt; list.size(); i++){
		    <xsl:value-of select="metadata/tables/table/className" />To to = list.get(i);
			count += this.delete("<xsl:value-of select="metadata/projectName" />.<xsl:value-of select="metadata/moduleName" />.<xsl:value-of select="metadata/tables/table/beanName" />.remove", to);
		}
		return count;
	}
}
	</xsl:template>
</xsl:stylesheet>