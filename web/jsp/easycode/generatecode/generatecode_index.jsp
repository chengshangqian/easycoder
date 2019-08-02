<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:set name="cssPath" value="@org.ican.easycode.common.config.EasycodeConfig@getProperty('web.system.css.url')"/>
<s:set name="mdMetaData" value="resultMap.mdMetaData"/>
<s:set name="projectRoot" value="@org.ican.easycode.common.config.EasycodeConfig@getProperty('generator.web.file.savepath')"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<meta name="description" content="Easycoder������������һ������Struts2��Spring2��Ibatis2�ĸ�Ч������ܵ����ߴ���������" />
<title>Easycoder����������</title>
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<style type="text/css">
	table#dataTable tr td.clicking{
		/*background: #D6E8F8;*/
		background: #D6E8F8;
		font-weight: bold;
		color: white;
	}
	
	table#dataTable tr td.over a{
		color: white;
	}

	form.hide{display:none;}	
</style>
<script type="text/javascript" src="/js/easycode/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/js/easycode/common/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/easycode/common/json/easycode.JSONUtil.js"></script>
<script type="text/javascript" src="/js/easycode/generatecode/generatecode_index.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/easycode/generatecode/generatecode.object.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/easycode/common/jquery/jquery.blockUI.js"></script>
</head>
<body class="main_bg">
	<div id="container">
		<div id="header">
			<div id="header-nav">
				<a href="/">��ҳ</a> | <a href="/generatecode/index.ee" title="Struts2��Spring2��Ibatis2�ĸ�Ч������ܵ����ߴ���������">����������</a> | <a href="/article/index.html">�����ĵ���ȫ</a> | <a href="/changes.html">������־</a> | <a href="/about.html">����Easycoder</a>
			</div>
			<a href="http://chengshangqian.github.com" target="_blank" title="��������"><img src="/images/cocoa-logo.jpg" alt="����ǫ" /></a>
		</div>
		
		<div id="main">
			<!-- ��ܰ��ʾ -->
			<h1 style="font-size:12px;">��ܰ��ʾ</h1>
			<ol>
			<li><span style="font-weight:800;font-size:15px;color:red;">ɽ�haw������2014-10-03����<br />�°汾�Ĺ����̨Ƥ��(IQISģ��),�·�ҳ,�µ�������ʾ���Զ���䡰�ҵ�λ�á���������֤�����룡<br />�������������ɽ�hawʾ�����̣������˽⣡</span></li>
			<li><span style="font-size:12px;">2013-03-21���£��ڳ־û�ǰ�˴�����������͵�ֵ���ַ�����ǰ����ԭ��ת��ΪLong��ΪNumber���ͣ���֧��С����</span></li>
			<li><span style="font-size:12px;">ţ�ʹ�emblic�汾����:��������To��ֱ��ʹ��Map/HashMap���档</span></li>
			<li><span style="font-size:12px;">�㽶banana�汾��֧��MySQL���ݿ�����ɣ���ʹ�ÿɿ�cocoa�汾���ɡ�</span></li>
			<li><span style="font-size:12px;">�㽶banana</span>��<span style="font-size:12px;">�ɿ�cocoa</span>��<span style="font-size:12px;">����durian</span>��<span style="font-size:12px;">ţ�ʹ�emblic</span> �汾�������������޸�ҳ��Ĺ���JS�����װΪJS���󣬼����ظ����뼰��ά����<br />��Ҫ����&nbsp;<a href="/downloads/escoder.zip">escoder.js</a>&nbsp;��,���&nbsp;<a href="/downloads/escoder.zip">����</a>&nbsp;,&nbsp;Ȼ���ѹ��WEB��Ŀ¼����</li>
			<li>gzdec�汾���ٸ���</li>
			<li><a href="/downloads/base.zip">���ػ������̣��հף�</a>&nbsp;&nbsp;&nbsp;<a href="/downloads/demo.zip">����ʾ������</a>&nbsp;</li>
			<li><a href="/downloads/haw_demo.war" style="font-weight:700;font-size:14px;">����ɽ�hawʾ������</a></li>
			<li>��������鿴<a href="/changes.html" target="_blank">������־</a></li>
			</ol>
			
			<!-- �������� -->
			<div class="search_k" id="basicConfig">
				<fieldset class="search">
					<legend><img src="<s:property value="#cssPath"/>/images/search_btn.gif" align="middle"/>&nbsp;��������</legend>
					<div class="search_content" style="display:none;">
						<div style="padding-right:25px; padding-bottom:20px; "><span style="float:right;">
							<a id="viewConfig" href="" style="color:#00F;">�鿴��ʷ����</a>&nbsp;&nbsp;<a id="loadConfig" href="" style="color:#00F;">��������</a>&nbsp;&nbsp;<a id="saveConfig" href="" style="color:#00F;">��������</a>
						</span></div>
					</div>
					<form id="configForm" name="configForm" method="post">
						<div class="search_content">
							����������:<s:select name="generator" list="@org.ican.easycode.generator.common.util.Constants@GENERATORS"></s:select>&nbsp;&nbsp;<span style="color:red;font-size:12px;">(*ѡ����ʵĴ���������)</span>
						</div>
						<div class="search_content">
							��Ŀ��:<input type="text" id="projectName" name="formMap.projectName" value="" size="25"/>&nbsp;&nbsp;
							��·��:<input type="text" id="packageName" name="formMap.packageName" value="" size="40"/>&nbsp;&nbsp;
							ģ����:<input type="text" id="moduleName" name="formMap.moduleName" value="" size="25"/>
							<input type="hidden" id="projectRoot" name="formMap.projectRoot" value="<s:property value="#projectRoot" />"/>
						</div>
						<div class="search_content">
							���ݿ�����:<input size="50" type="text" id="driver" name="formMap.driver" value="" />&nbsp;&nbsp;
							���ݿ�URL:<input size="60" type="text" id="url" name="formMap.url" value="" />
						</div>
						<div class="search_content" id="back">
							���ݿ��û�:<input type="text" id="username" name="formMap.username" value="" />&nbsp;&nbsp;
							���ݿ�����:<input type="password" id="password" name="formMap.password" value="" />&nbsp;&nbsp;	
							ģ������:<input type="text" id="tableNamePattern" name="formMap.tableNamePattern" value="" />&nbsp;&nbsp;	
						</div>
						<div class="search_content">	
							<div class="select">
								<span style="float:left;">
									<input id="queryBt" type="button" value=" ��ѯ  "  class="input_btn_style1" />&nbsp;&nbsp;
									<input type="reset" value=" ����  "  class="input_btn_style1" />
								</span>
							</div>	
						</div>
					</form>	
				</fieldset>
			</div>
			
			<!-- ��ʵ������ -->
			<div id="mdData">
			</div>
			
			<!-- �������ɲ������� -->
			<div style="text-align:center;padding-top:20px;padding-bottom:20px;" id="runDiv">
				<input id="runBt" type="button" value=" ���ɴ��� "  class="input_btn_style1" style="margin-bottom:20px;"/>
			</div>			
		</div>	
		
		<!-- �ײ���Ȩ���� -->
		<div id="footer">
			<div id="footer-body">
				<div id="copyright">Copyright &copy <a href="http://chengshangqian.github.com" target="_blank">����</a>. All rights reserved. </div>
			</div>
		</div>
	</div>

