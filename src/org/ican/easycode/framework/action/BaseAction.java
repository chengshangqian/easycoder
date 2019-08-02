package org.ican.easycode.framework.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.ican.easycode.framework.page.Pagination;


import com.opensymphony.xwork2.ActionSupport;

/**
 * ����ACTION�̳еĻ���,�̳���ActionSupport
 * ����ActionSupport������SUCCESS��INPUT��LOGIN��ERROR��NONE����������ֱ�ӷ��أ��淶���ص�����
 * 
 * @author zhangyq
 * @time 2009-04-24
 */
public class BaseAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 1L;

	protected final Log log = LogFactory.getLog(getClass());

	protected HttpServletRequest request;

	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	/**
	 * �����ҳ����,��ACTION���÷�ҳʱ���򵥣�ֱ�Ӱ�PG������Ҫ���õķ���������
	 */
	protected Pagination pagination = new Pagination();

	/**
	 * ����ҳ�����MAP�����װ�����ݣ�ֱ����formMap.get("XXX")��ȡ
	 */
	protected Map<String, String> formMap = new HashMap<String, String>();
	/**
	 * �����ҳ���Ĭ��LIST����ҳ��ֱ��ͨ��resultList��ã����ҳ�滹��Ҫ������LIST������������ACTION���壬��Ҫ����GET��SET����
	 */
	protected List resultList = new ArrayList();
	/**
	 * �����ҳ���Ĭ��MAP����ҳ��ֱ��ͨ��resultMap��ã����ҳ�滹��Ҫ������MAP������������ACTION���壬��Ҫ����GET��SET����
	 */
	protected Map resultMap = new HashMap();
	/**
	 * �����ҳ��ĵ�ַ���ɲ��ã�
	 */
	protected String url;

	/**
	 * ���ص�ǰ HttpServletResponse ����.
	 * 
	 * @return HttpServletResponse
	 */
	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}
	
	/**
	 * ���ص�ǰ HttpServletRequest ����.
	 * 
	 * @return HttpServletRequest
	 */
	protected HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}


	/**
	 * @return the pagination
	 */
	public Pagination getPagination() {
		return pagination;
	}

	/**
	 * @param pagination the pagination to set
	 */
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public Map<String, String> getFormMap() {
		return formMap;
	}

	public void setFormMap(Map<String, String> formMap) {
		this.formMap = formMap;
	}

	public List getResultList() {
		return resultList;
	}

	public void setResultList(List resultList) {
		this.resultList = resultList;
	}

	public Map getResultMap() {
		return resultMap;
	}

	public void setResultMap(Map resultMap) {
		this.resultMap = resultMap;
	}

}
