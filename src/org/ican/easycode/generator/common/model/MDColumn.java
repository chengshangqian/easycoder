package org.ican.easycode.generator.common.model;

import org.ican.easycode.generator.common.util.JSONUtil;

public class MDColumn {
	private String tableCat;
	private String tableSchem;
	private String tableName;
	private String columnName;
	private Long dataType;
	private String typeName;	
	private Long columnSize;
	private String bufferLength;
	private Long decimalDigits;
	private Long numPrecRadix;
	private Long nullable;
	private String remarks;
	private String columnDef;	
	private Long sqlDataType;
	private Long sqlDatetimeSub;
	private Long charOctetLength;
	private Long ordinalPosition;
	private String isNullable;
	private String scopeCatlog;
	private String scopeSchem;	
	private String scopeTable;
	private Long sourceDataType;
	private String isAutoincrement;
	
	private boolean isQuery;
	private boolean isHead = true;
	private boolean isIuput = true;
	private boolean required;
	private boolean isPrimaryKey;
	private String inputType;
	private String format;
	
	private String standardType;
	
	public String getStandardType() {
		return standardType;
	}
	public void setStandardType(String standardType) {
		this.standardType = standardType;
	}
	public boolean isQuery() {
		return isQuery;
	}
	public void setQuery(boolean isQuery) {
		this.isQuery = isQuery;
	}
	public boolean isHead() {
		return isHead;
	}
	public void setHead(boolean isHead) {
		this.isHead = isHead;
	}
	public boolean isIuput() {
		return isIuput;
	}
	public void setIuput(boolean isIuput) {
		this.isIuput = isIuput;
	}
	public boolean isRequired() {
		return required;
	}
	public void setRequired(boolean required) {
		this.required = required;
	}
	public boolean isPrimaryKey() {
		return isPrimaryKey;
	}
	public void setPrimaryKey(boolean isPrimaryKey) {
		this.isPrimaryKey = isPrimaryKey;
	}
	public String getInputType() {
		return inputType;
	}
	public void setInputType(String inputType) {
		this.inputType = inputType;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	public Long getOrdinalPosition() {
		return ordinalPosition;
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
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public Long getDataType() {
		return dataType;
	}
	public void setDataType(Long dataType) {
		this.dataType = dataType;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Long getColumnSize() {
		return columnSize;
	}
	public void setColumnSize(Long columnSize) {
		this.columnSize = columnSize;
	}
	public String getBufferLength() {
		return bufferLength;
	}
	public void setBufferLength(String bufferLength) {
		this.bufferLength = bufferLength;
	}
	public Long getDecimalDigits() {
		return decimalDigits;
	}
	public void setDecimalDigits(Long decimalDigits) {
		this.decimalDigits = decimalDigits;
	}
	public Long getNumPrecRadix() {
		return numPrecRadix;
	}
	public void setNumPrecRadix(Long numPrecRadix) {
		this.numPrecRadix = numPrecRadix;
	}
	public Long getNullable() {
		return nullable;
	}
	public void setNullable(Long nullable) {
		this.nullable = nullable;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getColumnDef() {
		return columnDef;
	}
	public void setColumnDef(String columnDef) {
		this.columnDef = columnDef;
	}
	public Long getSqlDataType() {
		return sqlDataType;
	}
	public void setSqlDataType(Long sqlDataType) {
		this.sqlDataType = sqlDataType;
	}
	public Long getSqlDatetimeSub() {
		return sqlDatetimeSub;
	}
	public void setSqlDatetimeSub(Long sqlDatetimeSub) {
		this.sqlDatetimeSub = sqlDatetimeSub;
	}
	public Long getCharOctetLength() {
		return charOctetLength;
	}
	public void setCharOctetLength(Long charOctetLength) {
		this.charOctetLength = charOctetLength;
	}
	public Long getOrdinalPostion() {
		return ordinalPosition;
	}
	public void setOrdinalPosition(Long ordinalPosition) {
		this.ordinalPosition = ordinalPosition;
	}
	public String getIsNullable() {
		return isNullable;
	}
	public void setIsNullable(String isNullable) {
		this.isNullable = isNullable;
	}
	public String getScopeCatlog() {
		return scopeCatlog;
	}
	public void setScopeCatlog(String scopeCatlog) {
		this.scopeCatlog = scopeCatlog;
	}
	public String getScopeSchem() {
		return scopeSchem;
	}
	public void setScopeSchem(String scopeSchem) {
		this.scopeSchem = scopeSchem;
	}
	public String getScopeTable() {
		return scopeTable;
	}
	public void setScopeTable(String scopeTable) {
		this.scopeTable = scopeTable;
	}
	public Long getSourceDataType() {
		return sourceDataType;
	}
	public void setSourceDataType(Long sourceDataType) {
		this.sourceDataType = sourceDataType;
	}
	public String getIsAutoincrement() {
		return isAutoincrement;
	}
	public void setIsAutoincrement(String isAutoincrement) {
		this.isAutoincrement = isAutoincrement;
	}
	
	public String toString(){
		return "{" 
//		+ "\"tableCat\" : " + JSONUtil.toJSONValue(this.tableCat)+ "," 
//		+ "\"tableSchem\" : " + JSONUtil.toJSONValue(this.tableSchem)+ "," 
//		+ "\"tableName\" : " + JSONUtil.toJSONValue(this.tableName)+ "," 
		+ "\"columnName\" : " + JSONUtil.toJSONValue(this.columnName)+ "," 
		+ "\"remarks\" : " + JSONUtil.toJSONValue(this.remarks)+ "," 
		+ "\"typeName\" : " + JSONUtil.toJSONValue(this.typeName)+ "," 
//		+ "\"bufferLength\" : " + JSONUtil.toJSONValue(this.bufferLength)+ "," 
		+ "\"columnDef\" : " + JSONUtil.toJSONValue(this.columnDef)+ "," 
		+ "\"standardType\" : " + JSONUtil.toJSONValue(this.standardType)+ "," 
//		+ "\"isNullable\" : " + JSONUtil.toJSONValue(this.isNullable)+ "," 
//		+ "\"scopeSchem\" : " + JSONUtil.toJSONValue(this.scopeSchem)+ "," 
//		+ "\"scopeTable\" : " + JSONUtil.toJSONValue(this.scopeTable)+ "," 
//		+ "\"isAutoincrement\" : " + JSONUtil.toJSONValue(this.isAutoincrement)+ "," 
//		+ "\"dataType\" : " + this.dataType+ "," 
//		+ "\"columnSize\" : " + JSONUtil.toJSONValue(this.columnSize)+ "," 
//		+ "\"decimalDigits\" : " + this.decimalDigits+ "," 
//		+ "\"numPrecRadix\" : " + JSONUtil.toJSONValue(this.numPrecRadix)+ "," 
//		+ "\"nullable\" : " + this.nullable+ "," 
//		+ "\"sqlDataType\" : " + JSONUtil.toJSONValue(this.sqlDataType)+ "," 
//		+ "\"sqlDatetimeSub\" : " + this.sqlDatetimeSub+ "," 
//		+ "\"charOctetLength\" : " + JSONUtil.toJSONValue(this.charOctetLength)+ "," 
//		+ "\"ordinalPosition\" : " + this.ordinalPosition+ "," 
//		+ "\"sourceDataType\" : " + JSONUtil.toJSONValue(this.sourceDataType)+ "," 
//		+ "\"scopeCatlog\" : " + JSONUtil.toJSONValue(this.scopeCatlog) + ","		
		+ "\"isQuery\" : " + isQuery+ "," 
		+ "\"isHead\" : " + isHead+ "," 
		+ "\"isIuput\" : " + isIuput+ "," 
		+ "\"required\" : " + required+ "," 
		+ "\"isPrimaryKey\" : " + isPrimaryKey+ "," 
		+ "\"inputType\" : " + JSONUtil.toJSONValue(this.inputType)+ "," 
		+ "\"format\" : " + JSONUtil.toJSONValue(this.format)
		+ "}";
	}
}
