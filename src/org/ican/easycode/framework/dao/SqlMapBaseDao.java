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
     * ���÷�������ڵײ�ExtendedSqlMapClient�з���һ��set�������ѵ�ǰsqlExecutor���õ������
     * initialize��Spring������ʹ��init-method�����bean���г�ʼ��
     */    
    @SuppressWarnings("deprecation")
	public void initialize() throws Exception {
        if (sqlExecutor != null) {   
            SqlMapClient sqlMapClient = getSqlMapClientTemplate().getSqlMapClient();   
            if (sqlMapClient instanceof ExtendedSqlMapClient) {
            	//���÷�����ExtendedSqlMapClient���д���һ��setSqlExecutor(SqlExecutor sqlExecutor)������ִ�а�Springע���sqlExecutorʵ���Ž���ܽ���ʹ��
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
	
	//�ڴ�list��ҳ
	public PageResult queryForPageList(String statementName,Object parameterObject,PageResult pr) {
		List list = getSqlMapClientTemplate().queryForList(statementName);		
		pr.setResults(list);
		list.clear();
		list = null;
		return pr;
	}
	
	//��ҳ����Pagination�е���ҳ��ͨ����չ��CountFromIbatis�����
	public List queryForList(String statementName, Pagination pagination) {
		SqlMapClientTemplate sqlMapClientTemplate = getSqlMapClientTemplate();
		CountFromIbatis cfi  = new CountFromIbatis(sqlMapClientTemplate,statementName,null);		
		long skipResults = 0L;
		long maxResults = 0L;
		
		//��ҳ����Ϊ�հ���׼�޲ε�ibatis������ѯ����
		if(pagination == null) return getSqlMapClientTemplate().queryForList(statementName);
		
		if(!pagination.isNotQueryCount())  pagination.setCount(cfi.getCount());
		if((pagination.getCurrent() - 1L) * pagination.getPageCount() > pagination.getCount()){
			 pagination.setCurrent(1L);
		}	
		
		//skipResults = (pagination.getCurrent()-1L)*pagination.getPageCount();
		//maxResults =  (pagination.getCurrent())*pagination.getPageCount();
		//��ǰҳ��
		skipResults = pagination.getCurrent();
		//ÿҳ��¼��
		maxResults = pagination.getPageCount();
		return sqlMapClientTemplate.queryForList(statementName,(int)skipResults,(int)maxResults);
	}
	
	public List queryForList(String statementName, Object parameterObject, Pagination pagination) {
		SqlMapClientTemplate sqlMapClientTemplate = getSqlMapClientTemplate();
		CountFromIbatis cfi  = new CountFromIbatis(sqlMapClientTemplate, statementName, parameterObject);		
		long skipResults = 0L;
		long maxResults = 0L;		
		//��ҳ����Ϊ�հ���׼�޲ε�ibatis������ѯ����
		if(pagination == null) return getSqlMapClientTemplate().queryForList(statementName,parameterObject);
		
		if(!pagination.isNotQueryCount())  pagination.setCount(cfi.getCount());
		if((pagination.getCurrent() - 1L) * pagination.getPageCount() > pagination.getCount()){
			 pagination.setCurrent(1L);
		}		
		//skipResults = (pagination.getCurrent()-1L)*pagination.getPageCount();
		//maxResults =  (pagination.getCurrent())*pagination.getPageCount();
		//��ǰҳ��
		skipResults = pagination.getCurrent();
		//ÿҳ��¼��
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
