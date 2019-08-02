<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="GBK"></xsl:output>
	<xsl:template match="/">
package <xsl:value-of select="metadata/packageName" />.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.time.DateUtils;

/**
 * @author s2sicoder
 */
public class AppUtil {
	/**
	 * Date formats
	 */
	public static final String[] formats = new String[] { "yyyy-MM", "yyyyMM",
			"yyyy/MM", "yyyyMMdd", "yyyy-MM-dd", "yyyy/MM/dd",
			"yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss", "yyyy/MM/dd HH:mm:ss" };
	
	/**
	 * Transform String to Timestamp
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static Timestamp toTimestamp(String date) throws ParseException{
		return new Timestamp(toDate(date).getTime());
	}
	
	/**
	 * Transform String to Date
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static Date toDate(String date) throws ParseException{
		return DateUtils.parseDate(date,formats);
	}
	
	/**
	 * Get Css Image Path
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String getCssImageServerPath(HttpServletRequest request,Map resultMap){
		String path = "";
		//path = AppConfig.getProperty("web.system.css.url");
		return path;
	}
	
	
	/**
	 * Get Css Image Path
	 * @return
	 */
	public static String getCssImageServerPath(){
		return getCssImageServerPath(null,null);
	}
	
	public static String getUploadAction(){
		return getUploadAction(null,null);
	}
	
	@SuppressWarnings("unchecked")
	public static String getUploadAction(HttpServletRequest request,Map resultMap){
		String uploadAction = "";
		//uploadAction = "/nes/file/upload/ajaxUpload.do";
		return uploadAction;
	}	
}
	</xsl:template>
</xsl:stylesheet>