/**
 * ESCoder Merger Library 1.0
 * Copyright 2011, Vin Cheng(³ÉÉÐÇ«),lhx222@gmail.com
 * Dual licensed under the MIT or GPL Version 2 licenses
 * Date: 2011/11/2
 */
ESCoder.Merger = function(cfg){
	 this.backBt = 'backBt';
	 this.inputForm = 'inputForm';
	 this.xhEditors = [];
	 this.requiredErrorHtml = '<em style="font-weight:bold; color:#F00;">&nbsp;*</em>';
	 this.backIndex = '';
	 this.uploadEnabled = false;
	 this.uploadCfg = {
		upLinkUrl:'',upLinkExt:"zip,rar,txt",
		upImgUrl:'',upImgExt:"jpg,jpeg,gif,png,bmg",
		upFlashUrl:'',upFlashExt:"swf",
		upMediaUrl:'',upMediaExt:"wmv,avi,wma,mp3,mid"
	 };
	 this.enabledValidate = true;
	 this.rules = {};
	 
	 if(cfg){
		 if(cfg.backBt){
			 this.backBt = cfg.backBt;
		 }
		 if(cfg.inputForm){
			 this.inputForm = cfg.inputForm;
		 }		 
		 if(cfg.xhEditors){
			 this.xhEditors = cfg.xhEditors;
		 }
		 if(cfg.backIndex){
			 this.backIndex = cfg.backIndex;
		 }
		 if(cfg.uploadEnabled && true === cfg.uploadEnabled){
			 this.uploadEnabled = cfg.uploadEnabled;
		 }
		 if(cfg.uploadCfg){
			if(cfg.uploadCfg.upLinkUrl) {
				this.uploadCfg.upLinkUrl = cfg.uploadCfg.upLinkUrl;
				this.uploadEnabled = true;
			}
			if(cfg.uploadCfg.upLinkExt) {
				this.uploadCfg.upLinkExt = cfg.uploadCfg.upLinkExt;
			}
			if(cfg.uploadCfg.upImgUrl) {
				this.uploadCfg.upImgUrl = cfg.uploadCfg.upImgUrl;
				this.uploadEnabled = true;
			}
			if(cfg.uploadCfg.upImgExt) {
				this.uploadCfg.upImgExt = cfg.uploadCfg.upImgExt;
			}
			if(cfg.uploadCfg.upFlashUrl) {
				this.uploadCfg.upFlashUrl = cfg.uploadCfg.upFlashUrl;
				this.uploadEnabled = true;
			}
			if(cfg.uploadCfg.upFlashExt) {
				this.uploadCfg.upFlashExt = cfg.uploadCfg.upFlashExt;
			}
			if(cfg.uploadCfg.upMediaUrl) {
				this.uploadCfg.upMediaUrl = cfg.uploadCfg.upMediaUrl;
				this.uploadEnabled = true;
			}
			if(cfg.uploadCfg.upMediaExt) {
				this.uploadCfg.upMediaExt = cfg.uploadCfg.upMediaExt;
			}
		 }
		 if(cfg.enabledValidate && true === cfg.enabledValidate){
			 this.enabledValidate = cfg.enabledValidate;
		 }
		 if(cfg.rules){
			 this.rules = cfg.rules;
		 }
		 if(cfg.requiredErrorHtml){
			 this.requiredErrorHtml = cfg.requiredErrorHtml;
		 }
		 if(cfg.start && true === cfg.start ){
			 this.start(cfg.callback);
		 }
	 }
	 
	 return this;
 };
 
 ESCoder.Merger.prototype = {
	 setBackBt : function(backBt){
		 this.backBt = backBt;
	 },
	 getBackBt : function(){
		return this.backBt;
	 },
	 setInputForm : function(inputForm){
		 this.inputForm = inputForm;
	 },
	 getInputForm : function(){
		 return this.inputForm;
	 },
	 setXhEditors : function(xhEditors){
		 this.xhEditors = xhEditors;
	 },
	 getXhEditors : function(){
		 return this.xhEditors;
	 },
	 setBackIndex : function(backIndex){
		 this.backIndex = backIndex;
	 },
	 getBackIndex : function(){
		 return this.backIndex;
	 },
	 setUploadEnabled : function(uploadEnabled){
		 this.uploadEnabled = uploadEnabled;
	 },
	 getUploadEnabled : function(){
		 return this.uploadEnabled;
	 },
	 setUploadCfg : function(uploadCfg){
		 this.uploadCfg = uploadCfg;
	 },
	 getUploadCfg : function(){
		 return this.uploadCfg;
	 },
	 overwriteUploadCfg : function(uploadCfg){
		 if(uploadCfg){
			if(uploadCfg.upLinkUrl) {
				this.uploadCfg.upLinkUrl = uploadCfg.upLinkUrl;
				this.uploadEnabled = true;
			}
			if(uploadCfg.upLinkExt) {
				this.uploadCfg.upLinkExt = uploadCfg.upLinkExt;
			}
			if(uploadCfg.upImgUrl) {
				this.uploadCfg.upImgUrl = uploadCfg.upImgUrl;
				this.uploadEnabled = true;
			}
			if(uploadCfg.upImgExt) {
				this.uploadCfg.upImgExt = uploadCfg.upImgExt;
			}
			if(uploadCfg.upFlashUrl) {
				this.uploadCfg.upFlashUrl = uploadCfg.upFlashUrl;
				this.uploadEnabled = true;
			}
			if(uploadCfg.upFlashExt) {
				this.uploadCfg.upFlashExt = uploadCfg.upFlashExt;
			}
			if(uploadCfg.upMediaUrl) {
				this.uploadCfg.upMediaUrl = uploadCfg.upMediaUrl;
				this.uploadEnabled = true;
			}
			if(uploadCfg.upMediaExt) {
				this.uploadCfg.upMediaExt = uploadCfg.upMediaExt;
			}
		 }
	 },
	 setRules : function(rules){
		 this.rules = rules;
	 },
	 getRules : function(){
		 return this.rules;
	 },
	 setRequiredErrorHtml : function(requiredErrorHtml){
		 this.requiredErrorHtml = requiredErrorHtml;
	 },
	 getRequiredErrorHtml : function(){
		 return this.requiredErrorHtml;
	 },
	 backIndexHandler : function(evt,selfManager){
		 window.location.href = selfManager.getBackIndex();
		 window.history.go(-1);
	 },
	 
	 initXhEditor : function(uploadCfg){
		 this.overwriteUploadCfg(uploadCfg);
		 var xhEditors = this.getXhEditors();
		 var len = (xhEditors && xhEditors.length) ? xhEditors.length : 0;
		 if(len > 0){
			 var uploadEnabled = this.getUploadEnabled();
			 for(var i = 0; i < len; i++){
				 var id = xhEditors[i];
				 if(uploadEnabled){
					 $('#' + id).xheditor(this.getUploadCfg());
				 }
				 else{
					 $('#' + id).xheditor();
				 }
			 }
		 }		 
	 },
	 
	 initValidate : function(callback){
		if(!this.enabledValidate){
			return;
		}
		var rules = {
			rules:this.getRules()
			,errorElement : 'em'
			,errorPlacement : function(error, element) {   
	            if ( element.is(":radio") || element.is(":checkbox")){  
	                element.parent().find(":last-child").after(error);  
	            }
	            else{   
	                error.appendTo( element.parent());  
	            }  
	        }
		};
		
		/*overwrite default date validate methed 2012-03-07*/
		$.validator.methods.date = function (value, element) 
		{ 
			return this.optional(element) || Date.parse(value) != null; 
		}; 
        
		$('#' + this.getInputForm()).validate(rules);
		$('.required').after(this.getRequiredErrorHtml());
		this.executeCallback(callback);
	 },
	 
	 executeCallback : function(callback){
		if(callback && (typeof callback == 'function')){
			callback(this);
		}
	 },	 
	 
	 start : function(callback){
		var selfManager = this;
		
        var backIndexHandler = this.backIndexHandler;
		$('#' + this.getBackBt()).click(function(evt){
			backIndexHandler(evt,selfManager);
		});
		
		this.initXhEditor();
		this.initValidate();
		
		this.executeCallback(callback);
	 }
 };
	