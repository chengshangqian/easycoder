package ${metadata.packageName}.${metadata.moduleName}.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientCallback;

import com.gzdec.framework.dao.SqlMapBaseDao;
import com.gzdec.framework.page.Pagination;
import com.ibatis.sqlmap.client.SqlMapExecutor;

/**
 * @author ³ÉÉÐÇ«
 */
public class ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTDao extends SqlMapBaseDao{
	/**
	 * Query List
	 * @param valueMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> findAll(Map<String,Object> to){
		return this.queryForList("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.query", to);
	}
	
	/**
	 * Query Page List
	 * @param valueMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> findByPage(Map<String,Object> to,Pagination pagination){
		return this.queryForList("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.query", to, pagination);
	}
	
	/**
	 * Get A Record
	 * @param to
	 * @return
	 */
    @SuppressWarnings("unchecked")	 
	public Map<String,Object> find(Map<String,Object> to){
		return (Map<String,Object>)this.queryForObject("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.query", to);
	}
	
	/**
	 * @deprecated
	 * replace by "add" method
	 *
	 * Creating
	 * @param to
	 * @return
	 */
	public int create(Map<String,Object> to){
		try{
			this.insert("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.create", to);
			return 1;
		}catch(Exception ex){
			System.err.println("Add Error : ");
			ex.printStackTrace();
		}
		return -1;
	}
	
	/**
	 * @deprecated
	 * replace by "edit" method
	 *
	 * Modify
	 * @param to
	 * @return
	 */
	public int modify(Map<String,Object> to){
		try{
			return this.update("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.modify", to);
		}catch(Exception ex){
			System.err.println("Modify Error : ");
			ex.printStackTrace();
		}
		return -1;
	}
	
	/**
	 * @deprecated
	 * replace by "delete" method
	 *
	 * Deleting
	 * @param to
	 * @return
	 */
	public int remove(Map<String,Object> to){
		try{
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			list.add(to);
			return this.remove(list);
		}catch(Exception ex){
			System.err.println("Delete Error : ");
			ex.printStackTrace();
		}
		return -1;
	}
	
	/**
	 * @deprecated
	 * replace by "delete<List>" method 
	 *
	 * Deleting List
	 * @param list
	 * @return
	 */
	public int remove(List<Map<String,Object>> list){
		int count = 0;
		if(null == list || list.size() <= 0){
			return count;
		}
		for(int i = 0; i < list.size(); i++){
		    Map<String,Object> to = list.get(i);
			count += this.delete("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.remove", to);
		}
		return count;
	}

	/**
	 * Add
	 * @param to
	 * @return
	 */
	public Object add(Map<String,Object> to){
		return this.insert("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.create", to);
	}
	
	/**
	 * Edit
	 * @param to
	 * @return
	 */
	public long edit(Map<String,Object> to){
        	return this.update("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.modify", to);
	}
	
	/**
	 * Delete
	 * @param to
	 * @return
	 */
	public long delete(Map<String,Object> to){
		return this.delete("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.remove", to);
	}
	
	/**
	 * Batch Add
	 * @param list
	 */
	public void add(final List<Map<String,Object>> list) {
		
		 this.execute(new SqlMapClientCallback() {

			public Object doInSqlMapClient(SqlMapExecutor executor)
					throws SQLException {
				
				executor.startBatch();
				
				Object[] count = null;
				
				if(null == list || list.size() <= 0){
					return count;
				}
				
				count = new Object[list.size()];
				
				for(int i = 0; i < list.size(); i++){
				    Map<String,Object> to = list.get(i);
					count[i] = executor.insert("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.create", to);
				}
				
				executor.executeBatch();
				
				return count;
			}
		});
		 
	}
	
	/**
	 * Batch Edit
	 * @param list
	 */
	public void edit(final List<Map<String,Object>> list) {
		
		this.execute(new SqlMapClientCallback() {

			public Object doInSqlMapClient(SqlMapExecutor executor)
					throws SQLException {
				
				executor.startBatch();
				
				long count = 0;
				
				if(null == list || list.size() <= 0){
					return Long.valueOf(count);
				}
				
				for(int i = 0; i < list.size(); i++){
				    Map<String,Object> to = list.get(i);
					count += executor.update("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.modify", to);
				}
				
				executor.executeBatch();
				
				return Long.valueOf(count);
			}
		});
		
	}
	
	/**
	 * Batch Delete
	 * @param list
	 */
	public void delete(final List<Map<String,Object>> list) {
		
		this.execute(new SqlMapClientCallback() {

			public Object doInSqlMapClient(SqlMapExecutor executor)
					throws SQLException {
				
				executor.startBatch();
				
				long count = 0;
				
				if(null == list || list.size() <= 0){
					return Long.valueOf(count);
				}
				
				for(int i = 0; i < list.size(); i++){
				    Map<String,Object> to = list.get(i);
					count += executor.delete("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.remove", to);
				}
				
				executor.executeBatch();
				
				return Long.valueOf(count);
			}
		});
		
	}
}