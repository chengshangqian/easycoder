package org.ican.easycode.framework.util;

import org.doomdark.uuid.UUIDGenerator;

/**
 * Title: i-courseWare<br>
 * Description:唯一ID生成类（UUID）
 * 该ID生成器调用开源ID生成器JUG <br>
 * Copyright: 广州远程教育中心 2009 <br>
 * Create DateTime: 2009-11-3 下午05:45:47 <br>
 * CVS last modify person: lianghuahuang <br>
 * CVS last modify DateTime: 2009-11-3 下午05:45:47 <br>
 * CVS last version: <br>
 * 
 * @author 梁华璜
 */

public class UniqueIDGenerator {
	
	/**
	 * 获取唯一ID
	 * @return String
	 */
	public static String getUUID() {
		String uuid = UUIDGenerator.getInstance()
				.generateRandomBasedUUID().toString();
		
		return uuid.replaceAll("-", "");		
	}

}
