package ${metadata.packageName}.${metadata.moduleName}.service.inter;

import java.util.List;
import java.util.Map;

import ${metadata.packageName}.${metadata.moduleName}.to.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To;

import com.gzdec.framework.page.Pagination;

/**
 * @author ³ÉÉÐÇ«
 */
public interface ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTService {

	/**
	 * Query List
	 * @param valueMap
	 * @return
	 */
	public List<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To> findAll(Map<String,String> valueMap);
	
	/**
	 * Query Page List
	 * @param valueMap
	 * @return
	 */
	public List<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To> findByPage(Map<String,String> valueMap,Pagination pagination);
	
	/**
	 * Get A Record
	 * @param valueMap
	 * @return
	 */
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To find(Map<String,String> valueMap);
	
	/**
	 * Get A Record
	 * @param valueMap
	 * @return
	 */
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To findById(Map<String,String> valueMap);
	
	/**
	 * Get A Record
	 * @param valueMap
	 * @return
	 */
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To findByFilter(Map<String,String> valueMap);
	
	/**
	 * Creating
	 * @param valueMap
	 * @return
	 */
	public int create(Map<String,String> valueMap);	
	
	/**
	 * Modifing
	 * @param valueMap
	 * @return
	 */
	public int modify(Map<String,String> valueMap);	
	
	/**
	 * Deleting
	 * @param valueMap
	 * @return
	 */
	public int remove(Map<String,String> valueMap);
	
	/**
	 * Map mapping to To
	 * @param valueMap
	 * @return
	 */	
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To mapToTo(Map<String,String> valueMap);

}