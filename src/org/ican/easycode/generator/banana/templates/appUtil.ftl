package ${metadata.packageName}.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
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