<%@ page language="java" pageEncoding="GBK" %>
<%@page import="com.gzdec.framework.page.Pagination"%>
<%@page import="com.gzdec.framework.page.NumberPagination"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
Pagination pagination = (Pagination)request.getAttribute("pagination");
if(null == pagination){
	pagination = new com.gzdec.framework.page.Pagination();
}

long currentPage = pagination.getCurrent();//当前页

long showPage = 10;//显示10页的分页条
long currentPageIndex = 6;//当前页显示的位置: 5 + (1) + 4 = 10
NumberPagination exPagination = new NumberPagination(pagination,showPage,currentPageIndex);
long firstPage = exPagination.getFirstPage();//首页页码
long lastPage = exPagination.getLastPage();//末页页码
%>
<s:hidden name="pagination.count" value="%{pagination.count}" id="count"/>
<s:hidden name="pagination.current" value="%{pagination.current}" id="current"/>

<!-- 少于1页不显示分页条 -->
<s:if test="pagination.getPages() > 1">
<s:hidden id="pages" value="%{pagination.pages}" />
<section>
    <div class="pagination">
        <span>共[&nbsp;<s:property value="%{pagination.count}" />&nbsp;]条记录&nbsp;&nbsp;&nbsp;&nbsp;每页 <s:select id="pageCount" name="pagination.pageCount" list="{'10','20','50'}" value="%{pagination.pageCount}" theme="simple" />条&nbsp;&nbsp;&nbsp;&nbsp;共[&nbsp;<s:property value="%{(pagination.count-1) / pagination.pageCount+1}" />&nbsp;]页&nbsp;&nbsp;&nbsp;&nbsp;跳转至</span><input type="text" id="pageIndex" class="jumpIpt"/><span>页</span><a href="" id="jumpPage">GO</a>
        <s:if test="pagination.firstEnable()"><a id="firstPage" href="" title="First Page">&laquo; 首页</a></s:if><s:else>&laquo;首页</s:else>
        <s:if test="pagination.previoEnable()"><a id="previousPage" href="" title="Previous Page">&laquo; 上一页</a></s:if><s:else>&laquo;上一页</s:else>
		<%
		for(long _page = firstPage; _page <= lastPage; _page++){
		%>
		<a href="" class="number paginationNumberCls <%=_page == currentPage ? " current" : "" %>" title="<%=_page%>"><%=_page%></a>
		<%
		}
		%>
        <s:if test="pagination.nextEnable()"><a id="nextPage" href="" title="Next Page">下一页 &raquo;</a></s:if><s:else>下一页 &raquo;</s:else>
        <s:if test="pagination.lastEnable()"><a id="lastPage" href="" title="Last Page">末页 &raquo;</a></s:if><s:else>末页 &raquo;</s:else>
    </div>
    <div class="clear"></div>    
</section>
</s:if>