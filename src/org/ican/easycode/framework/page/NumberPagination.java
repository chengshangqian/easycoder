package org.ican.easycode.framework.page;

/**
 * 数字分页条:计算首页页码和末页页码
 * @author 成尚谦
 * @since 2014-10-02
 */
public class NumberPagination {

	/**
	 * 现有分页对象
	 */
	private Pagination pagination;
	
	/**
	 * 显示的总页数，比如10页
	 */
	private long showPage;
	
	/**
	 * 当数据库中的总页数足够时（大于showPage）， 当前页显示的位置
	 */
	private long currentPageIndex;
	
	/**
	 * 当前页之前的页数
	 */
	private long pageBeforeCurrent;
	
	/**
	 * 当前页之后的页数
	 */
	private long pageAfterCurrent;
	
	/**
	 * 当前页，分页组件默认是第1页
	 */
	private long currentPage;
	
	/**
	 * 真正首页页码：即页数1
	 */
	private long absoluteFirstPage;
	
	/**
	 * 真正末页页码：即总页数，后台数据量和每页条数决定
	 */
	private long absoluteLastPage;
	
	/**
	 * 首页页码
	 */
	private long firstPage;
	
	/**
	 * 末页页码
	 */
	private long lastPage;
	
	/**
	 * 构造方法
	 * @param pagination : 现有分页对象 
	 * @param showPage : 
	 * @param pageBeforeCurrent
	 * @param pageAfterCurrent
	 */
	public NumberPagination(Pagination pagination,long showPage,long currentPageIndex){
		this.pagination = pagination;
		this.showPage = showPage;
		this.currentPageIndex = currentPageIndex;
		this.init();
	}
	
	/**
	 * 初始化必要参数
	 */
	private void init(){
		
		this.pageBeforeCurrent = this.currentPageIndex - 1;
		this.pageAfterCurrent = this.showPage - this.currentPageIndex;
		
		this.currentPage = this.pagination.getCurrent();
		
		this.absoluteFirstPage = 1;//真正首页页码：即页数1
		this.absoluteLastPage = this.pagination.getPages();
	}

	/**
	 * 计算首页页码
	 * @return firstPage
	 */
	public long getFirstPage() {
		
		//相对于当前页的首页页码
		long relativeFirstPage = this.currentPage - this.pageBeforeCurrent;

		//首页页码，默认第一页
		this.firstPage = this.absoluteFirstPage;

		//相对首页页码应该大于等于真正首页页码时：firstPage默认值就为absoluteFirstPage，故条件中省略等于号判断
		if(relativeFirstPage > absoluteFirstPage){
			this.firstPage = relativeFirstPage;
		}

		//当前页为最后N页
		if(this.currentPage >= this.absoluteLastPage - this.pageAfterCurrent){
			this.firstPage = this.absoluteLastPage > this.showPage ? (this.absoluteLastPage - this.showPage + 1) : this.absoluteFirstPage;
		}
		
		return this.firstPage;
	}

	/**
	 * 计算末页页码
	 * @return lastPage
	 */
	public long getLastPage() {
		
		//相对于当前页的末页页码
		long relativeLastPage = this.currentPage + this.pageAfterCurrent;

		//末页页码,默认最后一页
		this.lastPage = this.absoluteLastPage;

		//相对的末页页码小于等于真正末页页码时：lastPage默认值就为absoluteLastPage，故条件中省略等于号判断
		//前提是absoluteLastPage即总页数大于可显示的页数
		if(relativeLastPage < this.absoluteLastPage && this.absoluteLastPage > this.showPage){
			this.lastPage = relativeLastPage;
		}

		//当前页为前面M页
		if(this.currentPage <= this.absoluteFirstPage + this.pageBeforeCurrent){
			this.lastPage = this.absoluteLastPage > this.showPage ? this.showPage : this.absoluteLastPage;
		}
		
		return this.lastPage;
	}
}
