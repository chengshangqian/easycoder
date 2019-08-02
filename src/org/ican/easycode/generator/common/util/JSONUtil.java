package org.ican.easycode.generator.common.util;

import java.util.ArrayList;
import java.util.List;

import org.ican.easycode.generator.common.model.MDColumn;
import org.ican.easycode.generator.common.model.MDMetaData;
import org.ican.easycode.generator.common.model.MDTable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JSONUtil {
	/**
	 * 将value格式化为JSON值
	 * @param value
	 * @return
	 */
	public static String toJSONValue(Object value){
		if(null == value){
			value = "";
		}
		return "\"" + value + "\"";
	}
	
	/**
	 * 将MDMetaData的JSON字符串格式化为MDMetaData对象
	 * @param json
	 * @return
	 * @throws JSONException 
	 */
	public static MDMetaData toMDMetaData(String json) throws JSONException{
		MDMetaData mdMetaData = new MDMetaData();
		JSONObject mdMetaDataJSONObject = new JSONObject(json);
		String projectName = mdMetaDataJSONObject.optString("projectName");
		String packageName = mdMetaDataJSONObject.optString("packageName");
		String projectRoot = mdMetaDataJSONObject.optString("projectRoot");
		String moduleName = mdMetaDataJSONObject.optString("moduleName");
		String dbName = mdMetaDataJSONObject.optString("dbName");
		
		mdMetaData.setProjectName(projectName);
		mdMetaData.setPackageName(packageName);
		mdMetaData.setProjectRoot(projectRoot);
		mdMetaData.setModuleName(moduleName);
		mdMetaData.setDbName(dbName);
		
		List<MDTable> tables = new ArrayList<MDTable>();
		JSONArray tablesJSONArray = mdMetaDataJSONObject.optJSONArray("tables");
		for(int i = 0; i < tablesJSONArray.length(); i++){
			JSONObject tableJSONObject = tablesJSONArray.optJSONObject(i);
			MDTable mdTable = new MDTable();
			mdTable.setPrimaryKey(tableJSONObject.optString("primaryKey"));
			mdTable.setRemarks(tableJSONObject.optString("remarks"));
			mdTable.setTableName(tableJSONObject.optString("tableName"));
			
			List<MDColumn> columns = new ArrayList<MDColumn>();
			JSONArray columnsJSONArray = tableJSONObject.optJSONArray("columns");
			for(int j = 0; j < columnsJSONArray.length(); j++){
				MDColumn column = new MDColumn();
				JSONObject columnJSONObject = columnsJSONArray.optJSONObject(j);
				column.setColumnDef(columnJSONObject.optString("columnDef"));
				column.setColumnName(columnJSONObject.optString("columnName"));
				column.setFormat(columnJSONObject.optString("format"));
				column.setHead(columnJSONObject.optBoolean("isHead"));
				column.setInputType(columnJSONObject.optString("inputType"));
				column.setIuput(columnJSONObject.optBoolean("isIuput"));
				column.setPrimaryKey(columnJSONObject.optBoolean("isPrimaryKey"));
				column.setQuery(columnJSONObject.optBoolean("isQuery"));
				column.setRemarks(columnJSONObject.optString("remarks"));
				column.setRequired(columnJSONObject.optBoolean("required"));
				String typeName = columnJSONObject.optString("typeName");
				column.setTypeName(typeName);
				//转换为代码生成所需的标准类型
				column.setStandardType(MROUtil.getStandardTypeMapping(typeName));
				columns.add(column);
			}
			
			mdTable.setColumns(columns);
			tables.add(mdTable);
		}
		
		mdMetaData.setTables(tables);
		
		return mdMetaData;
	}
	
	public static void main(String[] args) throws Exception{
		String json = "{" +
				"'projectName':'nts'," +
				"'packageName':'com.gzdec.nts'," +
				"'projectRoot':'E:/projects/NetworkTeacher'," +
				"'moduleName':'counseling'," +
				"'tables' : [" +
				"{'primaryKey':'COUNSELING_ID','remarks':'辅导编号','tableName':'辅导表','columns':[{'columnName':'COUNSELING_ID','remarks':'辅导编号'},{'columnName':'TITLE','remarks':'辅导标题'}]}" +
				"]}";
		System.out.println(toMDMetaData(json));
	}
}
