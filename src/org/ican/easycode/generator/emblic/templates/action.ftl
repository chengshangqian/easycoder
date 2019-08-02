package ${metadata.packageName}.${metadata.moduleName}.actions;

import ${metadata.packageName}.${metadata.moduleName}.service.inter.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Service;
import ${metadata.packageName}.util.AppUtil;

import com.gzdec.framework.action.BaseAction;

/**
 * @author ³ÉÉÐÇ«
 */
public class ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Action extends BaseAction{
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -19600611L;
	
	private ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Service ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service;
	
	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Service get${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Service() {
		return ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service;
	}
	
	public void set${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Service(${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Service ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service) {
		this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service = ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service;
	}
	
	/**
	 * Index
	 * @return
	 */
	public String index(){
		this.resultList = this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service.findByPage(this.formMap,this.pagination);
		return SUCCESS;
	}

	/**
	 * Query List
	 * @return
	 */
	public String findAll(){
		this.resultList = this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service.findAll(this.formMap);
		return SUCCESS;
	}
	
	/**
	 * Query Page List
	 * @return
	 */
	@SuppressWarnings("unchecked") 
	public String findByPage() throws Exception{
	    this.resultMap.putAll(this.formMap);
	    <#list metadata.tables[0].columns as column>
	    <#if column.isQuery() && column.standardType = "DATE">
	    String ${MROUtil.tableNameToBeanName(column.columnName)} = this.formMap.get("${column.columnName}");
	    if(null != ${MROUtil.tableNameToBeanName(column.columnName)} && !"".equals(${MROUtil.tableNameToBeanName(column.columnName)}.trim())){
		    this.resultMap.put("${column.columnName}", AppUtil.toDate(${MROUtil.tableNameToBeanName(column.columnName)}));
		}
	    </#if>
	    </#list>	
	        
		this.resultList = this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service.findByPage(this.formMap,this.pagination);
		return SUCCESS;
	}
	
	/**
	 * Ready To Create Or Modify
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String doInput(){
		this.resultMap.put("${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}To", this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service.findById(this.formMap));
		return SUCCESS;
	}
	
	/**
	 * Creating
	 * @return
	 */
	public String create(){
		this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service.add(this.formMap);
		return SUCCESS;
	}
	
	/**
	 * Modifing
	 * @return
	 */
	public String modify(){
		this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service.edit(this.formMap);
		return SUCCESS;
	}
	
	/**
	 * Deleting
	 * @return
	 */
	public String remove(){
		this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Service.delete(this.formMap);
		return SUCCESS;
	}
}	