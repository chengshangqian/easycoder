<?xml version="1.0" encoding="GBK"?>
<beans xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.0.xsd            http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-2.0.xsd            http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-2.0.xsd" xmlns:tx="http://www.springframework.org/schema/tx" xmlns:aop="http://www.springframework.org/schema/aop" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.springframework.org/schema/beans">

<#list metadata.tables as table>
  <bean id="${MROUtil.tableNameToBeanName(table.tableName)}RESTDao" class="${metadata.packageName}.${metadata.moduleName}.dao.${MROUtil.tableNameToClassName(table.tableName)}RESTDao" autowire="byName"/>
  <bean id="${MROUtil.tableNameToBeanName(table.tableName)}Dao" class="${metadata.packageName}.${metadata.moduleName}.dao.${MROUtil.tableNameToClassName(table.tableName)}Dao" autowire="byName"/>
  <bean id="${MROUtil.tableNameToBeanName(table.tableName)}Service" class="${metadata.packageName}.${metadata.moduleName}.service.impl.${MROUtil.tableNameToClassName(table.tableName)}ServiceImpl">
    <property name="${MROUtil.tableNameToBeanName(table.tableName)}Dao" ref="${MROUtil.tableNameToBeanName(table.tableName)}Dao"/>
    <property name="${MROUtil.tableNameToBeanName(table.tableName)}RESTDao" ref="${MROUtil.tableNameToBeanName(table.tableName)}RESTDao"/>
  </bean>
  
  
</#list>
</beans>