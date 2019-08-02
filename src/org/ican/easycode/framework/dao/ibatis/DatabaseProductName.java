package org.ican.easycode.framework.dao.ibatis;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;

public class DatabaseProductName {
	public static int ORACLE = 1;
	public static int MYSQL = 2;
	public static int SQLSERVER = 3;
	public static int SYBASE = 4;
	public static int DB2 = 5;
	

	public DatabaseProductName() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    public static int getDatabaseProductName(Connection conn) throws SQLException{
    	int result = 0;
    	if(conn!=null) {
    		DatabaseMetaData dme = conn.getMetaData();
    		String name = dme.getDatabaseProductName().toUpperCase();
    		if(name.indexOf("ORACLE")>-1){
    			result = ORACLE;
    		}else if(name.indexOf("MYSQL")>-1){
    			result = MYSQL;
    		}else if(name.indexOf("MICROSOFT")>-1){
    			//SQL SERVER元数据返回值为Microsoft SQL Server
    			result = SQLSERVER;
    		}else if(name.indexOf("SYBASE")>-1){
    			result = SYBASE;
    		}else if(name.indexOf("DB2")>-1){
    			result = DB2;
    		}    		   		    		
    	}
    	return result;
    }
}
