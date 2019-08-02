<%@ page contentType="text/html; charset=GBK" language="java" %>
<%
String uploadedFileUrl = (String) request.getAttribute("uploadedFileUrl");
String docType = (String) request.getAttribute("docType");
String fileName = (String) request.getAttribute("fileName");

%>
<html>
<head>

</head>
<body>
<script type="text/javascript">
function getUpFileExt(filename) {
var pos = filename.lastIndexOf(".");
if (pos==-1) return "tmp";
return filename.substr(pos+1);
}
var docType="<%=docType%>";
var oEditor = window.parent.InnerDialogLoaded() ;

window.onload = function ()
{
	// First of all, translate the dialog box texts
	oEditor.FCKLanguageManager.TranslatePage(document) ;
}
<%
if(uploadedFileUrl.equals("")){

%>
alert("文件上传失败，请重试！");
window.close();
<%
}else{
%>
alert("文件上传成功！");
if("gif|.jpg|.png|.jpeg|.bmp".indexOf(docType.toLowerCase())!=-1){
	var url='<%=uploadedFileUrl%>';
	var oImg = oEditor.FCK.CreateElement( 'IMG' ) ;
		oImg.src = url;
		oImg.setAttribute( '_fcksavedurl', url ) ;
		
		// For long smileys list, it seams that IE continues loading the images in
		// the background when you quickly select one image. so, let's clear
		// everything before closing.
		document.body.innerHTML = '' ;
	
		window.parent.Cancel() ;
}
else if(".pdf|.doc|.xls|.ppt|.rar|.zip|.txt|.wps".indexOf(docType.toLowerCase())!=-1){
	var url='<%=uploadedFileUrl%>';
	var fileName="<%=fileName%>";
	var htmlStr="<a href='"+url+"'>"+fileName+"</a>";
	oEditor.FCK.InsertHtml(htmlStr);
	window.parent.Cancel() ;
}else if(".asf|.avi|.mpeg|.wmv|.wma|".indexOf(docType.toLowerCase())!=-1){
var url='<%=uploadedFileUrl%>';
var html="<embed src='"+url+"' autostart=0>"
oEditor.FCK.InsertHtml(html);
window.parent.Cancel() ;

}else if(".swf|".indexOf(docType.toLowerCase())!=-1){
var url='<%=uploadedFileUrl%>';
var html = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0' width='400' height='300'>";
		html += "<param name='movie' value='"+url+"' />";
		html += "<param name='quality' value='high' />";
		html += "<embed src='"+url+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='400' height='300'></embed>";
		html += "</object>";
	oEditor.FCK.InsertHtml(html);
	window.parent.Cancel() ;
	
}else if(".mp3|".indexOf(docType.toLowerCase())!=-1){
var url='<%=uploadedFileUrl%>';
var sMusicHtml ; //这里mp3player.swf请使用你的mp3player.swf的绝对路径
            sMusicHtml = "<object id=\"audioplayer\" type=\"application/x-shockwave-flash\" height=\"24\" width=\"300\""; 
            sMusicHtml = sMusicHtml + "    data=\"/module/acmanage/mp3player.swf\">"; 
            sMusicHtml = sMusicHtml + "    <param value=\"/module/acmanage/mp3player.swf\" name=\"movie\" />"; 
            sMusicHtml = sMusicHtml + "    <param value=\"soundFile=" + url + "\" name=\"FlashVars\" />"; 
            sMusicHtml = sMusicHtml + "    <param value=\"high\" name=\"quality\" />"; 
            sMusicHtml = sMusicHtml + "    <param value=\"false\" name=\"menu\" />"; 
            sMusicHtml = sMusicHtml + "    <param value=\"#FFFFFF\" name=\"bgcolor\" />"; 
            sMusicHtml = sMusicHtml + "</object>";             
oEditor.FCK.InsertHtml(sMusicHtml);
window.parent.Cancel() ;
}else if(".rm|.rmvb|".indexOf(docType.toLowerCase())!=-1){
var url='<%=uploadedFileUrl%>';
var mediaplayer="";
mediaplayer="<OBJECT ID=video1 CLASSID='clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA' HEIGHT=250 WIDTH=320>";
			mediaplayer+="<PARAM NAME='controls' VALUE='ImageWindow,ControlPanel'>";
			mediaplayer+="<PARAM NAME='console' VALUE='Clip1'>";
			mediaplayer+="<PARAM NAME='autostart' VALUE='true'>"; 
			mediaplayer+="<PARAM NAME='src' VALUE='"+url+"'>"; 
			mediaplayer+="<EMBED SRC='"+url+"' type='audio/x-pn-realaudio-plugin' CONSOLE='Clip1' CONTROLS='ImageWindow' HEIGHT=250 WIDTH=320 AUTOSTART=true>";
            mediaplayer+="</OBJECT>";
           oEditor.FCK.InsertHtml(mediaplayer);
window.parent.Cancel() ; 
}
window.close();
<%
}
%>
</script>
</body>
</html>
