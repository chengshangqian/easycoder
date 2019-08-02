package ${metadata.packageName}.${metadata.moduleName}.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import ${metadata.packageName}.${metadata.moduleName}.dao.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao;
import ${metadata.packageName}.${metadata.moduleName}.service.inter.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTService;
import ${metadata.packageName}.util.AppUtil;

import com.gzdec.framework.page.Pagination;
import com.gzdec.framework.util.UniqueIDGenerator;

/**
 * @author 成尚谦
 */
public class ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTServiceImpl implements ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTService{

	/**
	 * 需要格式化的DATE类型字段列表
	 */
	private List<String> dateColumns;
	
	/**
	 * 需要格式化的NUMBER类型字段列表
	 */	
	private List<String> numberColumns;
	
	/**
	 * 使用模糊查询的字段列表
	 */	
	private List<String> fuzzyQueryColumns;

	private ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao;
	
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao get${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao() {
		return ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao;
	}

	public void set${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao(${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao) {
		this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao = ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao;
	}

	public void setDateColumns(List<String> dateColumns) {
		this.dateColumns = dateColumns;
	}
	
	public List<String> getDateColumns() {
		return this.dateColumns;
	}

	public void setNumberColumns(List<String> numberColumns) {
		this.numberColumns = numberColumns;
	}
	
	public List<String> getNumberColumns() {
		return this.numberColumns;
	}	

	public void setFuzzyQueryColumns(List<String> fuzzyQueryColumns) {
		this.fuzzyQueryColumns = fuzzyQueryColumns;
	}
	
	public List<String> getFuzzyQueryColumns() {
		return this.fuzzyQueryColumns;
	}

	public Map<String,Object> find(Map<String, String> valueMap) {
		return this.findByFilter(valueMap);
	}
	
	public Map<String,Object> findById(Map<String, String> valueMap) {
		String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)} = StringUtils.trimToEmpty(valueMap.get("${metadata.tables[0].primaryKey}"));
		if("".equals(${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)})){
			return new HashMap<String,Object>();
		}
		return this.findByFilter(valueMap);
	}
	
	public Map<String,Object> findByFilter(Map<String, String> valueMap) {
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.find(this.mapToTo(AppUtil.fitFuzzyQuery(valueMap,this.fuzzyQueryColumns)));
	}

	public List<Map<String,Object>> findAll(Map<String, String> valueMap) {
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.findAll(this.mapToTo(AppUtil.fitFuzzyQuery(valueMap,this.fuzzyQueryColumns)));
	}

	public List<Map<String,Object>> findByPage(Map<String, String> valueMap,
			Pagination pagination) {
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.findByPage(this.mapToTo(AppUtil.fitFuzzyQuery(valueMap,this.fuzzyQueryColumns)), pagination);
	}
	
