package ${metadata.packageName}.${metadata.moduleName}.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import ${metadata.packageName}.${metadata.moduleName}.dao.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao;
import ${metadata.packageName}.${metadata.moduleName}.service.inter.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTService;
import ${metadata.packageName}.${metadata.moduleName}.to.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To;
import ${metadata.packageName}.util.AppUtil;

import com.gzdec.framework.page.Pagination;
import com.gzdec.framework.util.UniqueIDGenerator;

/**
 * @author ³ÉÉÐÇ«
 */
public class ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTServiceImpl implements ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTService{
	private ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao;
	
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao get${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao() {
		return ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao;
	}

	public void set${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao(${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao) {
		this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao = ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao;
	}

	public int create(Map<String, String> valueMap) {
	        String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)} = StringUtils.trimToEmpty(valueMap.get("${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}"));
	        if("".equals(${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)})){
			valueMap.put("${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}", UniqueIDGenerator.getUUID());
		}
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.create(this.mapToTo(valueMap));
	}

	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To find(Map<String, String> valueMap) {
		return this.findByFilter(valueMap);
	}
	
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To findById(Map<String, String> valueMap) {
		String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)} = StringUtils.trimToEmpty(valueMap.get("${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}"));
		if("".equals(${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)})){
			return new ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To();
		}
		return this.findByFilter(valueMap);
	}
	
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To findByFilter(Map<String, String> valueMap) {
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.find(this.mapToTo(valueMap));
	}

	public List<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To> findAll(Map<String, String> valueMap) {
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.findAll(this.mapToTo(valueMap));
	}

	public List<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To> findByPage(Map<String, String> valueMap,
			Pagination pagination) {
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.findByPage(this.mapToTo(valueMap), pagination);
	}

	public int modify(Map<String, String> valueMap) {
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.modify(this.mapToTo(valueMap));
	}

	public int remove(Map<String, String> valueMap) {
		String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}s = StringUtils.trimToEmpty(valueMap.get("delete${MROUtil.tableNameToClassName(metadata.tables[0].primaryKey)}"));
		if(!"".equals(${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}s)){
			String[] ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr = ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}s.split(", ");
			if(null != ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr && ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr.length > 0){
				List<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To> list = new ArrayList<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To>();
				for(int i = 0; i < ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr.length; i++){
					String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)} = ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr[i];
					Map<String, String> toMap = new HashMap<String, String>();
					toMap.put("${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}", ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)});
					list.add(this.mapToTo(toMap));
				}
				return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.remove(list);
			}
		}
		return -1;
	}
	
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To mapToTo(Map<String, String> valueMap){
		${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To to = new ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To();
		
		<#list metadata.tables[0].columns as column>
		String ${MROUtil.tableNameToBeanName(column.columnName)} = StringUtils.trimToEmpty(valueMap.get("${MROUtil.tableNameToBeanName(column.columnName)}"));
		<#switch column.standardType> 
		<#case "DATE"> 
		if (!"".equals(${MROUtil.tableNameToBeanName(column.columnName)})) {
			try {
				to.set${MROUtil.tableNameToClassName(column.columnName)}(AppUtil.toTimestamp(${MROUtil.tableNameToBeanName(column.columnName)}));
			}
			catch (ParseException e) {
				e.printStackTrace();
			}
		}
		<#break>
		<#case "NUMBER"> 
	    if(!"".equals(${MROUtil.tableNameToBeanName(column.columnName)})){
		    to.set${MROUtil.tableNameToClassName(column.columnName)}(NumberUtils.createNumber(${MROUtil.tableNameToBeanName(column.columnName)}));
	    }
		<#break>
		<#default>
	    if(!"".equals(${MROUtil.tableNameToBeanName(column.columnName)})){
		    to.set${MROUtil.tableNameToClassName(column.columnName)}(${MROUtil.tableNameToBeanName(column.columnName)});
	    }		
		</#switch>
		</#list>
		
		return to;
	}
}