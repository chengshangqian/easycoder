<%@ page pageEncoding="GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:hidden name="pagination.count" value="%{pagination.count}" id="count"/>
<s:hidden name="pagination.current" value="%{pagination.current}" id="current"/>

<s:set name="dateCount" value="%{pagination.count}"></s:set>
<s:if test="#dateCount==0"><div class="nothing"></div></s:if>

<s:set name="pageCount" value="%{(pagination.count-1) / pagination.pageCount+1}"></s:set>
<s:if test="#pageCount==1">&nbsp;</s:if>
<s:else>

共[<s:property value="%{pagination.count}" />]条纪录,

每页<s:select name="pagination.pageCount" list="{'10','20','50'}" 
	value="%{pagination.pageCount}" onchange="changePageSize()" theme="simple" />条&nbsp;

共[<s:property value="%{(pagination.count-1) / pagination.pageCount+1}" />]页|

第[<s:property value="%{pagination.current}" />]页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<span class="blue"><s:if test="pagination.firstEnable()"><a href="javascript:page(1);" class="blue">首页</a></s:if><s:else>首页</s:else></span>
 
<span class="blue">
<s:if test="pagination.previoEnable()"><a href="javascript:page(<s:property value="%{pagination.current-1}" />);" class="blue">上一页</a></s:if><s:else>上一页</s:else>
</span>
<span class="blue">
<s:if test="pagination.nextEnable()"><a href="javascript:page(<s:property value="%{pagination.current==(pagination.count+pagination.pageCount-1)/pagination.pageCount?pagination.current:pagination.current+1}" />);" class="blue">下一页</a></s:if><s:else>下一页</s:else>
</span>
<span class="blue">
<s:if test="pagination.lastEnable()"><a href="javascript:page(<s:property value="%{(pagination.count+pagination.pageCount-1)/pagination.pageCount}" />);" class="blue">末页</a></s:if><s:else>末页</s:else>
</span>
&nbsp;&nbsp;&nbsp;跳到
<input type="text" name="index" size=3 onkeyup="checkInput();">页 
<a href="javascript:page(document.forms[0].index.value);"  class="blue"><b>GO!</b></a>

</s:else>




<script language="javascript">
    function changePageSize(){
        document.forms[0].count.value="1";
        document.forms[0].submit();
    }
    
    function page(index) {
        if (index == "") {
            alert("请输入跳转的页面数！");
            return;
        }
		if(isNaN(document.forms[0].index.value)) {
			alert("跳转页面必须为数值型");
			return;
		}
		if(index == 0){
        	index = 1;
        }
        if (index > <s:property value="%{(pagination.count+pagination.pageCount-1)/pagination.pageCount}" />)
       		document.forms[0].current.value = "" + <s:property value="%{(pagination.count+pagination.pageCount-1)/pagination.pageCount}" />;
       	else
       		document.forms[0].current.value = ""+index;
        document.forms[0].submit();
    }
    
    function checkInput() {
        if (event.keyCode == 13) {
            page(document.forms[0].index.value);
            return;
        }
		if ( (event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) ||
         event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 127) {    
			
		 }else{
		 	document.forms[0].index.value = "";
		 }

    }
</script>