<div style="display:none;">
	<span id="cssPath"><s:property value="#cssPath"/></span>
	<span id="selectedTips">����ѡ��һ����!</span>
	<span id="operation">�߼�ѡ��</span>
	<span id="clickClose">�����ر�</span>
	<span id="closeBtInfo">�ر�</span>
	<span id="clickSure">ȷ��</span>
	<span id="clickCancel">ȡ��</span>
	<span id="clickReset">����</span>
	<span id="failureTips">��������æ,���Ժ�����!</span>
	<span id="downloadTips">������ʾ</span>
	<span id="failureTitleTips">��ܰ��ʾ</span>
	<span id="successTips">��ϲ�㣬�����������!<br/>����������������ش���ѹ������</span>
	<span id="clickDownload">�������</span>	
	<span id="clickQueryTips">���ڲ�ѯ...</span>	
	<span id="clickRunTips">��������...</span>	
	
	<span id="checkProjectNameTips">����д��Ŀ��</span>	
	<span id="checkProjectRootTips">����д����·��</span>	
	<span id="checkPackageNameTips">����д��·��</span>	
	<span id="checkModuleNameTips">����дģ��</span>	
	<span id="checkGeneratorTips">��ѡ�����������</span>	
	<span id="checkDriverTips">����д���ݿ�����</span>	
	<span id="checkUrlTips">����д���ݿ�URL</span>	
	<span id="checkUsernameTips">����д���ݿ��û�</span>	
	<span id="checkPasswordTips">����д���ݿ�����</span>	
</div>
</body>
</html>