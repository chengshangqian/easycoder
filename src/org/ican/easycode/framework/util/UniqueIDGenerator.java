package org.ican.easycode.framework.util;

import org.doomdark.uuid.UUIDGenerator;

/**
 * Title: i-courseWare<br>
 * Description:ΨһID�����ࣨUUID��
 * ��ID���������ÿ�ԴID������JUG <br>
 * Copyright: ����Զ�̽������� 2009 <br>
 * Create DateTime: 2009-11-3 ����05:45:47 <br>
 * CVS last modify person: lianghuahuang <br>
 * CVS last modify DateTime: 2009-11-3 ����05:45:47 <br>
 * CVS last version: <br>
 * 
 * @author �����
 */

public class UniqueIDGenerator {
	
	/**
	 * ��ȡΨһID
	 * @return String
	 */
	public static String getUUID() {
		String uuid = UUIDGenerator.getInstance()
				.generateRandomBasedUUID().toString();
		
		return uuid.replaceAll("-", "");		
	}

}
