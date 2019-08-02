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
<meta name="description" content="Easycoder代码生成器是一个基于Struts2、Spring2、Ibatis2的高效开发框架的在线代码生成器" />
<title>Easycoder代码生成器</title>
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
				<a href="/">首页</a> | <a href="/generatecode/index.ee" title="Struts2、Spring2、Ibatis2的高效开发框架的在线代码生成器">代码生成器</a> | <a href="/article/index.html">开发文档大全</a> | <a href="/changes.html">更新日志</a> | <a href="/about.html">关于Easycoder</a>
			</div>
			<a href="http://chengshangqian.github.com" target="_blank" title="关于作者"><img src="/images/cocoa-logo.jpg" alt="成尚谦" /></a>
		</div>
		
		<div id="main">
			<!-- 温馨提示 -->
			<h1 style="font-size:12px;">温馨提示</h1>
			<ol>
			<li><span style="font-weight:800;font-size:15px;color:red;">山楂haw发布（2014-10-03）！<br />新版本的管理后台皮肤(IQIS模板),新分页,新弹出层提示，自动填充“我的位置”，自行验证表单输入！<br />更多详情可下载山楂haw示例工程，进行了解！</span></li>
			<li><span style="font-size:12px;">2013-03-21更新：在持久化前端传入的数字类型的值（字符串）前，从原来转换为Long改为Number类型，以支持小数。</span></li>
			<li><span style="font-size:12px;">牛甘果emblic版本发布:不再生成To，直接使用Map/HashMap代替。</span></li>
			<li><span style="font-size:12px;">香蕉banana版本不支持MySQL数据库的生成；可使用可可cocoa版本生成。</span></li>
			<li><span style="font-size:12px;">香蕉banana</span>、<span style="font-size:12px;">可可cocoa</span>、<span style="font-size:12px;">榴莲durian</span>、<span style="font-size:12px;">牛甘果emblic</span> 版本将管理、新增、修改页面的公共JS代码封装为JS对象，减少重复代码及其维护。<br />需要引入&nbsp;<a href="/downloads/escoder.zip">escoder.js</a>&nbsp;包,点击&nbsp;<a href="/downloads/escoder.zip">下载</a>&nbsp;,&nbsp;然后解压到WEB根目录即可</li>
			<li>gzdec版本不再更新</li>
			<li><a href="/downloads/base.zip">下载基础工程（空白）</a>&nbsp;&nbsp;&nbsp;<a href="/downloads/demo.zip">下载示例工程</a>&nbsp;</li>
			<li><a href="/downloads/haw_demo.war" style="font-weight:700;font-size:14px;">下载山楂haw示例工程</a></li>
			<li>具体详情查看<a href="/changes.html" target="_blank">更新日志</a></li>
			</ol>
			
			<!-- 配置区域 -->
			<div class="search_k" id="basicConfig">
				<fieldset class="search">
					<legend><img src="<s:property value="#cssPath"/>/images/search_btn.gif" align="middle"/>&nbsp;基本配置</legend>
					<div class="search_content" style="display:none;">
						<div style="padding-right:25px; padding-bottom:20px; "><span style="float:right;">
							<a id="viewConfig" href="" style="color:#00F;">查看历史配置</a>&nbsp;&nbsp;<a id="loadConfig" href="" style="color:#00F;">加载配置</a>&nbsp;&nbsp;<a id="saveConfig" href="" style="color:#00F;">保存配置</a>
						</span></div>
					</div>
					<form id="configForm" name="configForm" method="post">
						<div class="search_content">
							代码生成器:<s:select name="generator" list="@org.ican.easycode.generator.common.util.Constants@GENERATORS"></s:select>&nbsp;&nbsp;<span style="color:red;font-size:12px;">(*选择合适的代码生成器)</span>
						</div>
						<div class="search_content">
							项目名:<input type="text" id="projectName" name="formMap.projectName" value="" size="25"/>&nbsp;&nbsp;
							包路径:<input type="text" id="packageName" name="formMap.packageName" value="" size="40"/>&nbsp;&nbsp;
							模块名:<input type="text" id="moduleName" name="formMap.moduleName" value="" size="25"/>
							<input type="hidden" id="projectRoot" name="formMap.projectRoot" value="<s:property value="#projectRoot" />"/>
						</div>
						<div class="search_content">
							数据库驱动:<input size="50" type="text" id="driver" name="formMap.driver" value="" />&nbsp;&nbsp;
							数据库URL:<input size="60" type="text" id="url" name="formMap.url" value="" />
						</div>
						<div class="search_content" id="back">
							数据库用户:<input type="text" id="username" name="formMap.username" value="" />&nbsp;&nbsp;
							数据库密码:<input type="password" id="password" name="formMap.password" value="" />&nbsp;&nbsp;	
							模糊表名:<input type="text" id="tableNamePattern" name="formMap.tableNamePattern" value="" />&nbsp;&nbsp;	
						</div>
						<div class="search_content">	
							<div class="select">
								<span style="float:left;">
									<input id="queryBt" type="button" value=" 查询  "  class="input_btn_style1" />&nbsp;&nbsp;
									<input type="reset" value=" 重置  "  class="input_btn_style1" />
								</span>
							</div>	
						</div>
					</form>	
				</fieldset>
			</div>
			
			<!-- 表实体区域 -->
			<div id="mdData">
			</div>
			
			<!-- 代码生成操作区域 -->
			<div style="text-align:center;padding-top:20px;padding-bottom:20px;" id="runDiv">
				<input id="runBt" type="button" value=" 生成代码 "  class="input_btn_style1" style="margin-bottom:20px;"/>
			</div>			
		</div>	
		
		<!-- 底部版权区域 -->
		<div id="footer">
			<div id="footer-body">
				<div id="copyright">Copyright &copy <a href="http://chengshangqian.github.com" target="_blank">作者</a>. All rights reserved. </div>
			</div>
		</div>
	</div>

<div style="display:none;">
	<span id="cssPath"><s:property value="#cssPath"/></span>
	<span id="selectedTips">至少选择一个表!</span>
	<span id="operation">高级选项</span>
	<span id="clickClose">单击关闭</span>
	<span id="closeBtInfo">关闭</span>
	<span id="clickSure">确定</span>
	<span id="clickCancel">取消</span>
	<span id="clickReset">重置</span>
	<span id="failureTips">服务器繁忙,请稍候再试!</span>
	<span id="downloadTips">下载提示</span>
	<span id="failureTitleTips">温馨提示</span>
	<span id="successTips">恭喜你，代码生成完成!<br/>请点击下面的链接下载代码压缩包！</span>
	<span id="clickDownload">点击下载</span>	
	<span id="clickQueryTips">正在查询...</span>	
	<span id="clickRunTips">正在生成...</span>	
	
	<span id="checkProjectNameTips">请填写项目名</span>	
	<span id="checkProjectRootTips">请填写工程路径</span>	
	<span id="checkPackageNameTips">请填写包路径</span>	
	<span id="checkModuleNameTips">请填写模块</span>	
	<span id="checkGeneratorTips">请选择代码生成器</span>	
	<span id="checkDriverTips">请填写数据库驱动</span>	
	<span id="checkUrlTips">请填写数据库URL</span>	
	<span id="checkUsernameTips">请填写数据库用户</span>	
	<span id="checkPasswordTips">请填写数据库密码</span>	
</div>
</body>
</html>