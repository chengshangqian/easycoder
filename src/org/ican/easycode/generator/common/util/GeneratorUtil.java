package org.ican.easycode.generator.common.util;

import org.apache.commons.lang.StringUtils;

public class GeneratorUtil {
	public static String toLowerCase(String str){
		StringUtils.lowerCase(str);
		return null == str ? "" : str.toLowerCase();
	}
	
}
