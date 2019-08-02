/**
 * ESCoder Library 1.0
 * Copyright 2011, Vin Cheng(成尚谦),lhx222@gmail.com
 * Dual licensed under the MIT or GPL Version 2 licenses
 * Date: 2011/11/2
 */
 var ESCoder = window.ESCoder = {
	version : '1.0',
	date : '2011/11/2',
	author : 'Vin Cheng(成尚谦)',
	email : 'lhx222@gmail.com',
	page : '',
	license : 'MIT or GPL2',
	copyright : 'Copyright 2011'
 };
 
 /**
  * 警告提示:函数不做类型检测，传入时请注意
  * @msg 警告提示信息
  * @sureFn 点击确定按钮后调用函数
  */
 function esAlert(msg,sureFn){
	 var _sureFn = sureFn || function(){};
     if($.dialog){
         $.dialog.alert(msg,_sureFn);
     }
     else{
         alert(msg);
         sureFn();
     }
 }
 
 /**
  * 确认提示:函数不做类型检测，传入时请注意
  * @msg 确认提示
  * @sureFn 点击确定按钮后调用函数
  * @cancelFn 点击取消按钮后调用函数
  */ 
function esConfirm(msg,sureFn,cancelFn){
	var _sureFn = sureFn || function(){};
	var _cancelFn = cancelFn || function(){};
	if($.dialog){
	    $.dialog.confirm(msg, _sureFn, _cancelFn);
	}
	else{
	 	if(window.confirm(msg)){
	 		_sureFn();
	 	}
	 	else{
	 		_cancelFn();
	 	}
	}
} 

/**
 * 初始化无链接地址的菜单点击事件
 */  
function initNoHrefMenuClickEvent(){
    
	//一级菜单
	$("#main-nav li a.nav-top-item").click(function(evt){
		var menuHref = $(this).attr('href');
		if(!menuHref){
			evt.preventDefault();
		}
	});
	
	//二级菜单
	$('#main-nav li ul li a').click(function(evt){
		var menuHref = $(this).attr('href');
		if(!menuHref){
			evt.preventDefault();
		}
	});
}

/**
 * 初始化面包屑：当前的位置
 */  
function initCurrentLocation(){
	var levelOneMenu = $("#main-nav li.cur a.nav-top-item");
	var levelTwoMenu = $('#main-nav li ul li a.current');
	  
	var levelOneMenuName = levelOneMenu.text();
	var levelOneMenuHref = levelOneMenu.attr('href') || '#';
	  
	var levelTwoMenuName = levelTwoMenu.text();
	var levelTwoMenuHref = levelTwoMenu.attr('href');
	  
	var currentLocationHtml = '';

	if(levelOneMenuName){
		currentLocationHtml += '<a href="' + levelOneMenuHref + '">' + levelOneMenuName + '</a>';
	}
	  
	if(levelTwoMenuName){
		currentLocationHtml += ' &gt; ';
		  
		if(levelTwoMenuHref){
			currentLocationHtml += '<a href="' + levelTwoMenuHref + '">' + levelTwoMenuName + '</a>';
		}
		else{
			currentLocationHtml += levelTwoMenuName;
		}
	}
	  
	$('#currentLocation').append(currentLocationHtml);
}