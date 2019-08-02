package org.ican.easycode.common.config;

import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author Vin
 * @since 2011-02-22
 */
public class EasycodeConfig {
	private static final String cfgFile = "/easycode-config.properties";
	
	private final static  Log logger = LogFactory.getLog(EasycodeConfig.class);
	
	/**
	 * ����������
	 */
	private static Properties properties;
	
	static {
		properties = new Properties();
		InputStream is = EasycodeConfig.class.getResourceAsStream(cfgFile);
		try {
			properties.load(is);
		} catch (IOException e) {
			logger.error("read easycode.properties file fail please check you properties file is exists "+e);
			throw new RuntimeException("��ȡeasycode.propertise�����ļ�ʧ�ܣ�����������ļ��Ƿ���ڣ�");
		}
	}

	/**
	 * ����һ������ֵ
	 * 
	 * @param propertyName
	 *            ������
	 * @return ����ָ����������ֵ
	 */
	public static String getProperty(String propertyName) {		
		if (properties == null) {
			logger.error("system error,easycode properties is null!");
			throw new RuntimeException("ϵͳ���󣺶�ȡeasycode.properties����ʧ�ܣ�");
		} else {
			return properties.getProperty(propertyName);
		}
	}
	
	/**
	 * ��ȡ����ֵ���滻���е�ռλ��{}
	 * �磺{0} is {1} String[]strArr={"a","b"};
	 * ���ؽ��Ϊ a is b 
	 * @param propertyName
	 * @param strArr
	 * @return
	 */
	public static String getFormatProperty(String propertyName,String[] strArr){
		if (properties == null) {
			logger.error("system error,config properties is null!");
			throw new RuntimeException("ϵͳ���󣺶�ȡeasycode.properties����ʧ�ܣ�");
		} else {	
			String pattern = properties.getProperty(propertyName);
			MessageFormat format = new MessageFormat(pattern);
			return format.format(strArr);
		}
	}
	/**
	 * �����ļ���ȡ
	 * @param args
	 */
	public static void main(String[] args) {
		String url = "";
		try{
			url = EasycodeConfig.getProperty("web.system.css.url");
			logger.debug("url = " + url);
		}catch(Exception err){
			err.printStackTrace();
			err.getStackTrace();
		}
	}

}
