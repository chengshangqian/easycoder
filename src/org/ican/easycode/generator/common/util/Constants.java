package org.ican.easycode.generator.common.util;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class Constants {
	public final static String ENCODING = "GBK";
	
	public final static Map<String,String> GENERATORS;
	public final static Map<String,String> DB_DRIVE_NAME_MAPPINGS;
	
	public final static String APPLE_GENERATOR = "apple";
	public final static String BANANA_GENERATOR = "banana";
	public final static String COCOA_GENERATOR = "cocoa";
	public final static String DURIAN_GENERATOR = "durian";
	public final static String EMBLIC_GENERATOR = "emblic";
	public final static String FIG_GENERATOR = "fig";
	public final static String GRAPE_GENERATOR = "grape";
	public final static String GZDEC_GENERATOR = "gzdec";
	public final static String HAW_GENERATOR = "haw";
	
	static{
		GENERATORS = new TreeMap<String,String>();
		DB_DRIVE_NAME_MAPPINGS = new HashMap<String,String>();
		//GENERATORS.put(APPLE_GENERATOR,APPLE_GENERATOR);
		GENERATORS.put(BANANA_GENERATOR,"�㽶(" + BANANA_GENERATOR + ")");
		GENERATORS.put(COCOA_GENERATOR,"�ɿ�(" + COCOA_GENERATOR + ")");
		GENERATORS.put(DURIAN_GENERATOR,"����(" + DURIAN_GENERATOR + ")");//��BANANA_GENERATOR��ͬ
		GENERATORS.put(EMBLIC_GENERATOR,"ţ�ʹ�(" + EMBLIC_GENERATOR + ")");//û��TO
		GENERATORS.put(FIG_GENERATOR,"�޻���(" + FIG_GENERATOR + ")");//
		GENERATORS.put(GZDEC_GENERATOR,"Զ��(" + GZDEC_GENERATOR + ")");
		GENERATORS.put(GRAPE_GENERATOR,"����(" + GRAPE_GENERATOR + ")");
		GENERATORS.put(HAW_GENERATOR,"ɽ�(" + HAW_GENERATOR + ")");
		
		DB_DRIVE_NAME_MAPPINGS.put("com.mysql.jdbc.Driver", "mysql");
		DB_DRIVE_NAME_MAPPINGS.put("oracle.jdbc.OracleDriver", "oracle");
		DB_DRIVE_NAME_MAPPINGS.put("org.apache.derby.jdbc.ClientDriver", "derby");
	}
}
