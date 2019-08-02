package org.ican.easycode.generator.common.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 数据表与对象映射工具类
 * @author Vin
 * @since 1.0
 * @date 2011-02-26
 */
public class MROUtil {
	/**
	 * 类型名称
	 */
	public final static String JAVA_TYPE_LONG = "java.lang.Long";
	public final static String JAVA_TYPE_STRING = "java.lang.String";
	public final static String JAVA_TYPE_TIMESTAMP = "java.sql.Timestamp";
	
	public final static String TYPE_NUMBER = "NUMBER";
	public final static String TYPE_VARCHAR = "VARCHAR";
	public final static String TYPE_DATE = "DATE";
	
	public final static String FORMAT_DATE = "yyyy-MM-dd HH:mm:ss";
	
	/**
	 * 类型映射集
	 */
	private static Map<String,String> typeMapping = new HashMap<String,String>();
	
	/**
	 * 标准类型映射集
	 */
	private static Map<String,String> standardTypeMapping = new HashMap<String,String>();
	
	/**
	 * 初始化类型映射集
	 */
	static{
		MROUtil.addTypeMappings("java.lang.Long",new String[]{"BIGINT","FLOAT","INT","INTEGER",
				"NUMBER","SHORT","DOUBLE","MEDIUMINT UNSIGNED","SMALLINT UNSIGNED","INT UNSIGNED","DECIMAL UNSIGNED","DECIMAL","TINYINT UNSIGNED","BIT","MEDIUMINT","SMALLINT"});
		MROUtil.addTypeMappings("java.lang.String",new String[]{"CHAR","CLOB","VARCHAR","VARCHAR2","TEXT","BLOB"});
		MROUtil.addTypeMappings("java.sql.Timestamp",new String[]{"DATE","TIME","TIMESTAMP","DATETIME"});
		
		MROUtil.addStandardTypeMapping("NUMBER",new String[]{"BIGINT","FLOAT","INT","INTEGER",
				"NUMBER","SHORT","DOUBLE","MEDIUMINT UNSIGNED","SMALLINT UNSIGNED","INT UNSIGNED","DECIMAL UNSIGNED","DECIMAL","TINYINT UNSIGNED","BIT","MEDIUMINT","SMALLINT"});
		MROUtil.addStandardTypeMapping("VARCHAR",new String[]{"CHAR","CLOB","VARCHAR","VARCHAR2","TEXT","LONGTEXT","BLOB"});
		MROUtil.addStandardTypeMapping("DATE",new String[]{"DATE","TIME","TIMESTAMP","DATETIME"});
	}
	
	/**
	 * 添加数据库类型与代码生成所需的标准类型的映射集
	 * @param standardTypeName
	 * @param dataTypeNames
	 */
	private static void addStandardTypeMapping(String standardTypeName,String[] dataTypeNames){
		for(String dataTypeName : dataTypeNames){
			MROUtil.addStandardTypeMapping(dataTypeName,standardTypeName);
		}
	}
	
	/**
	 * 添加数据库类型与代码生成所需的标准类型的映射集
	 * @param dataTypeName
	 * @param standardTypeName
	 */
	private static void addStandardTypeMapping(String dataTypeName,String standardTypeName){
		MROUtil.standardTypeMapping.put(dataTypeName,standardTypeName);
	}
	
	/**
	 * 根据数据库类型获取与代码生成所需的标准类型
	 * INT ==> NUMBER
	 * @param dataTypeName
	 * @return
	 */
	public static String getStandardTypeMapping(String dataTypeName){
		return MROUtil.standardTypeMapping.get(dataTypeName.toUpperCase());
	}
	
	
	/**
	 * 添加数据库类型与JAVA数据类型的映射集
	 * @param classTypeName
	 * @param dataTypeNames
	 */
	private static void addTypeMappings(String classTypeName,String[] dataTypeNames){
		for(String dataTypeName : dataTypeNames){
			MROUtil.addTypeMapping(dataTypeName,classTypeName);
		}
	}
	
	/**
	 * 添加数据库类型与JAVA数据类型(完整类型名)的映射
	 * @param dataTypeName
	 * @param classTypeName
	 */
	private static void addTypeMapping(String dataTypeName,String classTypeName){
		MROUtil.typeMapping.put(dataTypeName,classTypeName);
	}
	
	/**
	 * 根据数据库类型获取JAVA数据类型
	 * NUMBER ==> java.lang.Long
	 * @param dataTypeName
	 * @return
	 */
	public static String getTypeMapping(String dataTypeName){
		return MROUtil.typeMapping.get(dataTypeName.toUpperCase());
	}
	
	/**
	 * 根据数据库类型获取JAVA类型
	 * NUMBER ==> Long
	 * @param dataTypeName
	 * @return
	 */
	public static String getShortTypeMapping(String dataTypeName){
		String classTypeName = getTypeMapping(dataTypeName);
		classTypeName = classTypeName.substring(classTypeName.lastIndexOf("." + 1));
		return classTypeName;
	}
	
	/**
	 * 数据表映射为JAVA类名
	 * HELLO_WORLD ==> HelloWorld 
	 * @param tableName
	 * @return
	 */
	public static String tableNameToClassName(String tableName){
		StringBuffer result = new StringBuffer("");
		if (tableName != null && !tableName.equals("")) {
			String lowerTableName = tableName.toLowerCase();
			int index = lowerTableName.indexOf("_");
			if(-1 == index){
				//hello
				result.append(upperFirstChar(lowerTableName));
			}
			else{
				//hello_world_otherword
				while(index != -1){
					result.append(upperFirstChar(lowerTableName.substring(0, index)));
					lowerTableName = lowerTableName.substring(index + 1);
					index = lowerTableName.indexOf("_");
				}
				result.append(upperFirstChar(lowerTableName));
			}
		}
		return result.toString();
	}
	
	/**
	 * 数据表转换为JAVA Bean
	 * HELLO_WORLD ==> helloWorld
	 * @param tableName
	 * @return
	 */
	public static String tableNameToBeanName(String tableName){
		return lowerFirstChar(tableNameToClassName(tableName));
	}
	
	/**
	 * 字串第一个字符小写
	 * "HelloWorld" 转换为 "helloWorld"
	 * @param string
	 * @return
	 */
	public static String lowerFirstChar(String string) {
		StringBuffer result = new StringBuffer("");
		if (string != null && !string.equals("")) {
			result.append(string.substring(0, 1).toLowerCase());
			result.append(string.substring(1));
		}
		return result.toString();
	}
	
	/**
	 * 字串第一个字符大写
	 * "helloWorld" 转换为  "HelloWorld"
	 * @param className
	 * @return
	 */
	public static String upperFirstChar(String string) {
		StringBuffer result = new StringBuffer("");
		if (string != null && !string.equals("")) {
			result.append(string.substring(0, 1).toUpperCase());
			result.append(string.substring(1));
		}		
		return result.toString();
	}
}
