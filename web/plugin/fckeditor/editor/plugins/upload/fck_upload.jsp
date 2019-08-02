<%@ page contentType="text/html; charset=GBK" language="java"%>

<html>
	<head>
		<title>文件上传</title>
	</head>
	<body>
		<script language=javascript>
function getFileExt(filename) {
if (filename.indexOf(".")==-1) return "..";
var ext=filename.split(".");
return ext[ext.length-1];
}

function frmsubmit() {
	var filename=form1.fileName.value;
	if(filename==""||filename=="请填写文件名称！"){
		alert("请填写文件名称");
		return false;
		}
	var filepath=form1.url.value;
	if (!filepath=="") {
	    var validFile=".doc|.xls|.ppt|.rar|.zip|.txt|.gif|.jpg|.jpeg|.png|.swf|.avi|.rm|.rmvb|.mp3|.mpeg|.wma|.wmv|.bmp|.pdf|.wps";
		
		if(validFile.indexOf(getFileExt(filepath).toLowerCase())!=-1){
		document.form1.action="<%=request.getContextPath()%>/file/uploadFile.ee?action=insertFileFCK";
		document.form1.submit();
		document.getElementById("tips").style.display="";
		}
		else{
		alert("对不起，您上传的文件，系统不支持！");
		return false;
		}
	} else {
		alert("请选择一个文件");
		form1.file.focus();
	}
}

</script>
		<form method="post" name="form1" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/file/uploadFile.do?action=insertFile">
			<input type="text" name="fileName" size="26" value='请填写文件名称！'
				onFocus="javascript:this.value=''">
			<br>
			<input type="text" readonly="readonly" name="url" size="26" value=''>
			<input type="file" name="filePath" onChange="url.value=this.value;"
				style="cursor: hand; filter: alpha(opacity = 100); width: 30px; border: 1px solid" />
			<input type="button" value="上传" onClick="frmsubmit();">
			<div>
<pre>
所有支持的文件类型:
1.文档类：.doc|.xls|.ppt|.rar|.zip|.pdf|.wps
2.图片类：.gif|.jpg|.png|.jpeg|.bmp
3.动画类：.swf
4.多媒体：.avi|.rm|.rmvb|.mp3|.mpeg|.wma|.wmv
文件大小不超过(100M)
</pre>	
			</div>
	  <div style="display: none; font-size: 12px; color: red" id="tips">
				文件上传中，请耐心等待.......
			</div>
		</form>
	</body>
</html>
