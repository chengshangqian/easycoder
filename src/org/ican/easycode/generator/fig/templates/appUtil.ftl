package ${metadata.packageName}.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.time.DateUtils;

/**
 * @author ����ǫ
 */
public class AppUtil {

	/**
	 * ֧�ֵ����ڸ�ʽ
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
	 * ģ����ѯͨ���
	 */
	public static final String WILDCARD_PERCENT = "%";
	public static final String WILDCARD_UNDERLINE = "_";
	
	/**
	 * �����ַ�:������
	 */	
	public static final String SYMBOL_SINGLE_QUOTE = "'";
	public static final String SYMBOL_TWO_SINGLE_QUOTE = "''";
	
	/**
	 * ת���
	 */
	public static final String SYMBOL_ESCAPE = "\\";
	
	/**
	 * ����ƥ��֧�ֵ����ڸ�ʽ����String����ת��ΪTimestamp�������ڽ����ݽ���IBATIS����ύ�����ݿⱣ��֮ǰ����ʽ���ַ���������
	 * @param date,�ַ������ڣ�֧�ֵĸ�ʽ���ϲμ�formats
	 * @return
	 * @throws ParseException
	 */
	public static Timestamp toTimestamp(String date) throws ParseException{
		return new Timestamp(toDate(date).getTime());
	}
	
	/**
	 * ����ƥ��֧�ֵ����ڸ�ʽ����String����ת��ΪDate
	 * @param date,�ַ������ڣ�֧�ֵĸ�ʽ���ϲμ�formats
	 * @return
	 * @throws ParseException
	 */
	public static Date toDate(String date) throws ParseException{
		return toDate(date,formats);
	}
	
	/**
	 * ��pattern��ʽ��String����ת��ΪTimestamp�������ڽ����ݽ���IBATIS����ύ�����ݿⱣ��֮ǰ����ʽ���ַ���������
	 * @param date,�ַ�������
	 * @param pattern���ַ��������ڸ�ʽ
	 * @return
	 * @throws ParseException
	 */
	public static Timestamp toTimestamp(String date,String pattern) throws ParseException{
		return new Timestamp(toDate(date,pattern).getTime());
	}
	
	/**
	 * ��pattern��ʽ��String����ת��ΪDate
	 * @param date,�ַ�������
     * @param pattern���ַ��������ڸ�ʽ
	 * @return
	 * @throws ParseException
	 */
	public static Date toDate(String date,String pattern) throws ParseException{
		return toDate(date,new String[]{pattern});
	}
	
	/**
	 * ��ƥ��patterns��ʽ�е�String����ת��ΪDate
	 * @param date,�ַ�������
     * @param patterns���ַ��������ڸ�ʽ����
	 * @return
	 * @throws ParseException
	 */
	private static Date toDate(String date,String[] patterns) throws ParseException{
		return DateUtils.parseDate(date,patterns);
	}

	/**
	 * ��ѯ�������Ƿ����ͨ���
	 * @param searchContent
	 * @return
	 */
	public static final boolean containWildcard(String searchContent){
		return searchContent.contains(WILDCARD_PERCENT) || searchContent.contains(WILDCARD_UNDERLINE);
	}
	
	/**
	 * ��ѯ�������Ƿ����������
	 * @param searchContent
	 * @return
	 */
	public static final boolean containSingleQuote(String searchContent){
		return searchContent.contains(SYMBOL_SINGLE_QUOTE);
	}
	
	/**
	 * ʹ��ת����ͨ����滻��ѯ�����е�ͨ���
	 * @param searchContent
	 * @return
	 */
	public static final String replaceWildcard(String searchContent){
		return searchContent.trim().replace(WILDCARD_PERCENT, SYMBOL_ESCAPE + WILDCARD_PERCENT).replace(WILDCARD_UNDERLINE, SYMBOL_ESCAPE + WILDCARD_UNDERLINE);
	}
	
	/**
	 * ʹ��ת���ĵ������滻��ѯ�����еĵ�����
	 * @param searchContent
	 * @return
	 */
	public static final String replaceSingleQuote(String searchContent){
		return searchContent.trim().replace(SYMBOL_SINGLE_QUOTE, SYMBOL_TWO_SINGLE_QUOTE);
	}	
	
	/**
	 * �ڲ�ѯ����ǰƴ��ͨ���
	 * @param searchContent
	 * @return
	 */
	public static final String prependWildcard(String searchContent){
		return WILDCARD_PERCENT + searchContent;
	}
	
	/**
	 *  �ڲ�ѯ���ݺ�ƴ��ͨ���
	 * @param searchContent
	 * @return
	 */
	public static final String appendWildcard(String searchContent){
		return searchContent + WILDCARD_PERCENT;
	}
	
	/**
	 *  �ڲ�ѯ����ǰ��ƴ��ͨ���
	 * @param searchContent
	 * @return
	 */
	public static final String wrapWildcard(String searchContent){
		return prependWildcard(appendWildcard(searchContent));
	}
	
	
	/**
	 * ��ʽ��ģ����ѯ�ֶε����ݹؼ���
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
	 * ��ʽ��ģ����ѯ�ֶε����ݹؼ���
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
						//��������
						if(AppUtil.containSingleQuote(searchContent)){
							searchContent = AppUtil.replaceSingleQuote(searchContent);
						}	
						
						//����ͨ���������ת�������Ҫ��IBATIS�е�SQL��̬����ת��ؼ��� ESCAPE
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