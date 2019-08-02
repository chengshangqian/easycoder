package org.ican.easycode.framework.dao.ibatis.dialect;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class SQLServerDialect implements Dialect{
	//ibatis执行的SQL不要分号结束符号，否则出语句异常
    protected static final String SQL_END_DELIMITER = " ";
	private static Random gen = new Random();
	
	public static int genRandomDigital(int min, int max) {
		return min + gen.nextInt(max + 1 - min);
	}
	
	public static char genRandomLowerLetter() {
		return new String("qwertyuiopasdfghjklzxcvbnm").charAt(gen.nextInt(26));
	}
	
	public static String genTempTableName(int min, int max) {		
		char[] name = new char[genRandomDigital(min, max)];
		for (int i = 0; i < name.length; i++) {
			name[i] =genRandomLowerLetter();
		}
		return new String(name);
	}
	
	private static boolean isContains(String lineText,String word){
		  Pattern pattern=Pattern.compile(word,Pattern.CASE_INSENSITIVE);
		  Matcher matcher=pattern.matcher(lineText);
		  return matcher.find();	
	}
    
	
    public static int getAfterSelectInsertPoint(String sql) {
        int selectIndex = sql.toLowerCase().indexOf("select");
        int selectDistinctIndex = sql.toLowerCase().indexOf("select distinct");
        return (selectIndex + ((selectDistinctIndex == selectIndex) ? 15 : 6));
      }
    
    public String getLimitString(String sql, boolean hasOffset){
    	return "";
    }
  
    //扩展接口，备用
    public String getRownumString(String sql, long pageNum, long pageSize, String indexKey){
    	sql = sql.trim();
    	if (pageNum == 1) {
			sql = "select top " + pageSize + " * from (" + sql + ") as t1 ";
		} else {
			sql = "select top " + pageSize + " * from (" + sql + ") as t1 "
					+ " where (t1." + indexKey + " > (select max(t3."
					+ indexKey + ")" + " from (select top " + (pageNum - 1)*pageSize + " t2." + indexKey + " from (" + sql
					+ ") as t2 order by t2." + indexKey + ") as t3"
					+ " )) order by t1." + indexKey;
		}
        return sql;
    }    
    
/*    public String getRownumString(String sql, long pageNum, long pageSize){    	
    	if (pageNum > 0) throw new UnsupportedOperationException("sql server has no offset");    	  	
        return new StringBuffer(sql.length() + 8).append(sql).insert(getAfterSelectInsertPoint(trim(sql)), " top " + pageSize).toString();
    }*/
    
	/**
	 * sql server2005分页语句封装
	 * sql包含有order by则自动查找最后一个进行封装
	 * sql如不包含order by抛出RuntimeException，分页功能可能失效，建议使用order by查询
	 * @author robin.hu
	 * @since 2009-8-24 下午13:38:54
	 * @version 1.03
	 */
    public String getRownumString(String querySelect, long offset, long limit){    	
    	String orderby = "";
		String result = "";
		String tempname = genTempTableName(5,10).toUpperCase();
		String headsql = "select * from (";
		String endsql = ") " + tempname + " where " + tempname + ".rownum between " + offset + " and " + limit;
		if (isContains(querySelect, "order\\s+by")) {
			orderby = querySelect.substring(querySelect.toLowerCase().lastIndexOf("order by"));
		} else {
			System.err.println("Statement does not contain order by.");
			throw new RuntimeException("Statement does not contain order by.");
		}
	    
		String newsql = querySelect.toString().substring(0, querySelect.toLowerCase().lastIndexOf("order by"));
		StringBuffer sql = new StringBuffer(newsql.trim().length()+80);		
		sql.append(newsql.trim()).insert(getAfterSelectInsertPoint(querySelect.trim()), " ROW_NUMBER() OVER (" + orderby + ") as rownum,");
	    result = headsql + sql.toString() + endsql;	
		return result;
    }
  
    public boolean supportsRownum() {
        return true;      
    }
  
    private String trim(String sql) {
        sql = sql.trim();
        if (sql.endsWith(SQL_END_DELIMITER)) {
            sql = sql.substring(0, sql.length() - 1 - SQL_END_DELIMITER.length()); 
        }
        return sql;       
    }
    
}
