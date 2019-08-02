package org.ican.easycode.framework.dao.ibatis.dialect;

import java.util.Random;

public class OracleDialect implements Dialect{
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
    
    public String getLimitString(String sql, boolean hasOffset){
    	return "";
    }
    
    public String getRownumString(String sql, long pageNum, long pageSize, String indexKey){
    	return "";
    }
  
    public String getRownumString(String sql, long offset, long limit){
    	 String R = genTempTableName(5,10).toUpperCase();
    	 sql = trim(sql);
    	 StringBuffer sqlx = new StringBuffer(sql.length() + 100);    	         
         sqlx.append(" select *");
         sqlx.append(" from (select a.* ").append(",ROWNUM as ");
         sqlx.append(R);
         sqlx.append(" from (").append(sql).append(") a ) b");        
         if(limit <= 0L){
             sqlx.append(" where ");
             sqlx.append(R);
             sqlx.append(" <= ").append(0L).append(SQL_END_DELIMITER);;
         } else {
             sqlx.append(" where ");
             sqlx.append(R);
             sqlx.append(" > ").append(offset);
             sqlx.append(" and ");
             sqlx.append(R);
             sqlx.append(" <= ").append(limit).append(SQL_END_DELIMITER);
         }
         return sqlx.toString();
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
