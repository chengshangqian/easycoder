package ${metadata.packageName}.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
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
	 * 模糊查询通配符
	 */
	public static final String WILDCARD_PERCENT = "%";
	public static final String WILDCARD_UNDERLINE = "_";
	
	/**
	 * 特殊字符:单引号
	 */	
	public static final String SYMBOL_SINGLE_QUOTE = "'";
	public static final String SYMBOL_TWO_SINGLE_QUOTE = "''";
	
	/**
	 * 转义符
	 */
	public static final String SYMBOL_ESCAPE = "\\";
	
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
	 * 查询内容中是否包含通配符
	 * @param searchContent
	 * @return
	 */
	public static final boolean containWildcard(String searchContent){
		return searchContent.contains(WILDCARD_PERCENT) || searchContent.contains(WILDCARD_UNDERLINE);
	}
	
	/**
	 * 查询内容中是否包含单引号
	 * @param searchContent
	 * @return
	 */
	public static final boolean containSingleQuote(String searchContent){
		return searchContent.contains(SYMBOL_SINGLE_QUOTE);
	}
	
	/**
	 * 使用转义后的通配符替换查询内容中的通配符
	 * @param searchContent
	 * @return
	 */
	public static final String replaceWildcard(String searchContent){
		return searchContent.trim().replace(WILDCARD_PERCENT, SYMBOL_ESCAPE + WILDCARD_PERCENT).replace(WILDCARD_UNDERLINE, SYMBOL_ESCAPE + WILDCARD_UNDERLINE);
	}
	
	/**
	 * 使用转义后的单引号替换查询内容中的单引号
	 * @param searchContent
	 * @return
	 */
	public static final String replaceSingleQuote(String searchContent){
		return searchContent.trim().replace(SYMBOL_SINGLE_QUOTE, SYMBOL_TWO_SINGLE_QUOTE);
	}	
	
	/**
	 * 在查询内容前拼接通配符
	 * @param searchContent
	 * @return
	 */
	public static final String prependWildcard(String searchContent){
		return WILDCARD_PERCENT + searchContent;
	}
	
	/**
	 *  在查询内容后拼接通配符
	 * @param searchContent
	 * @return
	 */
	public static final String appendWildcard(String searchContent){
		return searchContent + WILDCARD_PERCENT;
	}
	
	/**
	 *  在查询内容前后拼接通配符
	 * @param searchContent
	 * @return
	 */
	public static final String wrapWildcard(String searchContent){
		return prependWildcard(appendWildcard(searchContent));
	}
	
	
	/**
	 * 格式化模糊查询字段的内容关键字
	 * @param valueMap
	 * @param fuzzyQueryColumns
	 * @return
	 */
	public static final Map<String,String> fitFuzzyQuery(Map<String, String> valueMap,List<String> fuzzyQueryColumns){
		if(null != valueMap){
			if(null != fuzzyQueryColumns && !fuzzyQueryColumns.isEmpty()){
				return fitFuzzyQuery(valueMap,fuzzyQueryColumns.toArray(new String[fuzzyQueryColumns.size()]));
			}
		}
		
		return valueMap;
	}	
	
	/**
	 * 格式化模糊查询字段的内容关键字
	 * @param valueMap
	 * @param fuzzyQueryColumns
	 * @return
	 */
	public static final Map<String,String> fitFuzzyQuery(Map<String, String> valueMap,String[] fuzzyQueryColumns){
		if(null != valueMap){
			if(null != fuzzyQueryColumns && fuzzyQueryColumns.length > 0){
				for(String columnName : fuzzyQueryColumns){
					String searchContent = valueMap.get(columnName);
					if(null != searchContent && !"".equals(searchContent.trim())){
						//处理单引号
						if(AppUtil.containSingleQuote(searchContent)){
							searchContent = AppUtil.replaceSingleQuote(searchContent);
						}	
						
						//处理通配符，增加转义符，需要在IBATIS中的SQL动态启用转义关键字 ESCAPE
						if(AppUtil.containWildcard(searchContent)){
							valueMap.put(columnName + "__","Y");
							searchContent = AppUtil.replaceWildcard(searchContent);
						}
						valueMap.put(columnName, searchContent);
						//valueMap.put(columnName, AppUtil.wrapWildcard(searchContent));
					}					
				}							
			}
		}
		
		return valueMap;
	}
	
	/**
	 * Get Css Image Path
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String getCssImageServerPath(HttpServletRequest request,Map resultMap){
		String path = "http://css.gzedu.com/gzzgjy/gzzgjy_lms";
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