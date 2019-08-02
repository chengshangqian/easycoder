<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd">
<sqlMap namespace="${metadata.projectName}.${metadata.moduleName}.${MROUtil.tableNameToBeanName(metadata.tables[0].tableName)}">
  
  <select id="query" parameterClass="java.util.HashMap" resultClass="java.util.HashMap" remapResults="true">
     SELECT <#list metadata.tables[0].columns as column><#if (column_index > 0)>,</#if><#if (column.standardType == 'DATE')><#if (metadata.dbName == 'mysql')>DATE_FORMAT<#else>TO_CHAR</#if>(</#if>${column.columnName}<#if (column.standardType == 'DATE')>,<#if (metadata.dbName == 'mysql')>'%Y-%m-%d %H:%i:%s'<#else>'yyyy-MM-dd hh24:mi:ss'</#if>) ${column.columnName}</#if></#list> FROM ${metadata.tables[0].tableName} 
     <dynamic prepend="WHERE">
     <#list metadata.tables[0].columns as column>
       <isNotNull property="${column.columnName}">
       <#if (column.isQuery())>
          <isNotEmpty property="${column.columnName}" prepend="AND"> ${column.columnName} like '%$${column.columnName}$%' </isNotEmpty>
	  <isNotNull property="${column.columnName}__"><isNotEmpty property="${column.columnName}__" prepend=" "> ESCAPE '\' </isNotEmpty></isNotNull>
       <#else>
          <isNotEmpty property="${column.columnName}" prepend="AND"> ${column.columnName} = #${column.columnName}# </isNotEmpty>
       </#if>          
       </isNotNull>
     </#list>
     </dynamic>
  </select>
  
  <insert id="create" parameterClass="java.util.HashMap">
    INSERT INTO ${metadata.tables[0].tableName} (${metadata.tables[0].primaryKey}
    <dynamic prepend="">
    <#list metadata.tables[0].columns as column>
    <#if (column.columnName != metadata.tables[0].primaryKey)>
      <isNotNull property="${column.columnName}">
         <isNotEmpty property="${column.columnName}" prepend=",">${column.columnName}</isNotEmpty>
      </isNotNull>
    </#if>
    </#list>
    </dynamic>
    ) VALUES (#${metadata.tables[0].primaryKey}#
    <dynamic prepend="">
    <#list metadata.tables[0].columns as column>
    <#if (column.columnName != metadata.tables[0].primaryKey)>
      <isNotNull property="${column.columnName}">
         <isNotEmpty property="${column.columnName}" prepend=",">#${column.columnName}#</isNotEmpty>
      </isNotNull>
    </#if>
    </#list>    
    </dynamic>
    )
  </insert>
  
  <update id="modify" parameterClass="java.util.HashMap">
    UPDATE ${metadata.tables[0].tableName} SET ${metadata.tables[0].primaryKey} = #${metadata.tables[0].primaryKey}#
    <dynamic prepend="">
    <#list metadata.tables[0].columns as column>
    <#if (column.columnName != metadata.tables[0].primaryKey)>
      <isNotNull property="${column.columnName}">
         <isNotEmpty property="${column.columnName}" prepend=",">${column.columnName} = #${column.columnName}#</isNotEmpty>
      </isNotNull>
    </#if>
    </#list>
    </dynamic>
    WHERE ${metadata.tables[0].primaryKey} = #${metadata.tables[0].primaryKey}#
  </update>

  <update id="remove" parameterClass="java.util.HashMap">
    DELETE FROM ${metadata.tables[0].tableName} WHERE ${metadata.tables[0].primaryKey} = #${metadata.tables[0].primaryKey}#
  </update>
</sqlMap>  