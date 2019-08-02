package org.ican.easycode.framework.page;

import java.util.ArrayList;
import java.util.List;

public class PageResult {
	private int totalResults = 1;
	private int totalPages = 1;
	private int pageNumber = 1;
	private int pageSize = 20;
	private boolean hasNext = false;
	private boolean hasPrior = false;
	private List results = null;
	private List<Integer> pages = new ArrayList<Integer>();
	private int navigationSize = 7;
	
	public PageResult(){
		this.setPages();
	}
	
	//由当前页和每页显示记录数构造分页对象
	public PageResult(int pageNumber,int pageSize){
		this.setPageNumber(pageNumber);
		this.setPageSize(pageSize);
		this.setPages();		
	}	
	
/*	public PageResult(int totalResults,int pageNumber){
		this.setTotalResults(totalResults);
		this.totalPages = this.totalResults % pageSize == 0 ? totalResults / pageSize : this.totalResults / pageSize + 1; 
		this.setPageNumber(pageNumber);
		this.setPages();
		this.hasNext = this.totalPages > this.pageNumber ? true : false;
		this.hasPrior = this.pageNumber > 1 ? true : false;
	}*/
	
	public boolean isHasNext(){
		return hasNext;
	}
	
	public void setHasNext(boolean hasNext)	{
		this.hasNext = hasNext;
	}
	
	public boolean isHasPrior()	{
		return hasPrior;
	}
	
	public void setHasPrior(boolean hasPrior){
		this.hasPrior = hasPrior;
	}
	
	public int getPageNumber(){
		return pageNumber;
	}
	
	public void setPageNumber(int pageNumber){
		if(pageNumber < 1){
			this.pageNumber = 1;
		}else if(pageNumber > this.totalPages){
			this.pageNumber = this.totalPages;
		}else{
			this.pageNumber = pageNumber;
		}
	}
	
	public int getPageSize(){
		return pageSize;
	}
	
	public void setPageSize(int pageSize){
		this.pageSize = pageSize;
	}
	
	public int getTotalPages(){
		return totalPages;
	}
	
	public void setTotalPages(int totalPages){
		this.totalPages = totalPages;
	}
	
	public int getTotalResults(){
		return totalResults;
	}
	
	public void setTotalResults(int totalResults){
		this.totalResults = totalResults;
	}
	
	public List getResults(){
		return this.results;
	}
	
	public void setResults(List l){
		if(l.size()>0 && l!=null) this.setTotalResults(l.size());
		this.totalPages = this.totalResults % pageSize == 0 ? totalResults / pageSize : this.totalResults / pageSize + 1; 
		this.hasNext = this.totalPages > this.pageNumber ? true : false;
		this.hasPrior = this.pageNumber > 1 ? true : false;
		
		int start = 0;
		int end = 0;		
		start = this.pageSize*(this.pageNumber-1);
		end = this.pageSize*this.pageNumber;
		if(end > this.totalResults)  end = this.totalResults;		
				
		this.results = l.subList(start, end);
	}
	
	public void setPages()	{
		int[] values = new int[this.navigationSize];
		if(this.totalPages <= this.navigationSize){
			for(int i = 0; i < this.navigationSize; i ++){
				if(i >= this.totalPages){
					values[i] = 0;
				}else{
					values[i] = i + 1;
				}
			}
		}else if(this.pageNumber - 1 <= this.navigationSize / 2){
			for(int i = 0; i < this.navigationSize; i ++){
				values[i] = i + 1;
			}
		}else if((this.totalPages - this.pageNumber <= this.navigationSize / 2)){
			for(int i = 0; i < this.navigationSize; i ++){
				values[this.navigationSize - i - 1] = this.totalPages - i;
			}
		}else{
			int mid = this.navigationSize / 2;
			values[mid] = this.pageNumber;
			for(int i = 1; i <= mid; i ++)	{
				values[mid + i] = this.pageNumber + i;
				values[mid - i] = this.pageNumber - i;
			}
		}
		for(int i = 0; i < this.navigationSize; i ++){
			this.pages.add(values[i]);
		}
	}

	public int getNavigationSize() 	{
		return navigationSize;
	}

	public void setNavigationSize(int navigationSize) {
		if(navigationSize < 9)	{
			this.navigationSize = 7;
			return;
		}
		else if(navigationSize > 15){
			this.navigationSize = 15;
			return;
		}
		this.navigationSize = navigationSize % 2 == 0 ? navigationSize -1 : navigationSize;
	}
	
	public List<Integer> getPages()	{
		return this.pages;
	}
	
}
