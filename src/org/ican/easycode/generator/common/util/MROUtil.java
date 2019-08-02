package org.ican.easycode.generator.common.util;

import java.util.HashMap;
import java.util.Map;

/**
 * ���ݱ������ӳ�乤����
 * @author Vin
 * @since 1.0
 * @date 2011-02-26
 */
public class MROUtil {
	/**
	 * ��������
	 */
	public final static String JAVA_TYPE_LONG = "java.lang.Long";
	public final static String JAVA_TYPE_STRING = "java.lang.String";
	public final static String JAVA_TYPE_TIMESTAMP = "java.sql.Timestamp";
	
	public final static String TYPE_NUMBER = "NUMBER";
	public final static String TYPE_VARCHAR = "VARCHAR";
	public final static String TYPE_DATE = "DATE";
	
	public final static String FORMAT_DATE = "yyyy-MM-dd HH:mm:ss";
	
	/**
	 * ����ӳ�伯
	 */
	private static Map<String,String> typeMapping = new HashMap<String,String>();
	
	/**
	 * ��׼����ӳ�伯
	 */
	private static Map<String,String> standardTypeMapping = new HashMap<String,String>();
	
	/**
	 * ��ʼ������ӳ�伯
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
	 * ������ݿ������������������ı�׼���͵�ӳ�伯
	 * @param standardTypeName
	 * @param dataTypeNames
	 */
	private static void addStandardTypeMapping(String standardTypeName,String[] dataTypeNames){
		for(String dataTypeName : dataTypeNames){
			MROUtil.addStandardTypeMapping(dataTypeName,standardTypeName);
		}
	}
	
	/**
	 * ������ݿ������������������ı�׼���͵�ӳ�伯
	 * @param dataTypeName
	 * @param standardTypeName
	 */
	private static void addStandardTypeMapping(String dataTypeName,String standardTypeName){
		MROUtil.standardTypeMapping.put(dataTypeName,standardTypeName);
	}
	
	/**
	 * �������ݿ����ͻ�ȡ�������������ı�׼����
	 * INT ==> NUMBER
	 * @param dataTypeName
	 * @return
	 */
	public static String getStandardTypeMapping(String dataTypeName){
		return MROUtil.standardTypeMapping.get(dataTypeName.toUpperCase());
	}
	
	
	/**
	 * ������ݿ�������JAVA�������͵�ӳ�伯
	 * @param classTypeName
	 * @param dataTypeNames
	 */
	private static void addTypeMappings(String classTypeName,String[] dataTypeNames){
		for(String dataTypeName : dataTypeNames){
			MROUtil.addTypeMapping(dataTypeName,classTypeName);
		}
	}
	
	/**
	 * ������ݿ�������JAVA��������(����������)��ӳ��
	 * @param dataTypeName
	 * @param classTypeName
	 */
	private static void addTypeMapping(String dataTypeName,String classTypeName){
		MROUtil.typeMapping.put(dataTypeName,classTypeName);
	}
	
	/**
	 * �������ݿ����ͻ�ȡJAVA��������
	 * NUMBER ==> java.lang.Long
	 * @param dataTypeName
	 * @return
	 */
	public static String getTypeMapping(String dataTypeName){
		return MROUtil.typeMapping.get(dataTypeName.toUpperCase());
	}
	
	/**
	 * �������ݿ����ͻ�ȡJAVA����
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
	 * ���ݱ�ӳ��ΪJAVA����
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
	 * ���ݱ�ת��ΪJAVA Bean
	 * HELLO_WORLD ==> helloWorld
	 * @param tableName
	 * @return
	 */
	public static String tableNameToBeanName(String tableName){
		return lowerFirstChar(tableNameToClassName(tableName));
	}
	
	/**
	 * �ִ���һ���ַ�Сд
	 * "HelloWorld" ת��Ϊ "helloWorld"
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
	 * �ִ���һ���ַ���д
	 * "helloWorld" ת��Ϊ  "HelloWorld"
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
