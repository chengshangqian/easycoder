package org.ican.easycode.framework.dao;


import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ican.easycode.framework.dao.ibatis.CountFromIbatis;
import org.ican.easycode.framework.dao.ibatis.RownumSqlExecutor;
import org.ican.easycode.framework.page.PageResult;
import org.ican.easycode.framework.page.Pagination;
import org.ican.easycode.framework.util.ReflectUtil;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.ibatis.sqlmap.engine.impl.ExtendedSqlMapClient;


public class SqlMapBaseDao extends SqlMapClientDaoSupport {
	protected final Log log = LogFactory.getLog(getClass());
	
    private SqlExecutor sqlExecutor;   
    
    public SqlExecutor getSqlExecutor() {   
        return sqlExecutor;   
    }   
  
    public void setSqlExecutor(SqlExecutor sqlExecutor) {   
        this.sqlExecutor = sqlExecutor;   
    }   
  
    public void setEnableRownum(boolean enableRownum) {   
        if (sqlExecutor instanceof RownumSqlExecutor) {   
            ((RownumSqlExecutor)sqlExecutor).setEnableRownum(enableRownum);   
        }   
    }   
  
    /**
     * @author robin@2009-08-18
     * 利用反射机制在底层ExtendedSqlMapClient中放置一个set方法，把当前sqlExecutor放置到框架中
     * initialize在Spring配置中使用init-method对这个bean进行初始化
     */    
    @SuppressWarnings("deprecation")
	public void initialize() throws Exception {
        if (sqlExecutor != null) {   
            SqlMapClient sqlMapClient = getSqlMapClientTemplate().getSqlMapClient();   
            if (sqlMapClient instanceof ExtendedSqlMapClient) {
            	//利用反射在ExtendedSqlMapClient类中创建一个setSqlExecutor(SqlExecutor sqlExecutor)方法后执行把Spring注入的sqlExecutor实例放进框架进行使用
                ReflectUtil.setFieldValue(((ExtendedSqlMapClient)sqlMapClient).getDelegate(), "sqlExecutor", SqlExecutor.class,sqlExecutor);   
            }
        }   
    }	

	public Object insert(String statementName) {
		return getSqlMapClientTemplate().insert(statementName);
	}

	public Object insert(String statementName, Object parameterObject) {
		return getSqlMapClientTemplate().insert(statementName, parameterObject);
	}	
	
	//内存list分页
	public PageResult queryForPageList(String statementName,Object parameterObject,PageResult pr) {
		List list = getSqlMapClientTemplate().queryForList(statementName);		
		pr.setResults(list);
		list.clear();
		list = null;
		return pr;
	}
	
	//分页对象Pagination中的总页数通过扩展类CountFromIbatis来获得
	public List queryForList(String statementName, Pagination pagination) {
		SqlMapClientTemplate sqlMapClientTemplate = getSqlMapClientTemplate();
		CountFromIbatis cfi  = new CountFromIbatis(sqlMapClientTemplate,statementName,null);		
		long skipResults = 0L;
		long maxResults = 0L;
		
		//分页对象为空按标准无参的ibatis方法查询返回
		if(pagination == null) return getSqlMapClientTemplate().queryForList(statementName);
		
		if(!pagination.isNotQueryCount())  pagination.setCount(cfi.getCount());
		if((pagination.getCurrent() - 1L) * pagination.getPageCount() > pagination.getCount()){
			 pagination.setCurrent(1L);
		}	
		
		//skipResults = (pagination.getCurrent()-1L)*pagination.getPageCount();
		//maxResults =  (pagination.getCurrent())*pagination.getPageCount();
		//当前页数
		skipResults = pagination.getCurrent();
		//每页记录数
		maxResults = pagination.getPageCount();
		return sqlMapClientTemplate.queryForList(statementName,(int)skipResults,(int)maxResults);
	}
	
	public List queryForList(String statementName, Object parameterObject, Pagination pagination) {
		SqlMapClientTemplate sqlMapClientTemplate = getSqlMapClientTemplate();
		CountFromIbatis cfi  = new CountFromIbatis(sqlMapClientTemplate, statementName, parameterObject);		
		long skipResults = 0L;
		long maxResults = 0L;		
		//分页对象为空按标准无参的ibatis方法查询返回
		if(pagination == null) return getSqlMapClientTemplate().queryForList(statementName,parameterObject);
		
		if(!pagination.isNotQueryCount())  pagination.setCount(cfi.getCount());
		if((pagination.getCurrent() - 1L) * pagination.getPageCount() > pagination.getCount()){
			 pagination.setCurrent(1L);
		}		
		//skipResults = (pagination.getCurrent()-1L)*pagination.getPageCount();
		//maxResults =  (pagination.getCurrent())*pagination.getPageCount();
		//当前页数
		skipResults = pagination.getCurrent();
		//每页记录数
		maxResults = pagination.getPageCount();
		return sqlMapClientTemplate.queryForList(statementName, parameterObject, (int)skipResults, (int)maxResults);
	}	


	public List queryForList(String statementName) {
		return getSqlMapClientTemplate().queryForList(statementName);
	}	

	public List queryForList(String statementName, Object parameterObject) {
		return getSqlMapClientTemplate().queryForList(statementName,parameterObject);
	}	

	public Map queryForMap(String statementName, Object parameterObject,String keyProperty) {
		return getSqlMapClientTemplate().queryForMap(statementName,	parameterObject, keyProperty);
	}

	public Map queryForMap(String statementName, Object parameterObject,String keyProperty, String valueProperty) {
		return getSqlMapClientTemplate().queryForMap(statementName,
				parameterObject, keyProperty, valueProperty);
	}

	public Object queryForObject(String statementName) {
		return getSqlMapClientTemplate().queryForObject(statementName);
	}

	public Object queryForObject(String statementName, Object parameterObject) {
		return getSqlMapClientTemplate().queryForObject(statementName,	parameterObject);
	}

	public Object queryForObject(String statementName, Object parameterObject,	Object resultObject) {
		return getSqlMapClientTemplate().queryForObject(statementName,parameterObject, resultObject);
	}

	public int update(String statementName) {
		return getSqlMapClientTemplate().update(statementName);
	}

	public int update(String statementName, Object parameterObject) {
		return getSqlMapClientTemplate().update(statementName, parameterObject);
	}

	public void update(String statementName, Object parameterObject,int requiredRowsAffected) {
		getSqlMapClientTemplate().update(statementName, parameterObject,requiredRowsAffected);
	}

	public int delete(String statementName) {
		return getSqlMapClientTemplate().delete(statementName);
	}

	public int delete(String statementName, Object parameterObject) {
		return getSqlMapClientTemplate().delete(statementName, parameterObject);
	}

	public void delete(String statementName, Object parameterObject,int requiredRowsAffected) {
		getSqlMapClientTemplate().delete(statementName, parameterObject,requiredRowsAffected);
		}
	
	

}
