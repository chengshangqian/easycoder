<%@ page pageEncoding="GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:hidden name="pagination.count" value="%{pagination.count}" id="count"/>
<s:hidden name="pagination.current" value="%{pagination.current}" id="current"/>

<s:set name="dateCount" value="%{pagination.count}"></s:set>
<s:if test="#dateCount==0"><div class="nothing"></div></s:if>

<s:set name="pageCount" value="%{(pagination.count-1) / pagination.pageCount+1}"></s:set>
<s:if test="#pageCount==1">&nbsp;</s:if>
<s:else>

��[<s:property value="%{pagination.count}" />]����¼,

ÿҳ<s:select name="pagination.pageCount" list="{'10','20','50'}" 
	value="%{pagination.pageCount}" onchange="changePageSize()" theme="simple" />��&nbsp;

��[<s:property value="%{(pagination.count-1) / pagination.pageCount+1}" />]ҳ|

��[<s:property value="%{pagination.current}" />]ҳ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<span class="blue"><s:if test="pagination.firstEnable()"><a href="javascript:page(1);" class="blue">��ҳ</a></s:if><s:else>��ҳ</s:else></span>
 
<span class="blue">
<s:if test="pagination.previoEnable()"><a href="javascript:page(<s:property value="%{pagination.current-1}" />);" class="blue">��һҳ</a></s:if><s:else>��һҳ</s:else>
</span>
<span class="blue">
<s:if test="pagination.nextEnable()"><a href="javascript:page(<s:property value="%{pagination.current==(pagination.count+pagination.pageCount-1)/pagination.pageCount?pagination.current:pagination.current+1}" />);" class="blue">��һҳ</a></s:if><s:else>��һҳ</s:else>
</span>
<span class="blue">
<s:if test="pagination.lastEnable()"><a href="javascript:page(<s:property value="%{(pagination.count+pagination.pageCount-1)/pagination.pageCount}" />);" class="blue">ĩҳ</a></s:if><s:else>ĩҳ</s:else>
</span>
&nbsp;&nbsp;&nbsp;����
<input type="text" name="index" size=3 onkeyup="checkInput();">ҳ 
<a href="javascript:page(document.forms[0].index.value);"  class="blue"><b>GO!</b></a>

</s:else>




<script language="javascript">
    function changePageSize(){
        document.forms[0].count.value="1";
        document.forms[0].submit();
    }
    
    function page(index) {
        if (index == "") {
            alert("��������ת��ҳ������");
            return;
        }
		if(isNaN(document.forms[0].index.value)) {
			alert("��תҳ�����Ϊ��ֵ��");
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
