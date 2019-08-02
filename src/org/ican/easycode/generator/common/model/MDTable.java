package org.ican.easycode.generator.common.model;

import java.util.List;

import org.ican.easycode.generator.common.util.JSONUtil;

public class MDTable {
	private String tableCat;
	private String tableSchem;
	private String tableName;
	private String tableType;
	private String remarks;
	private String typeCat;
	private String typeSchem;
	private String typeName;
	private String selfReferencingColName;
	private String refGeneration;
	
	private boolean selected;
	private String primaryKey;
	
	private List<MDColumn> columns;
	private List<MDPrimaryKey> primaryKeys;
	
	public List<MDColumn> getColumns() {
		return columns;
	}
	public void setColumns(List<MDColumn> columns) {
		this.columns = columns;
	}
	public List<MDPrimaryKey> getPrimaryKeys() {
		return primaryKeys;
	}
	public void setPrimaryKeys(List<MDPrimaryKey> primaryKeys) {
		this.primaryKeys = primaryKeys;
	}
	public String getTableCat() {
		return tableCat;
	}
	public void setTableCat(String tableCat) {
		this.tableCat = tableCat;
	}
	public String getTableSchem() {
		return tableSchem;
	}
	public void setTableSchem(String tableSchem) {
		this.tableSchem = tableSchem;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getTableType() {
		return tableType;
	}
	public void setTableType(String tableType) {
		this.tableType = tableType;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getTypeCat() {
		return typeCat;
	}
	public void setTypeCat(String typeCat) {
		this.typeCat = typeCat;
	}
	public String getTypeSchem() {
		return typeSchem;
	}
	public void setTypeSchem(String typeSchem) {
		this.typeSchem = typeSchem;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getSelfReferencingColName() {
		return selfReferencingColName;
	}
	public void setSelfReferencingColName(String selfReferencingColName) {
		this.selfReferencingColName = selfReferencingColName;
	}
	public String getRefGeneration() {
		return refGeneration;
	}
	public void setRefGeneration(String refGeneration) {
		this.refGeneration = refGeneration;
	}
	
	public boolean isSelected() {
		return selected;
	}
	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	public String getPrimaryKey() {
		return primaryKey;
	}
	public void setPrimaryKey(String primaryKey) {
		this.primaryKey = primaryKey;
	}
	
	public String toString(){
		return "{" 
//			+ "\"tableCat\" : " + JSONUtil.toJSONValue(this.tableCat)+ "," 
//			+ "\"tableSchem\" : " + JSONUtil.toJSONValue(this.tableSchem)+ "," 
			+ "\"tableName\" : " + JSONUtil.toJSONValue(this.tableName)+ "," 
//			+ "\"tableType\" : " + JSONUtil.toJSONValue(this.tableType)+ "," 
			+ "\"remarks\" : " + JSONUtil.toJSONValue(this.remarks)+ "," 
//			+ "\"typeCat\" : " + JSONUtil.toJSONValue(this.typeCat)+ "," 
//			+ "\"typeSchem\" : " + JSONUtil.toJSONValue(this.typeSchem)+ "," 
//			+ "\"typeName\" : " + JSONUtil.toJSONValue(this.typeName)+ "," 
//			+ "\"selfReferencingColName\" : " + JSONUtil.toJSONValue(this.selfReferencingColName)+ "," 
//			+ "\"refGeneration\" : " + JSONUtil.toJSONValue(this.refGeneration)+ "," 
			+ "\"selected\" : " + this.selected+ "," 
			+ "\"columns\" : " + this.columns+ "," 
			+ "\"primaryKeys\" : " + this.primaryKeys+ "," 
			+ "\"primaryKey\" : " + JSONUtil.toJSONValue(this.primaryKey)
			+ "}";
	}
}
