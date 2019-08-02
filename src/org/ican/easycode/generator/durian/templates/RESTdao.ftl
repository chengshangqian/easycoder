package ${metadata.packageName}.${metadata.moduleName}.dao;

import java.util.ArrayList;
import java.util.List;

import com.gzdec.framework.dao.SqlMapBaseDao;
import com.gzdec.framework.page.Pagination;
import ${metadata.packageName}.${metadata.moduleName}.to.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To;

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
	public List<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To> findAll(${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To to){
		return this.queryForList("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.query", to);
	}
	
	/**
	 * Query Page List
	 * @param valueMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To> findByPage(${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To to,Pagination pagination){
		return this.queryForList("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.query", to, pagination);
	}
	
	/**
	 * Get A Record
	 * @param to
	 * @return
	 */
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To find(${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To to){
		return (${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To)this.queryForObject("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.query", to);
	}
	
	/**
	 * Creating
	 * @param to
	 * @return
	 */
	public int create(${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To to){
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
	 * Modify
	 * @param to
	 * @return
	 */
	public int modify(${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To to){
		try{
			return this.update("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.modify", to);
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
	public int remove(${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To to){
		try{
			List<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To> list = new ArrayList<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To>();
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
	public int remove(List<${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To> list){
		int count = 0;
		if(null == list || list.size() <= 0){
			return count;
		}
		for(int i = 0; i < list.size(); i++){
		    ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To to = list.get(i);
			count += this.delete("${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}.remove", to);
		}
		return count;
	}
}