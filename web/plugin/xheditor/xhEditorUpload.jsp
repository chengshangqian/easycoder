<%@ page contentType="text/html; charset=gbk" language="java"%>
<%@taglib  uri="/struts-tags"   prefix="s"%>
<s:set name="theme" value="'simple'" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>xhEditor Ajax Upload</title>
<script type="text/javascript" src="/js/nes/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/plug-in/xheditor/xheditor-zh-cn.min.js?v=1.0.0-final" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	var uploadUrl = "/nes/file/upload/ajaxUpload.ee";
	$('#ajaxUploadXheditor').xheditor({
		upLinkUrl:uploadUrl,upLinkExt:"zip,rar,txt",
		upImgUrl:uploadUrl,upImgExt:"jpg,jpeg,gif,png",
		upFlashUrl:uploadUrl,upFlashExt:"swf",
		upMediaUrl:uploadUrl,upMediaExt:"wmv,avi,wma,mp3,mid",
		onUpload:insertUpload
	});
	
	uploadUrl = "!/nes/file/upload/toIframeUpload.ee";
	$('#elm1').xheditor({
		skin:'vista',
		upLinkUrl:uploadUrl,
		upImgUrl:uploadUrl,
		upFlashUrl:uploadUrl,
		upMediaUrl:uploadUrl
	});
});


function insertUpload(msg){
	alert('file path : ' + msg);
}
</script>
</head>

<body>
<s:textarea name="ajaxUploadXheditor" id="ajaxUploadXheditor" cols="80" rows="10"></s:textarea>
<s:textarea name="elm1" id="elm1" cols="80" rows="10"></s:textarea>
</body>
</html>