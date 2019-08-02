package org.ican.easycode.framework.dao.ibatis.dialect;

public interface Dialect {
    
    public boolean supportsRownum();
    
    public String getLimitString(String sql, boolean hasOffset);
  
    public String getRownumString(String sql, long pageNum, long pageSize);
    
    public String getRownumString(String sql, long pageNum, long pageSize, String indexKey);
} 