package org.ican.easycode.framework.page;

/**
 * <p>Title: ��չ��ǿ�</p>
 * <p>Description: ��ҳ����</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: </p>
 * @author ŷ����
 * @version 1.0
 */


public class Pagination
{


  private long count; //����������¼
  private long pageCount; //ÿҳ��������¼
  private long current; //��ǰ�ڼ�ҳ
  private boolean notQueryCount=false; //Ϊfalse�ڷ�ҳʱ��ѯ��¼������Ĭ��false

  public Pagination() {
    pageCount = 10; //Ĭ��ÿҳ10����¼
    current = 1; //Ĭ�ϵ�һҳ
    this.count = 0; //����������¼
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
