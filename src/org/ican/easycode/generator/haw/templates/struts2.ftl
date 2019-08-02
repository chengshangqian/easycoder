<!DOCTYPE struts PUBLIC
        "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
        "http://struts.apache.org/dtds/struts-2.0.dtd">
<struts>

 <#list metadata.tables as table>
  <package name="${metadata.projectName}_${metadata.moduleName}_${MROUtil.tableNameToBeanName(table.tableName)}" extends="struts-default" namespace="/${metadata.projectName}/${metadata.moduleName}/${MROUtil.tableNameToBeanName(table.tableName)}">
    <action name="index" method="index" class="${metadata.packageName}.${metadata.moduleName}.actions.${MROUtil.tableNameToClassName(table.tableName)}Action">
        <result name="success">/jsp/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(table.tableName)}_index.jsp</result>
    </action>

    <action name="findAll" method="findAll" class="${metadata.packageName}.${metadata.moduleName}.actions.${MROUtil.tableNameToClassName(table.tableName)}Action">
        <result name="success">/jsp/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(table.tableName)}_index.jsp</result>
    </action>

    <action name="findByPage" method="findByPage" class="${metadata.packageName}.${metadata.moduleName}.actions.${MROUtil.tableNameToClassName(table.tableName)}Action">
        <result name="success">/jsp/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(table.tableName)}_index.jsp</result>
    </action>

    <action name="doInput" method="doInput" class="${metadata.packageName}.${metadata.moduleName}.actions.${MROUtil.tableNameToClassName(table.tableName)}Action">
        <result name="success">/jsp/${metadata.projectName}/${metadata.moduleName}/${StringUtils.lowerCase(table.tableName)}_input.jsp</result>
    </action>

    <action name="create" method="create" class="${metadata.packageName}.${metadata.moduleName}.actions.${MROUtil.tableNameToClassName(table.tableName)}Action">
        <result name="success" type="redirectAction">
            <param name="actionName">index</param>
            <param name="prependServletContext">false</param>
        </result>
    </action>

    <action name="modify" method="modify" class="${metadata.packageName}.${metadata.moduleName}.actions.${MROUtil.tableNameToClassName(table.tableName)}Action">
        <result name="success" type="redirectAction">
            <param name="actionName">index</param>
            <param name="prependServletContext">false</param>
        </result>
    </action>

    <action name="remove" method="remove" class="${metadata.packageName}.${metadata.moduleName}.actions.${MROUtil.tableNameToClassName(table.tableName)}Action">
        <result name="success" type="redirectAction">
            <param name="actionName">index</param>
            <param name="prependServletContext">false</param>
        </result>
    </action>
  </package>
  
  
 </#list>
  
</struts>