	/**
	 * @deprecated
	 * replace by "add" method 
	 * 
	 * Creating
	 * @param valueMap
	 * @return
	 */
	public int create(Map<String, String> valueMap) {
	    String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)} = StringUtils.trimToEmpty(valueMap.get("${metadata.tables[0].primaryKey}"));
	    if("".equals(${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)})){
			valueMap.put("${metadata.tables[0].primaryKey}", UniqueIDGenerator.getUUID());
		}
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.create(this.mapToTo(valueMap));
	}
	
	/**
	 * Creating
	 * @param valueMap
	 * @return
	 */
	public Map<String,Object> returnCreate(Map<String,String> valueMap){
	    String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)} = StringUtils.trimToEmpty(valueMap.get("${metadata.tables[0].primaryKey}"));
	    if("".equals(${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)})){
			valueMap.put("${metadata.tables[0].primaryKey}", UniqueIDGenerator.getUUID());
		}
		
		Map<String,Object> to = this.mapToTo(valueMap);
		int i = this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.create(to);
	    if(i == 0){
	    	to.clear();
	    }		
		return to;
	}		

	/**
	 * @deprecated
	 * replace by "edit" method 
	 * 
	 * Modifing
	 * @param valueMap
	 * @return
	 */
	public int modify(Map<String, String> valueMap) {
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.modify(this.mapToTo(valueMap));
	}

	/**
	 * Modifing
	 * @param valueMap
	 * @return
	 */
	public Map<String,Object> returnModify(Map<String,String> valueMap) {
	    Map<String,Object> to = this.mapToTo(valueMap);
	    int i = this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.modify(to);
	    if(i == 0){
	    	to.clear();
	    }
		return to;
	}

	/**
	 * @deprecated
	 * replace by "delete" method 
	 * 
	 * Deleting
	 * @param valueMap
	 * @return
	 */
	public int remove(Map<String, String> valueMap) {
		String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}s = StringUtils.trimToEmpty(valueMap.get("delete${MROUtil.tableNameToClassName(metadata.tables[0].primaryKey)}"));
		if(!"".equals(${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}s)){
			String[] ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr = ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}s.split(", ");
			if(null != ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr && ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr.length > 0){
				List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
				for(int i = 0; i < ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr.length; i++){
					String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)} = ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr[i];
					Map<String, String> toMap = new HashMap<String, String>();
					toMap.put("${metadata.tables[0].primaryKey}", ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)});
					list.add(this.mapToTo(toMap));
				}
				return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.remove(list);
			}
		}
		return -1;
	}

	/**
	 * Add
	 * @param valueMap
	 * @return Object
	 */		
	public Object add(Map<String, String> valueMap) {
	    String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)} = StringUtils.trimToEmpty(valueMap.get("${metadata.tables[0].primaryKey}"));
	    if("".equals(${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)})){
			valueMap.put("${metadata.tables[0].primaryKey}", UniqueIDGenerator.getUUID());
		}
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.add(this.mapToTo(valueMap));
	}	

	/**
	 * Edit
	 * @param valueMap
	 * @return long
	 */		
	public long edit(Map<String, String> valueMap) {
		return this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.edit(this.mapToTo(valueMap));
	}

	/**
	 * Delete
	 * @param valueMap
	 */	
	public void delete(Map<String, String> valueMap) {
		String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}s = StringUtils.trimToEmpty(valueMap.get("delete${MROUtil.tableNameToClassName(metadata.tables[0].primaryKey)}"));
		if(!"".equals(${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}s)){
			String[] ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr = ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}s.split(", ");
			if(null != ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr && ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr.length > 0){
				
				if(${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr.length == 1){
					Map<String, String> map = new HashMap<String, String>();
					map.put("${metadata.tables[0].primaryKey}", ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr[0]);
					this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.delete(this.mapToTo(map));
				}
				
				/**
				 * Batch Delete
				 */
				@SuppressWarnings("unchecked")
				Map<String,String>[] valueMaps = new HashMap[${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr.length];
				for(int i = 0; i < ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr.length; i++){
					String ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)} = ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}Arr[i];
					Map<String, String> sMap = new HashMap<String, String>();
					sMap.put("${metadata.tables[0].primaryKey}", ${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)});
					valueMaps[i] = sMap;
				}
				this.delete(valueMaps);
			}
		}
		
	}
	
	/**
	 * Batch Add
	 * @param valueMaps
	 */
	public void add(Map<String, String>[] valueMaps) {
		final List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(Map<String, String> valueMap : valueMaps){
			list.add(this.mapToTo(valueMap));
		}
		
		this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.add(list);
	}

	/**
	 * Batch Edit
	 * @param valueMaps
	 */	
	public void edit(Map<String, String>[] valueMaps) {
		final List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(Map<String, String> valueMap : valueMaps){
			list.add(this.mapToTo(valueMap));
		}
		
		this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.edit(list);
	}
	
	/**
	 * Batch Delete
	 * @param valueMaps
	 */
	public void delete(Map<String, String>[] valueMaps) {
		final List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(Map<String, String> valueMap : valueMaps){
			list.add(this.mapToTo(valueMap));
		}
		
		this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}RESTDao.delete(list);
	}	
	
	public Map<String,Object> mapToTo(Map<String, String> valueMap){
		Map<String, Object> to = new HashMap<String, Object>();
		
		if(null != valueMap){
			to = new HashMap<String, Object>();
			Set<Map.Entry<String, String>> setEntry = valueMap.entrySet();
			Iterator<Map.Entry<String, String>> it = setEntry.iterator();

			while (it.hasNext()) {
				Map.Entry<String, String> entry = it.next();
				String key = entry.getKey();
				Object value = entry.getValue();
				
				/**
				 * 处理日期类型和数字类型；
				 * 如果有其它表的日期类型字段，建议在SQL中处理。
				 */
				if(null != this.dateColumns || null != this.numberColumns){
					String stringValue = StringUtils.trimToEmpty(entry.getValue());
					if (!"".equals(stringValue)) {
						if(null != this.dateColumns && !this.dateColumns.isEmpty()){
							for(String dateColumn : this.dateColumns){
								if(dateColumn.equals(key)){
									try {
									    value = AppUtil.toTimestamp(stringValue);
									}
									catch (ParseException e) {
										e.printStackTrace();
									}
									break;
								}	
							}							
						}
						if(null != this.numberColumns && !this.numberColumns.isEmpty()){
							for(String numberColumn : this.numberColumns){
								if(numberColumn.equals(key)){
									value = NumberUtils.createNumber(stringValue);
									break;
								}
							}
						}					
					}
				}
				
				to.put(key, value);
			} 			
		}
		
		return to;
	}
	
}