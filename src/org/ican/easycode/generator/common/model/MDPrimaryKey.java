package org.ican.easycode.generator.common.model;

public class MDPrimaryKey {
	private String tableCat;
	private String tableSchem;
	private String tableName;
	private String columnName;
	private Long keySeq;
	private String pkName;
	
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
	public Long getKeySeq() {
		return keySeq;
	}
	public void setKeySeq(Long keySeq) {
		this.keySeq = keySeq;
	}
	public String getPkName() {
		return pkName;
	}
	public void setPkName(String pkName) {
		this.pkName = pkName;
	}
	
	public String toString(){
		return "{" 
//			+ "\"tableCat\" : \"" + this.tableCat+ "\"," 
//			+ "\"tableSchem\" : \"" + this.tableSchem+ "\"," 
			+ "\"tableName\" : \"" + this.tableName+ "\"," 
//			+ "\"keySeq\" : " + this.keySeq +"," 
//			+ "\"pkName\" : \"" + this.pkName+ "\"," 
			+ "\"columnName\" : \"" + this.columnName+ "\""
			+ "}";
	}
}
