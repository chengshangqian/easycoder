/**
 * @author Vin
 * @since 2011-02-22
 */

$(function(){
 	$('#viewConfig').click(viewConfig);
 	$('#loadConfig').click(loadConfig);
 	$('#saveConfig').click(saveConfig);
 	$('#queryBt').click(getMetaDataResult);
 	$('#runBt').click(run);
 	loadConfigCookies(true);
 });
 
 function viewConfig(evt){
	 evt.preventDefault();
	 alert('viewConfig...');
 }

 function loadConfig(evt){
 	evt.preventDefault();
 	alert('loadConfig...');
 }
 
 function saveConfig(evt){
 	evt.preventDefault();
 	alert('saveConfig...');
 }
 
 function saveConfigCookies(){
 	var projectName = $('#projectName').val();
 	var packageName = $('#packageName').val();
 	var moduleName = $('#moduleName').val();
 	var driver = $('#driver').val();
 	var url = $('#url').val();
 	var username = $('#username').val();
 	var password = $('#password').val();
 	var tableNamePattern = $('#tableNamePattern').val();
 	
 	var cfg = { expires: 365, path: '/'};
 	$.cookie('projectName', projectName, cfg);
 	$.cookie('packageName', packageName, cfg);
 	$.cookie('moduleName', moduleName, cfg);
 	$.cookie('driver', driver, cfg);
 	$.cookie('url', url, cfg);
 	$.cookie('username', username, cfg);
 	$.cookie('password', password, cfg);
 	$.cookie('tableNamePattern', tableNamePattern, cfg);
 }
 
 function loadConfigCookies(testing){
	var projectName = empty($.cookie('projectName'));
	var packageName = empty($.cookie('packageName'));
	var moduleName = empty($.cookie('moduleName'));
	var driver = empty($.cookie('driver'));
	var url = empty($.cookie('url'));
	var username = empty($.cookie('username'));
	var password = empty($.cookie('password'));
	var tableNamePattern = empty($.cookie('tableNamePattern'));
	
	if(testing){
		if(!projectName){
			projectName = 'erp';
		}
		if(!packageName){
			packageName = 'com.gzdec.erp';
		}
		if(!moduleName){
			moduleName = 'user';
		}
		if(!driver){
			driver = 'oracle.jdbc.OracleDriver';
		}
		if(!url){
			url = 'jdbc:oracle:thin:@172.16.172.180:1521:develop';
		}
		if(!username){
			username = 'study_online';
		}
		if(!password){
			password = 'develop';
		}
		if(!tableNamePattern){
			tableNamePattern = '';
		}
	}
	
 	$('#projectName').val(projectName);
 	$('#packageName').val(packageName);
 	$('#moduleName').val(moduleName);
 	$('#driver').val(driver);
 	$('#url').val(url);
 	$('#username').val(username);
 	$('#password').val(password);
 	$('#tableNamePattern').val(tableNamePattern);
 }
 
 function empty(s){
	 if(!s){
		 return '';
	 }
	 return s;
 }
 
 function getMetaDataResult(evt){
	saveConfigCookies();
 	
 	var checked = checkQueryForm(true);
 	if(!checked){
 		return false;
 	}
 	
 	changeQueryBtStatus(true);
 	
 	var url = '/generatecode/getMetaDataResult.ee?_r=' + new Date().getTime();
 	var param = $('#configForm').serialize();
 	
 	$('#mdData').load(url,param,function(){
 		changeQueryBtStatus(false);
 		window.setTimeout(init, 0);
 	});
 }
 
 function init(){
	submitHandler();
	resetHandler();
	cancelHandler();
	optionsToggle();
	allCheckBoxTrigger();
	checkBoxTrigger();
 }
 
 function submitHandler(){
	$('a.submitCls').each(function(){
		var el = $(this);
		el.click(cancel);
	});	 	 
 } 
 
 function resetHandler(){
	$('a.resetCls').each(function(){
		var el = $(this);
		el.click(function(evt){
			var ele = $(this);
			var targetEl = ele.parent().parent().parent().parent().parent();
			targetEl.get(0).reset();
		});
	});	 	 
 }
 
 function cancelHandler(){
	$('a.cancelCls').each(function(){
		var el = $(this);
		el.click(cancel);
	});	 
 }
 
 function cancel(evt){
	var ele = $(this);
	var targetEl = ele.parent().parent().parent().parent().parent();
	showHideOptions(targetEl,false);
 }
 
 function optionsToggle(){
	$('a.optionsConfigCls').each(function(){
		var el = $(this);
		el.click(function(evt){
			var ele = $(this);
			var tableName = ele.attr('title');
			$('#tableNameSpan').html(tableName);
			var targetEl = $('#' + tableName);
			showHideOptions(targetEl,true);
			$('table#dataTable tr td').removeClass('clicking');
			ele.parent().addClass('clicking');
		});
	});	 
 }
 
 function showHideOptions(targetEl,order){
	if(order){
		targetEl.toggle('slow');
		$('#advanceConfig').toggle('slow');
		$('#tables').toggle('slow');
		$('#basicConfig').toggle('slow');
		$('#runDiv').toggle(1000);
	}
	else{
		$('#runDiv').toggle(1000);	
		$('#basicConfig').toggle('slow');
		$('#tables').toggle('slow');
		$('#advanceConfig').toggle('slow');
		targetEl.toggle('slow');
	}
 }

 function allCheckBoxTrigger(){
	$('#allCheckBox').click(function(evt){
	 	var checked = $(this).attr('checked');
	 	updateAllTableStatus(checked);		
	});
 } 
 
 function checkBoxTrigger(){
	$('.chekcbox-cls').each(function(){
		var el = $(this);
		el.click(function(evt){
			var tableName = el.val();
			var checked = el.attr('checked');
			updateTableStatus(tableName,checked);
		});		
	});
 }
 
 function updateAllTableStatus(status){
	var checked = status;
	$('.chekcbox-cls').attr('checked',checked).each(function(){
		var el = $(this);
		var tableName = el.val();
		updateTableStatus(tableName,checked);
	});
 }
 
 function updateTableStatus(tableName,status){
	 if(status){
		 $('#' + tableName).addClass('selected');
	 }
	 else{
		 $('#' + tableName).removeClass('selected');
	 }
 }
 
 function checkQueryForm(checkDb){
	 	var projectName = $('#projectName').val();
	 	var projectRoot = $('#projectRoot').val();
	 	var packageName = $('#packageName').val();
	 	var moduleName = $('#moduleName').val();
	 	var generator = $('#generator').val();
	 	
	 	if(!projectName){
	 		alert($('#checkProjectNameTips').html());
	 		return false;
	 	}
	 	
	 	if(!projectRoot){
	 		alert($('#checkProjectRootTips').html());
	 		return false;
	 	}
	 	
	 	if(!packageName){
	 		alert($('#checkPackageNameTips').html());
	 		return false;
	 	}
	 	
	 	if(!moduleName){
	 		alert($('#checkModuleNameTips').html());
	 		return false;
	 	}
	 	
	 	if(!generator){
	 		alert($('#checkGeneratorTips').html());
	 		return false;
	 	}
	 	
	 	if(checkDb){
		 	var driver = $('#driver').val();
		 	var url = $('#url').val();
		 	var username = $('#username').val();
		 	var password = $('#password').val();	 
		 	
		 	if(!driver){
		 		alert($('#checkDriverTips').html());
		 		return false;
		 	}
		 	
		 	if(!url){
		 		alert($('#checkUrlTips').html());
		 		return false;
		 	}
		 	
		 	if(!username){
		 		alert($('#checkUsernameTips').html());
		 		return false;
		 	}
		 	
		 	if(!password){
		 		alert($('#checkPasswordTips').html());
		 		return false;
		 	}		 	
	 	}
	 	
	 	return true;
 }
 
 function checkMetaData(){
 	var checked = checkQueryForm(false);
 	if(!checked){
 		return false;
 	}
	 	
 	var selected = false;
 	$('.chekcbox-cls').each(function(){
 		var el = $(this);
 		var checked = el.attr('checked');
 		if(checked){
 			selected = true;
 			return false;
 		}
 	});
 	
 	if(!selected){
 		var msg = $('#selectedTips').html();
 		alert(msg);
 		return false;
 	}
 	
 	return true;
 }
 
 function changeQueryBtStatus(disabled){
	 	var btEl = $('#queryBt');
	 	var temp = btEl.val();
 		btEl.attr('disabled',disabled);
 		btEl.val($('#clickQueryTips').html());
 		$('#clickQueryTips').html(temp);
 }
 
 function changeRunBtStatus(disabled){
	 var btEl = $('#runBt');
	 var temp = btEl.val();
	 btEl.attr('disabled',disabled);
	 btEl.val($('#clickRunTips').html());
	 $('#clickRunTips').html(temp);
 }
 
 function run(evt){
	 
	if(!checkMetaData()){
		return false;
	}
	
 	var metaData = transferToMetadata();
 	var generator = $('#generator').val();
 	
    //encode
 	var mdMetaData = encodeURI(JSONUtil.toString(metaData,{change : true,excludeTypes : ['function']}));
 	
 	var param = {
		'formMap.mdMetaData' : mdMetaData,
		'formMap.generator' : generator
 	};

 	changeRunBtStatus(true);
 	
 	$.ajax({
 		url:'/generatecode/generate.ee',
 		type : 'POST',
 		data : param,
 		dataType : 'json',
 		cache : false,
 		success : function(data){
 			changeRunBtStatus(false);
 			var title;
 			var message;
 			if(data && data.status && data.status == 'success'){
 				message = '<div style="height:200px;width:200px;">' 
 					+ '<div class="search_k" style="height:80px; padding-left:5px;">' + $('#successTips').html() + '</div>' 
 					+ '<div style="height:40px;" style="text-align:center;vertical-align:middle;">' 
 					+ '<a target="_blank" class="close go" href="/generatecode/download.ee?formMap.fileId=' + data.downloadUrl + '">' + $('#clickDownload').html() + '</a>' 
 					+ '</div>' 
 					+ '<div style="height:80px;">&nbsp;&nbsp;</div>' 
 					+ '</div>';
 				title = $('#downloadTips').html();
				
 			}
 			else{
 				message = '<div style="height:200px;width:200px;">' 
 					+ '<div class="search_k" style="height:80px; padding-left:5px;">' + $('#failureTips').html() + '</div>' 
 					+ '<div style="height:40px;" style="text-align:center;vertical-align:middle;">' 
 					+ '<a href="javascript:void(0);" onclick="$.unblockUI()">' + $('#clickSure').html() + '</a>' 
 					+ '</div>' 
 					+ '<div style="height:50px;">&nbsp;&nbsp;</div>' 
 					+ '</div>';  	
 				title = $('#failureTitleTips').html();
 			}
 			
 			alertBox(title,message);
 		}
 	});
 }
 
 function transferToMetadata(){
 	var metaData = new MetaData({
 		projectName : $('#projectName').val(),
 		projectRoot : $('#projectRoot').val(),
 		packageName : $('#packageName').val(),
 		moduleName : $('#moduleName').val(),
 		dbName : $('#dbName').val()
 	}); 
 	
 	var selectedTables = $('form.selected');
 	selectedTables.each(function(){
 		var el = $(this);
 		var table = new Table();
 		var tableName = el.attr('id');
 		var primaryKey = el.children().first().val();
 		table.setTableName(tableName);
 		table.setPrimaryKey(primaryKey);
 		var cols = el.children('table').children().children('tr:gt(0)');
 		cols.each(function(colIndex){
 			var col = $(this);
 			var elements = col.children();
 			if(elements.length > 1){
	 			var columnName = elements.eq(0).html();
	 			var typeName = elements.eq(1).html();
	 			var remarks = empty(elements.eq(2).find('input').val());
	 			var isPrimaryKey = (columnName == primaryKey);
	 			var isQuery = elements.eq(3).find('input').attr('checked');
	 			var isHead = elements.eq(4).find('input').attr('checked');
	 			var isIuput = elements.eq(5).find('input').attr('checked');
	 			var inputType = elements.eq(6).children().first().val();
	 			var required = elements.eq(7).find('input').attr('checked');
	 			if(!required){
	 				required = false;
	 			}
	 			var columnDef = empty(elements.eq(8).children().first().val());
	 			var format = empty(elements.eq(9).find('input').val());
	 			var column = new Column({
	 				columnName : columnName,
	 				typeName : typeName,
	 				remarks : remarks,
	 				isPrimaryKey : isPrimaryKey,
	 				isQuery : isQuery,
	 				isHead : isHead,
	 				isIuput : isIuput,
	 				inputType : inputType,
	 				required : required,
	 				format : format,
	 				columnDef : columnDef
	 			});
	 			table.getColumns().push(column);
 			}
 		});
 		metaData.getTables().push(table);
 	});

 	return metaData;
 }
 
 function alertBox(title,message){
	var uiConfig = {
    	css : {cursor : 'default',width:220,height:220}
    };
	
	var msg = '<div style="height:220px;width:220px;border:0;">';
	msg += '<div style="background:#0000CC; text-align:left;height:20px;">' 
			+ '<span style="float:left;padding-left:5px;color:#FFFFFF; font-weight:bold;">' + title + '</span>'
			+ '<span style="float:right;padding-right:5px;width:30px;font-weight:bold;">' 
			+ '<a href="javascript:void(0);" onclick="$.unblockUI()" style="color:#FFFFFF;" >' + $('#closeBtInfo').html() + '</a>' 
			+ '</span>'
			+ '</div>';
	
	msg += message;
	
	msg += '</div>';
	
	uiConfig.message = msg;
	
    $.blockUI(uiConfig); 
    
	$('.blockOverlay').attr('title',$('#clickClose').html()).click($.unblockUI); 
	
	$('.close').click($.unblockUI);	 
 }