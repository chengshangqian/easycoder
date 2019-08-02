package ${metadata.packageName}.${metadata.moduleName}.service.impl;

import ${metadata.packageName}.${metadata.moduleName}.dao.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Dao;
import ${metadata.packageName}.${metadata.moduleName}.service.inter.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Service;

/**
 * @author ³ÉÉÐÇ«
 */
public class ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}ServiceImpl extends ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}RESTServiceImpl implements ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Service{
	private ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Dao ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Dao;

	public ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Dao get${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Dao() {
		return ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Dao;
	}

	public void set${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Dao(${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}Dao ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Dao) {
		this.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Dao = ${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Dao;
	}
}