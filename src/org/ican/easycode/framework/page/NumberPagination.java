package org.ican.easycode.framework.page;

/**
 * ���ַ�ҳ��:������ҳҳ���ĩҳҳ��
 * @author ����ǫ
 * @since 2014-10-02
 */
public class NumberPagination {

	/**
	 * ���з�ҳ����
	 */
	private Pagination pagination;
	
	/**
	 * ��ʾ����ҳ��������10ҳ
	 */
	private long showPage;
	
	/**
	 * �����ݿ��е���ҳ���㹻ʱ������showPage���� ��ǰҳ��ʾ��λ��
	 */
	private long currentPageIndex;
	
	/**
	 * ��ǰҳ֮ǰ��ҳ��
	 */
	private long pageBeforeCurrent;
	
	/**
	 * ��ǰҳ֮���ҳ��
	 */
	private long pageAfterCurrent;
	
	/**
	 * ��ǰҳ����ҳ���Ĭ���ǵ�1ҳ
	 */
	private long currentPage;
	
	/**
	 * ������ҳҳ�룺��ҳ��1
	 */
	private long absoluteFirstPage;
	
	/**
	 * ����ĩҳҳ�룺����ҳ������̨��������ÿҳ��������
	 */
	private long absoluteLastPage;
	
	/**
	 * ��ҳҳ��
	 */
	private long firstPage;
	
	/**
	 * ĩҳҳ��
	 */
	private long lastPage;
	
	/**
	 * ���췽��
	 * @param pagination : ���з�ҳ���� 
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
	 * ��ʼ����Ҫ����
	 */
	private void init(){
		
		this.pageBeforeCurrent = this.currentPageIndex - 1;
		this.pageAfterCurrent = this.showPage - this.currentPageIndex;
		
		this.currentPage = this.pagination.getCurrent();
		
		this.absoluteFirstPage = 1;//������ҳҳ�룺��ҳ��1
		this.absoluteLastPage = this.pagination.getPages();
	}

	/**
	 * ������ҳҳ��
	 * @return firstPage
	 */
	public long getFirstPage() {
		
		//����ڵ�ǰҳ����ҳҳ��
		long relativeFirstPage = this.currentPage - this.pageBeforeCurrent;

		//��ҳҳ�룬Ĭ�ϵ�һҳ
		this.firstPage = this.absoluteFirstPage;

		//�����ҳҳ��Ӧ�ô��ڵ���������ҳҳ��ʱ��firstPageĬ��ֵ��ΪabsoluteFirstPage����������ʡ�Ե��ں��ж�
		if(relativeFirstPage > absoluteFirstPage){
			this.firstPage = relativeFirstPage;
		}

		//��ǰҳΪ���Nҳ
		if(this.currentPage >= this.absoluteLastPage - this.pageAfterCurrent){
			this.firstPage = this.absoluteLastPage > this.showPage ? (this.absoluteLastPage - this.showPage + 1) : this.absoluteFirstPage;
		}
		
		return this.firstPage;
	}

	/**
	 * ����ĩҳҳ��
	 * @return lastPage
	 */
	public long getLastPage() {
		
		//����ڵ�ǰҳ��ĩҳҳ��
		long relativeLastPage = this.currentPage + this.pageAfterCurrent;

		//ĩҳҳ��,Ĭ�����һҳ
		this.lastPage = this.absoluteLastPage;

		//��Ե�ĩҳҳ��С�ڵ�������ĩҳҳ��ʱ��lastPageĬ��ֵ��ΪabsoluteLastPage����������ʡ�Ե��ں��ж�
		//ǰ����absoluteLastPage����ҳ�����ڿ���ʾ��ҳ��
		if(relativeLastPage < this.absoluteLastPage && this.absoluteLastPage > this.showPage){
			this.lastPage = relativeLastPage;
		}

		//��ǰҳΪǰ��Mҳ
		if(this.currentPage <= this.absoluteFirstPage + this.pageBeforeCurrent){
			this.lastPage = this.absoluteLastPage > this.showPage ? this.showPage : this.absoluteLastPage;
		}
		
		return this.lastPage;
	}
}
