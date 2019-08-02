<%@ page contentType="text/html; charset=gbk" language="java"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>iframe上传回调页面</title>
</head>
<body>
<input type="hidden" id="data" value="<s:property value="jsonModel"/>"/>
<script type="text/javascript">
(function(){
	var jsonData = {};
	var dataString = document.getElementById("data").value;
	if(dataString){
		eval( 'jsonData = ' + dataString + ';');
	}
    window.parent.successCallback(jsonData);	
})();
</script>
</body>
</html>