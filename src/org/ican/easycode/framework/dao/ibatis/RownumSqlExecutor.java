package org.ican.easycode.framework.dao.ibatis;

import java.sql.Connection;  
import java.sql.SQLException;  
import org.apache.commons.logging.Log;   
import org.apache.commons.logging.LogFactory;
import org.ican.easycode.framework.dao.ibatis.dialect.*;

import com.ibatis.sqlmap.engine.execution.SqlExecutor;   
import com.ibatis.sqlmap.engine.mapping.statement.RowHandlerCallback;   
import com.ibatis.sqlmap.engine.scope.StatementScope;


public class RownumSqlExecutor extends SqlExecutor {
	private static final Log logger = LogFactory.getLog(RownumSqlExecutor.class);	
    private boolean enableRownum = true;
  
    @Override
    public void executeQuery(StatementScope statementScope, Connection conn, String sql, Object[] parameters, int skipResults, int maxResults,
            RowHandlerCallback callback) throws SQLException {
    	Dialect dialect;
    	long skipResult = 0L;
		long maxResult =  0L;
        if ((skipResults != NO_SKIPPED_RESULTS || maxResults != NO_MAXIMUM_RESULTS) && supportsRownum()) {
        	int DatabaseName = DatabaseProductName.getDatabaseProductName(conn);			
			//System.out.println("数据库产品名:="+DatabaseName);
        	//调用SQL处理方法，重新封装后给到ibatis原始方法使用
			if(DatabaseName==DatabaseProductName.ORACLE){
				dialect = new OracleDialect();
				skipResult = (skipResults-1)*maxResults;
				maxResult =   skipResults*maxResults;
				sql = dialect.getRownumString(sql, skipResult, maxResult);
				logger.debug("----------ORALCE PAGE START SQL------------");
				logger.debug(sql);
				logger.debug("----------ORALCE PAGE END SQL------------");
	           // System.err.println("sql:="+sql);
			}else if(DatabaseName==DatabaseProductName.SQLSERVER){
				dialect = new SQLServerDialect();
				skipResult = (skipResults-1)*maxResults + 1;
				maxResult =   skipResults*maxResults;
				sql = dialect.getRownumString(sql, skipResult, maxResult);
				logger.debug("----------SQLSERVER PAGE START SQL------------");
				logger.debug(sql);
				logger.debug("----------SQLSERVER PAGE END SQL------------");
			}else if(DatabaseName==DatabaseProductName.MYSQL){
				dialect = new MySQLDialect();
				skipResult = (skipResults-1)*maxResults;
				maxResult =   maxResults;
				sql = dialect.getRownumString(sql, skipResult, maxResult);
				logger.debug("----------MYSQL PAGE START SQL------------");
				logger.debug(sql);
				logger.debug("----------MYSQL PAGE END SQL------------");
			}            
            if(logger.isDebugEnabled()) logger.debug(sql);
            //直接设置查询界限值，使handleResults方法不再移动游标进行数据提取
            skipResults = NO_SKIPPED_RESULTS;
            maxResults = NO_MAXIMUM_RESULTS;     
        }       
        super.executeQuery(statementScope, conn, sql, parameters, skipResults, maxResults, callback);
    }   
  
    public boolean supportsRownum() {       
        return true;
    }    
  
    public boolean isEnableRownum() {
        return enableRownum;
    }
  
    public void setEnableRownum(boolean enableRownum) {
        this.enableRownum = enableRownum;
    }  
}
