package org.ican.easycode.generator.common.model;

import java.util.List;

import org.ican.easycode.generator.common.util.JSONUtil;

public class MDMetaData {
	private List<MDTable> tables;
	
	private String projectName;
	private String packageName;
	private String moduleName;
	private String projectRoot;
	private String dbName;

	public List<MDTable> getTables() {
		return tables;
	}

	public void setTables(List<MDTable> tables) {
		this.tables = tables;
	}
	
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getProjectRoot() {
		return projectRoot;
	}

	public void setProjectRoot(String projectRoot) {
		this.projectRoot = projectRoot;
	}
	
	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public String toString(){
		return "{" +
				"\"tables\" : " + this.tables + "," 
				+ "\"projectName\" : " + JSONUtil.toJSONValue(this.projectName)+ "," 
				+ "\"packageName\" : " + JSONUtil.toJSONValue(this.packageName)+ "," 
				+ "\"moduleName\" : " + JSONUtil.toJSONValue(this.moduleName)+ "," 
				+ "\"projectRoot\" : " + JSONUtil.toJSONValue(this.projectRoot)+ "," 
				+ "\"dbName\" : " + JSONUtil.toJSONValue(this.dbName)
				+ "}";
	}
}
