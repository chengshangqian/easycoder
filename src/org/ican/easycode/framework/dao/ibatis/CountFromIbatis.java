package org.ican.easycode.framework.dao.ibatis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.ibatis.sqlmap.engine.impl.SqlMapClientImpl;
import com.ibatis.sqlmap.engine.impl.SqlMapExecutorDelegate;
import com.ibatis.sqlmap.engine.impl.SqlMapSessionImpl;
import com.ibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import com.ibatis.sqlmap.engine.mapping.result.ResultObjectFactoryUtil;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.ibatis.sqlmap.engine.mapping.statement.MappedStatement;
import com.ibatis.sqlmap.engine.scope.SessionScope;
import com.ibatis.sqlmap.engine.scope.StatementScope;

public class CountFromIbatis {
	public SqlMapClientTemplate sqlMapClientTemplate;
	public String statementName;
	public Object paramObject = null;

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
			name[i] = genRandomLowerLetter();
		}
		return new String(name);
	}

	private static boolean isContains(String lineText, String word) {
		Pattern pattern = Pattern.compile(word, Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(lineText);
		return matcher.find();
	}

	public Object getParamObject() {
		return paramObject;
	}

	public void setParamObject(Object paramObject) {
		this.paramObject = paramObject;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public String getStatementName() {
		return statementName;
	}

	public void setStatementName(String statementName) {
		this.statementName = statementName;
	}

	public CountFromIbatis(SqlMapClientTemplate sqlMapClientTemplate,
			String statementName, Object paramObject) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
		this.statementName = statementName;
		this.paramObject = paramObject;
	}

	@SuppressWarnings("deprecation")
	public long getCount() {
		long count = 0L;
		String sqlstring = "";
		String tempname = genTempTableName(5, 10).toUpperCase();
		String countsql = "select count(*) total from (";
		SqlMapClientImpl client = (SqlMapClientImpl) (sqlMapClientTemplate
				.getSqlMapClient());
		try {
			SqlMapSessionImpl sqlMapSessionImpl = (SqlMapSessionImpl) client.openSession();
			SqlMapExecutorDelegate delegate = sqlMapSessionImpl.getDelegate();
			client.startTransaction();
			Connection con = client.getCurrentConnection();
			int DatabaseName = DatabaseProductName.getDatabaseProductName(con);

			MappedStatement ms = client.getMappedStatement(statementName);
			SessionScope sessionScope = sqlMapSessionImpl.getSessionScope();
			StatementScope statmentScope = delegate.beginStatementScope(
					sessionScope, ms);
			
			try{
			SqlExecutor executor = ms.getSqlExecutor();

			Sql sql = ms.getSql();
			ParameterMap map = sql.getParameterMap(statmentScope, paramObject);

			sqlstring = sql.getSql(statmentScope, paramObject);
			if (DatabaseName == DatabaseProductName.SQLSERVER
					&& isContains(sqlstring, "order\\s+by")) {
				sqlstring = sqlstring.substring(0, sqlstring.toLowerCase()
						.lastIndexOf("order by"));
			}
			sqlstring = countsql + sqlstring.trim() + ") " + tempname;

			ResultObjectFactoryUtil.setResultObjectFactory(client
					.getResultObjectFactory());
			ResultObjectFactoryUtil.setStatementId(statmentScope.getStatement()
					.getId());

			PreparedStatement ps = null;
			Integer rsType = statmentScope.getStatement().getResultSetType();
			if (rsType != null) {
				ps = executor.prepareStatement(statmentScope.getSession(), con,
						sqlstring, rsType);
			} else {
				ps = SqlExecutor.prepareStatement(statmentScope.getSession(),
						con, sqlstring);
			}
			Object[] parameters = map.getParameterObjectValues(statmentScope,
					paramObject);
			Integer fetchSize = statmentScope.getStatement().getFetchSize();
			if (fetchSize != null) {
				ps.setFetchSize(fetchSize.intValue());
			}
			statmentScope.setParameterMap(map);
			if (statmentScope.getParameterMap() != null) {
				statmentScope.getParameterMap().setParameters(statmentScope,
						ps, parameters);
			}

			if (con != null && sqlstring.length() > countsql.length()) {
				ResultSet rs = null;
				try {
					rs = ps.executeQuery();
					while (rs.next()) {
						count = rs.getInt("total");
					}
				} catch (SQLException se) {
					se.printStackTrace();
				} finally {
					if (rs != null) {
						try {
							rs.close();
						} catch (SQLException e) {
							// ignore
						}
					}
					if (ps != null) {
						if (!sessionScope.hasPreparedStatement(ps)) {
							try {
								ps.close();
							} catch (SQLException e) {
								// ignore
							}
						}
					}
					if (con != null) {
							try {
								con.close();
							} catch (SQLException e) {
								// ignore
							}
					}
				}
			}
			}finally{
				statmentScope.getSession().decrementRequestStackDepth();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				client.commitTransaction();
			} catch (SQLException se) {
				se.getMessage();
			}
		}
		return count;
	}

}
