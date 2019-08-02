package org.ican.easycode.framework.page;

/**
 * <p>Title: 扩展标记库</p>
 * <p>Description: 分页控制</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: </p>
 * @author 欧阳春
 * @version 1.0
 */


public class Pagination
{


  private long count; //共多少条记录
  private long pageCount; //每页多少条记录
  private long current; //当前第几页
  private boolean notQueryCount=false; //为false在翻页时查询记录总数，默认false

  public Pagination() {
    pageCount = 10; //默认每页10条记录
    current = 1; //默认第一页
    this.count = 0; //共多少条记录
  }

  public void setCount(long count) {
    this.count = count;
  }

  public long getCount() {
    return count;
  }

  public void setPageCount(long pageCount) {
    this.pageCount = pageCount;
  }

  public long getPages() {
    if (count % pageCount == 0)
      return count / pageCount;
    else
      return count / pageCount + 1;
  }

  public long getPageCount() {
    return pageCount;
  }

  public boolean firstEnable() {
    return previoEnable();
  }

  public boolean lastEnable() {
    return nextEnable();
  }

  public boolean nextEnable() {
    return current * pageCount < count;
  }

  public boolean previoEnable() {
    return current > 1;
  }


  public long getCurrent() {
    return current;
  }

    public boolean isNotQueryCount() {
        return notQueryCount;
    }

    public void setCurrent(long current) {
    this.current = current;
  }

    public void setNotQueryCount(boolean notQueryCount) {
        this.notQueryCount = notQueryCount;
    }

}
