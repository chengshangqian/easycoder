/**
 * ESCoder Library 1.0
 * Copyright 2011, Vin Cheng(����ǫ),lhx222@gmail.com
 * Dual licensed under the MIT or GPL Version 2 licenses
 * Date: 2011/11/2
 */
 var ESCoder = window.ESCoder = {
	version : '1.0',
	date : '2011/11/2',
	author : 'Vin Cheng(����ǫ)',
	email : 'lhx222@gmail.com',
	page : '',
	license : 'MIT or GPL2',
	copyright : 'Copyright 2011'
 };
 
 /**
  * ������ʾ:�����������ͼ�⣬����ʱ��ע��
  * @msg ������ʾ��Ϣ
  * @sureFn ���ȷ����ť����ú���
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
  * ȷ����ʾ:�����������ͼ�⣬����ʱ��ע��
  * @msg ȷ����ʾ
  * @sureFn ���ȷ����ť����ú���
  * @cancelFn ���ȡ����ť����ú���
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
 * ��ʼ�������ӵ�ַ�Ĳ˵�����¼�
 */  
function initNoHrefMenuClickEvent(){
    
	//һ���˵�
	$("#main-nav li a.nav-top-item").click(function(evt){
		var menuHref = $(this).attr('href');
		if(!menuHref){
			evt.preventDefault();
		}
	});
	
	//�����˵�
	$('#main-nav li ul li a').click(function(evt){
		var menuHref = $(this).attr('href');
		if(!menuHref){
			evt.preventDefault();
		}
	});
}

/**
 * ��ʼ�����м����ǰ��λ��
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