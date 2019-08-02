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
	 * 读出的属性
	 */
	private static Properties properties;
	
	static {
		properties = new Properties();
		InputStream is = EasycodeConfig.class.getResourceAsStream(cfgFile);
		try {
			properties.load(is);
		} catch (IOException e) {
			logger.error("read easycode.properties file fail please check you properties file is exists "+e);
			throw new RuntimeException("读取easycode.propertise属性文件失败，请检查该属性文件是否存在！");
		}
	}

	/**
	 * 返回一个属性值
	 * 
	 * @param propertyName
	 *            属性名
	 * @return 返回指定属性名的值
	 */
	public static String getProperty(String propertyName) {		
		if (properties == null) {
			logger.error("system error,easycode properties is null!");
			throw new RuntimeException("系统错误：读取easycode.properties属性失败！");
		} else {
			return properties.getProperty(propertyName);
		}
	}
	
	/**
	 * 获取属性值，替换其中的占位符{}
	 * 如：{0} is {1} String[]strArr={"a","b"};
	 * 返回结果为 a is b 
	 * @param propertyName
	 * @param strArr
	 * @return
	 */
	public static String getFormatProperty(String propertyName,String[] strArr){
		if (properties == null) {
			logger.error("system error,config properties is null!");
			throw new RuntimeException("系统错误：读取easycode.properties属性失败！");
		} else {	
			String pattern = properties.getProperty(propertyName);
			MessageFormat format = new MessageFormat(pattern);
			return format.format(strArr);
		}
	}
	/**
	 * 配置文件读取
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
