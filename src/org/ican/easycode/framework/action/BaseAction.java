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
 * 所有ACTION继承的基类,继承了ActionSupport
 * 父类ActionSupport定义了SUCCESS，INPUT，LOGIN，ERROR，NONE可以让我们直接返回，规范返回的命名
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
	 * 定义分页对像,在ACTION引用分页时更简单，直接把PG带到需要引用的方法处即可
	 */
	protected Pagination pagination = new Pagination();

	/**
	 * 接收页面表单以MAP对象封装的内容，直接用formMap.get("XXX")获取
	 */
	protected Map<String, String> formMap = new HashMap<String, String>();
	/**
	 * 输出到页面的默认LIST对象，页面直接通过resultList获得，如果页面还需要其他的LIST对象，则另外在ACTION定义，还要加上GET，SET方法
	 */
	protected List resultList = new ArrayList();
	/**
	 * 输出到页面的默认MAP对象，页面直接通过resultMap获得，如果页面还需要其他的MAP对象，则另外在ACTION定义，还要加上GET，SET方法
	 */
	protected Map resultMap = new HashMap();
	/**
	 * 输出到页面的地址（可不用）
	 */
	protected String url;

	/**
	 * 返回当前 HttpServletResponse 对象.
	 * 
	 * @return HttpServletResponse
	 */
	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}
	
	/**
	 * 返回当前 HttpServletRequest 对象.
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
