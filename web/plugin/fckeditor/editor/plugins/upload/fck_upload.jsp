<%@ page contentType="text/html; charset=GBK" language="java"%>

<html>
	<head>
		<title>�ļ��ϴ�</title>
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
	if(filename==""||filename=="����д�ļ����ƣ�"){
		alert("����д�ļ�����");
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
		alert("�Բ������ϴ����ļ���ϵͳ��֧�֣�");
		return false;
		}
	} else {
		alert("��ѡ��һ���ļ�");
		form1.file.focus();
	}
}

</script>
		<form method="post" name="form1" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/file/uploadFile.do?action=insertFile">
			<input type="text" name="fileName" size="26" value='����д�ļ����ƣ�'
				onFocus="javascript:this.value=''">
			<br>
			<input type="text" readonly="readonly" name="url" size="26" value=''>
			<input type="file" name="filePath" onChange="url.value=this.value;"
				style="cursor: hand; filter: alpha(opacity = 100); width: 30px; border: 1px solid" />
			<input type="button" value="�ϴ�" onClick="frmsubmit();">
			<div>
<pre>
����֧�ֵ��ļ�����:
1.�ĵ��ࣺ.doc|.xls|.ppt|.rar|.zip|.pdf|.wps
2.ͼƬ�ࣺ.gif|.jpg|.png|.jpeg|.bmp
3.�����ࣺ.swf
4.��ý�壺.avi|.rm|.rmvb|.mp3|.mpeg|.wma|.wmv
�ļ���С������(100M)
</pre>	
			</div>
	  <div style="display: none; font-size: 12px; color: red" id="tips">
				�ļ��ϴ��У������ĵȴ�.......
			</div>
		</form>
	</body>
</html>
