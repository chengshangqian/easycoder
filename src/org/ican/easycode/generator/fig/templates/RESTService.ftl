package ${metadata.packageName}.${metadata.moduleName}.service.inter;

import java.util.List;
import java.util.Map;

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
	public List<Map<String,Object>> findAll(Map<String,String> valueMap);
	
	/**
	 * Query Page List
	 * @param valueMap
	 * @return
	 */
	public List<Map<String,Object>> findByPage(Map<String,String> valueMap,Pagination pagination);
	
	/**
	 * Get A Record
	 * @param valueMap
	 * @return
	 */
	public Map<String,Object> find(Map<String,String> valueMap);
	
	/**
	 * Get A Record
	 * @param valueMap
	 * @return
	 */
	public Map<String,Object> findById(Map<String,String> valueMap);
	
	/**
	 * Get A Record
	 * @param valueMap
	 * @return
	 */
	public Map<String,Object> findByFilter(Map<String,String> valueMap);
	
	/**
	 * @deprecated
	 * replace by "add" method 
	 * 
	 * Creating
	 * @param valueMap
	 * @return
	 */
	public int create(Map<String,String> valueMap);	
	
	/**
	 * @deprecated
	 * replace by "edit" method 
	 * 
	 * Modifing
	 * @param valueMap
	 * @return
	 */
	public int modify(Map<String,String> valueMap);	
	
	/**
	 * @deprecated
	 * replace by "delete" method 
	 * 
	 * Deleting
	 * @param valueMap
	 * @return
	 */
	public int remove(Map<String,String> valueMap);
	
	/**
	 * Add
	 * @param valueMap
	 * @return
	 */	
	public Object add(Map<String, String> valueMap);

	/**
	 * Edit
	 * @param valueMap
	 * @return
	 */	
	public long edit(Map<String, String> valueMap);

	/**
	 * Deleting
	 * @param valueMap
	 * @return
	 */	
	public void delete(Map<String, String> valueMap);	
	
	/**
	 * Batch Add
	 * @param list
	 */
	public void add(final Map<String, String>[] valueMaps);
	
	/**
	 * Batch Edit
	 * @param list
	 */
	public void edit(final Map<String, String>[] valueMaps);
	
	/**
	 * Batch Delete
	 * @param list
	 */
	public void delete(final Map<String, String>[] valueMaps);
	
	/**
	 * Map mapping to To
	 * @param valueMap
	 * @return
	 */	
	public Map<String,Object> mapToTo(Map<String,String> valueMap);

}