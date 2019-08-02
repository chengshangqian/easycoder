<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd">
<sqlMap namespace="${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}">
  <typeAlias alias="${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}To" type="${metadata.packageName}.${metadata.moduleName}.to.${MROUtil.tableNameToClassName(metadata.tables[0].tableName)}To"/>
  <resultMap id="${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Result" class="${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}To">
  <#list metadata.tables[0].columns as column>
    <result property="${MROUtil.tableNameToBeanName(column.columnName)}" column="${column.columnName}"/>
  </#list>
  </resultMap>
  
  <select id="query" parameterClass="${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}To" resultMap="${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}Result">
     SELECT <#list metadata.tables[0].columns as column><#if (column_index > 0)>,</#if>${column.columnName}</#list> FROM ${metadata.tables[0].tableName} WHERE 1 = 1
     <dynamic prepend="">
     <#list metadata.tables[0].columns as column>
       <isNotNull property="${MROUtil.tableNameToBeanName(column.columnName)}">
       <#if (column.isQuery())>
          <isNotEmpty property="${MROUtil.tableNameToBeanName(column.columnName)}" prepend="AND"> ${column.columnName} like '%$${MROUtil.tableNameToBeanName(column.columnName)}$%' </isNotEmpty>
       <#else>
          <isNotEmpty property="${MROUtil.tableNameToBeanName(column.columnName)}" prepend="AND"> ${column.columnName} = #${MROUtil.tableNameToBeanName(column.columnName)}# </isNotEmpty>
       </#if>
       </isNotNull>
     </#list>
     </dynamic>
  </select>
  
  <insert id="create" parameterClass="${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}To">
    INSERT INTO ${metadata.tables[0].tableName} (${metadata.tables[0].primaryKey}
    <dynamic prepend="">
    <#list metadata.tables[0].columns as column>
    <#if (column.columnName != metadata.tables[0].primaryKey)>
      <isNotNull property="${MROUtil.tableNameToBeanName(column.columnName)}">
         <isNotEmpty property="${MROUtil.tableNameToBeanName(column.columnName)}" prepend=",">${column.columnName}</isNotEmpty>
      </isNotNull>
    </#if>
    </#list>
    </dynamic>
    ) VALUES (#${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}#
    <dynamic prepend="">
    <#list metadata.tables[0].columns as column>
    <#if (column.columnName != metadata.tables[0].primaryKey)>
      <isNotNull property="${MROUtil.tableNameToBeanName(column.columnName)}">
         <isNotEmpty property="${MROUtil.tableNameToBeanName(column.columnName)}" prepend=",">#${MROUtil.tableNameToBeanName(column.columnName)}#</isNotEmpty>
      </isNotNull>
    </#if>
    </#list>    
    </dynamic>
    )
  </insert>
  
  <update id="modify" parameterClass="${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}To">
    UPDATE ${metadata.tables[0].tableName} SET ${metadata.tables[0].primaryKey} = #${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}#
    <dynamic prepend="">
    <#list metadata.tables[0].columns as column>
    <#if (column.columnName != metadata.tables[0].primaryKey)>
      <isNotNull property="${MROUtil.tableNameToBeanName(column.columnName)}">
         <isNotEmpty property="${MROUtil.tableNameToBeanName(column.columnName)}" prepend=",">${column.columnName} = #${MROUtil.tableNameToBeanName(column.columnName)}#</isNotEmpty>
      </isNotNull>
    </#if>
    </#list>
    </dynamic>
    WHERE ${metadata.tables[0].primaryKey} = #${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}#
  </update>

  <update id="remove" parameterClass="${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}To">
    DELETE FROM ${metadata.tables[0].tableName} WHERE ${metadata.tables[0].primaryKey} = #${MROUtil.tableNameToBeanName(metadata.tables[0].primaryKey)}#
  </update>
</sqlMap>  