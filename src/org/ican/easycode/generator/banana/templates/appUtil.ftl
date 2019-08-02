package ${metadata.packageName}.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.time.DateUtils;

/**
 * @author 成尚谦
 */
public class AppUtil {

	/**
	 * 支持的日期格式
	 */
	public static final String[] formats = new String[] { 
		    "yyyy-MM"
		    , "yyyyMMdd HH:mm","yyyy/MM/dd HH:mm" ,"yyyy-MM-dd HH:mm"
		    , "yyyyMMdd HH","yyyy/MM/dd HH" ,"yyyy-MM-dd HH" 
		    , "yyyyMMddHHmmss","yyyyMMdd HH:mm:ss", "yyyy-MM-dd HH:mm:ss", "yyyy/MM/dd HH:mm:ss"
		    , "yyyy-MM-dd HH:mm:ss.SSS"
		    , "yyyyMMdd", "yyyy-MM-dd", "yyyy/MM/dd"
		    , "yyyyMM","yyyy/MM"
		    , "yyyy"};	
	
	/**
	 * 智能匹配支持的日期格式，将String日期转换为Timestamp，常用于将数据交由IBATIS组件提交到数据库保存之前，格式化字符串的日期
	 * @param date,字符串日期，支持的格式集合参见formats
	 * @return
	 * @throws ParseException
	 */
	public static Timestamp toTimestamp(String date) throws ParseException{
		return new Timestamp(toDate(date).getTime());
	}
	
	/**
	 * 智能匹配支持的日期格式，将String日期转换为Date
	 * @param date,字符串日期，支持的格式集合参见formats
	 * @return
	 * @throws ParseException
	 */
	public static Date toDate(String date) throws ParseException{
		return toDate(date,formats);
	}
	
	/**
	 * 将pattern格式的String日期转换为Timestamp，常用于将数据交由IBATIS组件提交到数据库保存之前，格式化字符串的日期
	 * @param date,字符串日期
	 * @param pattern，字符串的日期格式
	 * @return
	 * @throws ParseException
	 */
	public static Timestamp toTimestamp(String date,String pattern) throws ParseException{
		return new Timestamp(toDate(date,pattern).getTime());
	}
	
	/**
	 * 将pattern格式的String日期转换为Date
	 * @param date,字符串日期
     * @param pattern，字符串的日期格式
	 * @return
	 * @throws ParseException
	 */
	public static Date toDate(String date,String pattern) throws ParseException{
		return toDate(date,new String[]{pattern});
	}
	
	/**
	 * 将匹配patterns格式中的String日期转换为Date
	 * @param date,字符串日期
     * @param patterns，字符串的日期格式集合
	 * @return
	 * @throws ParseException
	 */
	private static Date toDate(String date,String[] patterns) throws ParseException{
		return DateUtils.parseDate(date,patterns);
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