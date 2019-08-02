<%@ page language="java" pageEncoding="GBK" %>
<%@page import="com.gzdec.framework.page.Pagination"%>
<%@page import="com.gzdec.framework.page.NumberPagination"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
Pagination pagination = (Pagination)request.getAttribute("pagination");
if(null == pagination){
	pagination = new com.gzdec.framework.page.Pagination();
}

long currentPage = pagination.getCurrent();//��ǰҳ

long showPage = 10;//��ʾ10ҳ�ķ�ҳ��
long currentPageIndex = 6;//��ǰҳ��ʾ��λ��: 5 + (1) + 4 = 10
NumberPagination exPagination = new NumberPagination(pagination,showPage,currentPageIndex);
long firstPage = exPagination.getFirstPage();//��ҳҳ��
long lastPage = exPagination.getLastPage();//ĩҳҳ��
%>
<s:hidden name="pagination.count" value="%{pagination.count}" id="count"/>
<s:hidden name="pagination.current" value="%{pagination.current}" id="current"/>

<!-- ����1ҳ����ʾ��ҳ�� -->
<s:if test="pagination.getPages() > 1">
<s:hidden id="pages" value="%{pagination.pages}" />
<section>
    <div class="pagination">
        <span>��[&nbsp;<s:property value="%{pagination.count}" />&nbsp;]����¼&nbsp;&nbsp;&nbsp;&nbsp;ÿҳ <s:select id="pageCount" name="pagination.pageCount" list="{'10','20','50'}" value="%{pagination.pageCount}" theme="simple" />��&nbsp;&nbsp;&nbsp;&nbsp;��[&nbsp;<s:property value="%{(pagination.count-1) / pagination.pageCount+1}" />&nbsp;]ҳ&nbsp;&nbsp;&nbsp;&nbsp;��ת��</span><input type="text" id="pageIndex" class="jumpIpt"/><span>ҳ</span><a href="" id="jumpPage">GO</a>
        <s:if test="pagination.firstEnable()"><a id="firstPage" href="" title="First Page">&laquo; ��ҳ</a></s:if><s:else>&laquo;��ҳ</s:else>
        <s:if test="pagination.previoEnable()"><a id="previousPage" href="" title="Previous Page">&laquo; ��һҳ</a></s:if><s:else>&laquo;��һҳ</s:else>
		<%
		for(long _page = firstPage; _page <= lastPage; _page++){
		%>
		<a href="" class="number paginationNumberCls <%=_page == currentPage ? " current" : "" %>" title="<%=_page%>"><%=_page%></a>
		<%
		}
		%>
        <s:if test="pagination.nextEnable()"><a id="nextPage" href="" title="Next Page">��һҳ &raquo;</a></s:if><s:else>��һҳ &raquo;</s:else>
        <s:if test="pagination.lastEnable()"><a id="lastPage" href="" title="Last Page">ĩҳ &raquo;</a></s:if><s:else>ĩҳ &raquo;</s:else>
    </div>
    <div class="clear"></div>    
</section>
</s:if>