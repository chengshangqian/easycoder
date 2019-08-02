package org.ican.easycode.generator.common.util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.ican.easycode.generator.common.model.MDColumn;
import org.ican.easycode.generator.common.model.MDPrimaryKey;
import org.ican.easycode.generator.common.model.MDTable;

public class MDQueryRunner{
	private Logger log = Logger.getLogger(MDQueryRunner.class);
	private ThreadLocal<Connection> connectionThread = new ThreadLocal<Connection>();
	private Connection connection;
	
	private String driverClassName,url,username,password;
	
	public String getDriverClassName() {
		return driverClassName;
	}

	public void setDriverClassName(String driverClassName) {
		this.driverClassName = driverClassName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public MDQueryRunner(){
		
	}
	
	private Connection getConnection(){
		if(null == this.connectionThread.get()){
			try{
				Class.forName(driverClassName); 
				this.connection = DriverManager.getConnection(url , username , password );
				this.connectionThread.set(this.connection);
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
		}
		else{
			this.connection = this.connectionThread.get();
		}
		
		return this.connection;
	}	
	
	private DatabaseMetaData getDatabaseMetaData() throws SQLException{
		DatabaseMetaData databaseMetaData = this.getConnection().getMetaData();
		return databaseMetaData;
	}
	
	public List<MDTable> getTables(String tableNamePattern,String[] types) throws SQLException{
		List<MDTable> tables = new ArrayList<MDTable>();
		ResultSet rs = this.getDatabaseMetaData().getTables(null, username.toUpperCase(), tableNamePattern, types);
		if(null != rs){
			while(rs.next()){
				MDTable mdTable = new MDTable();
				mdTable.setTableCat(rs.getString("TABLE_CAT"));
				mdTable.setTableSchem(rs.getString("TABLE_SCHEM"));
				mdTable.setTableName(rs.getString("TABLE_NAME"));
				mdTable.setTableType(rs.getString("TABLE_TYPE"));
				mdTable.setRemarks(rs.getString("REMARKS"));
				try {
					mdTable.setTypeCat(rs.getString("TYPE_CAT"));
					mdTable.setTypeSchem(rs.getString("TYPE_SCHEM"));
					mdTable.setTypeName(rs.getString("TYPE_NAME"));
					mdTable.setSelfReferencingColName(rs.getString("SELF_REFERENCING_COL_NAME"));
					mdTable.setRefGeneration(rs.getString("REF_GENERATION"));
				}
				catch (Exception e) {
					log.error(e.getMessage());
				}
				tables.add(mdTable);
			}
		}
		if(null != rs){
			rs.close();
			rs = null;
		}
		log.debug("tables : " + tables.size());
		return tables;
	}
	
	public List<MDColumn> getColumns(String tableNamePattern, String columnNamePattern) throws SQLException{
		List<MDColumn> columns = new ArrayList<MDColumn>(); 
		ResultSet rs = this.getDatabaseMetaData().getColumns(null, username.toUpperCase(), tableNamePattern, columnNamePattern);
		if(null != rs){
			while(rs.next()){
				MDColumn mdColumn = new MDColumn();
				mdColumn.setColumnName(rs.getString("COLUMN_NAME").toUpperCase());
				mdColumn.setColumnSize(rs.getLong("COLUMN_SIZE"));
				mdColumn.setIsNullable(rs.getString("IS_NULLABLE"));
				mdColumn.setTableName(rs.getString("TABLE_NAME"));
				mdColumn.setTypeName(rs.getString("TYPE_NAME").toUpperCase());
				//ת��Ϊ�����������ı�׼����
				String standardType = MROUtil.getStandardTypeMapping(mdColumn.getTypeName());
				mdColumn.setStandardType(standardType);
				//�����������͵ĸ�ʽ
				if(MROUtil.TYPE_DATE.equals(standardType)){
					mdColumn.setFormat(MROUtil.FORMAT_DATE);
				}
				String remarks = rs.getString("REMARKS");
				if(null == remarks || "".equals(remarks.trim())){
					remarks = mdColumn.getColumnName();
				}
				mdColumn.setRemarks(remarks);
				
				try {
					mdColumn.setColumnDef(rs.getString("COLUMN_DEF"));
					mdColumn.setBufferLength(rs.getString("BUFFER_LENGTH"));
					mdColumn.setCharOctetLength(rs.getLong("CHAR_OCTET_LENGTH"));
					mdColumn.setDataType(rs.getLong("DATA_TYPE"));
					mdColumn.setDecimalDigits(rs.getLong("DECIMAL_DIGITS"));
					mdColumn.setNullable(rs.getLong("NULLABLE"));
					mdColumn.setNumPrecRadix(rs.getLong("NUM_PREC_RADIX"));
					mdColumn.setOrdinalPosition(rs.getLong("ORDINAL_POSITION"));
					mdColumn.setScopeSchem(rs.getString("SCOPE_SCHEM"));
					mdColumn.setIsAutoincrement(rs.getString("IS_AUTOINCREMENT"));
					mdColumn.setScopeCatlog(rs.getString("SCOPE_CATLOG"));
					mdColumn.setTableSchem(rs.getString("TABLE_SCHEM"));
					mdColumn.setScopeTable(rs.getString("SCOPE_TABLE"));
					mdColumn.setSourceDataType(rs.getLong("SOURCE_DATA_TYPE"));
					mdColumn.setSqlDataType(rs.getLong("SQL_DATA_TYPE"));
					mdColumn.setSqlDatetimeSub(rs.getLong("SQL_DATETIME_SUB"));
					mdColumn.setTableCat(rs.getString("TABLE_CAT"));
				}
				catch (Exception e) {
					log.info(e.getMessage());
				}

				columns.add(mdColumn);
			}
		}	
		if(null != rs){
			rs.close();
			rs = null;
		}
		log.debug("columns : " + columns.size());
		return columns;
	}
	
	public List<MDPrimaryKey> getPrimaryKeys(String tableNamePattern) throws SQLException{
		List<MDPrimaryKey> primaryKeys = new ArrayList<MDPrimaryKey>(); 
		ResultSet rs = this.getDatabaseMetaData().getPrimaryKeys(null, username.toUpperCase(), tableNamePattern);
		if(null != rs){
			while(rs.next()){
				MDPrimaryKey mdPrimaryKey = new MDPrimaryKey();
				mdPrimaryKey.setTableName(rs.getString("TABLE_NAME"));
				mdPrimaryKey.setColumnName(rs.getString("COLUMN_NAME"));
				try {
					mdPrimaryKey.setTableCat(rs.getString("TABLE_CAT"));
					mdPrimaryKey.setTableSchem(rs.getString("TABLE_SCHEM"));
					mdPrimaryKey.setKeySeq(rs.getLong("KEY_SEQ"));
					mdPrimaryKey.setPkName(rs.getString("PK_NAME"));
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				primaryKeys.add(mdPrimaryKey);
			}
		}
		if(null != rs){
			rs.close();
			rs = null;
		}
		log.debug("primaryKeys : " + primaryKeys.size());
		return primaryKeys;
	}
	
	public void clear(){
		if(null != this.connection){
			try {
				this.connection.close();
				this.connection = null;
				this.connectionThread.set(null);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}	
}
