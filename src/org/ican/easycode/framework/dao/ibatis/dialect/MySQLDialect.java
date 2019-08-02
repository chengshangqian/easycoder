package org.ican.easycode.framework.dao.ibatis.dialect;

public class MySQLDialect  implements Dialect{
    //ibatis执行的SQL不要分号结束符号，否则出语句异常
    protected static final String SQL_END_DELIMITER = " ";
  
    public String getLimitString(String sql, boolean hasOffset) {   
        return new StringBuffer(sql.length() + 20).append(trim(sql)).append(   
                hasOffset ? " limit ?,?" : " limit ?").append(SQL_END_DELIMITER).toString();   
    }
    
    public String getRownumString(String sql, long pageNum, long pageSize, String indexKey){
    	return "";
    }
  
    public String getRownumString(String sql, long offset, long limit) {   
        sql = trim(sql);   
        StringBuffer sb = new StringBuffer(sql.length() + 20);   
        sb.append(sql);   
        if (offset > 0) {   
            sb.append(" limit ").append(offset).append(',').append(limit).append(SQL_END_DELIMITER);   
        } else {   
            sb.append(" limit ").append(limit).append(SQL_END_DELIMITER);   
        }   
        return sb.toString();   
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
