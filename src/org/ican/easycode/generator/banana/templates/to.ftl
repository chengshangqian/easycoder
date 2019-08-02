package ${metadata.packageName}.${metadata.moduleName}.to;

/**
 * @author ³ÉÉÐÇ«
 */
public class ${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To {

    <#list metadata.tables[0].columns as column>
    private ${MROUtil.getTypeMapping(column.standardType)} ${MROUtil.tableNameToBeanName(column.columnName)};
    </#list>

	<#list metadata.tables[0].columns as column>
	public ${MROUtil.getTypeMapping(column.standardType)} get${MROUtil.tableNameToClassName(column.columnName)}() {
		return ${MROUtil.tableNameToBeanName(column.columnName)};
	}
	public void set${MROUtil.tableNameToClassName(column.columnName)}(${MROUtil.getTypeMapping(column.standardType)} ${MROUtil.tableNameToBeanName(column.columnName)}) {
		this.${MROUtil.tableNameToBeanName(column.columnName)} = ${MROUtil.tableNameToBeanName(column.columnName)};
	}
	</#list>
}