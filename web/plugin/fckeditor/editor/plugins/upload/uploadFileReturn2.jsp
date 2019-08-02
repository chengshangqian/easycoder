<%@ page contentType="text/html; charset=GBK" language="java" %>
<%
String uploadedFileUrl = (String) request.getAttribute("uploadedFileUrl");
String fileNameStr = (String)request.getAttribute("fileNameStr");
 System.out.println("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiii:");
%>
<html>
<head>
<%
	String channel=(String)request.getAttribute("channel");
	String flag = (String)request.getAttribute("flag");
	//String photo=(String)request.getAttribute("photo");
	//String video=(String)request.getAttribute("video");
%>
</head>
<body>
<script type="text/javascript">
<%
if(uploadedFileUrl.equals("")){

%>
alert("文件上传失败，请重试！");
window.close();
<%
}else{
%>
alert("文件上传成功！");
window.opener.document.getElementById("binContent").value="<%=uploadedFileUrl%>";
<%if(!"1".equals(channel)){
%>
window.opener.showFilebin("1");  
<%}%>
<%if(!"1".equals(flag)){
%>
window.opener.showFilebin("1");  
<%}%>
<%if("1".equals(channel)){
%>
window.opener.document.getElementById("fileNameStr").value='<%=fileNameStr%>';

	window.opener.showPict();
	
	
<%}%>
window.close();
<%
}
%>
</script>
</body>
</html>