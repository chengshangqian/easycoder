<%@ page contentType="text/html; charset=gbk" language="java" %>
<%@taglib  uri="/struts-tags"   prefix="s"%>
<s:set name="theme" value="'simple'" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>iframe�ϴ�</title>
<script type="text/javascript">
	function successCallback(data){
		processBar("none");
		if(data && !data.err){
			callback(data.msg);
		}
		else{
			alert("�ϴ�ʧ�ܣ������ԣ�");
		}
	}
	
	function validateForm(){
		var filedataEl = document.forms[0].filedata;
		if(!filedataEl.value){
			alert('��ѡ��Ҫ�ϴ����ļ���');
			return false;
		}
		processBar('block');
		return true;
	}
	
	function processBar(status){
		var processBar = document.getElementById("processBar");
		processBar.style.display = status;
	}
</script>
</head>
<body>
<div style="vertical-align:middle;text-align:center;">
<s:form onsubmit="validateForm()" cssStyle="vertical-align:middle;" namespace="/nes/file/upload" method="post" name="iframeUploadForm" action="iframeUpload" target="hiddenfra" enctype="multipart/form-data">
<s:label key="filedataLabel" value="��ѡ��" cssStyle="font-size:12px;"/><s:file name="filedata" size="13"/>&nbsp;<s:submit value="�ϴ�"/>
</s:form>
<div id="processBar" style="padding-top:20px;display:none;font-size:12px;"><div>�����ϴ������Ժ�...</div><div><img  src="/plug-in/xheditor/progressbar.gif" /></div></div>
<iframe id="hiddenfra" name="hiddenfra" style="display:none;" height="0" width="0"></iframe>
</div>
</body>
</html>