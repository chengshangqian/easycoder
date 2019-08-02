/**
 * ESCoder RESTManager Library 1.0
 * Copyright 2011, Vin Cheng(成尚谦),lhx222@gmail.com
 * Dual licensed under the MIT or GPL Version 2 licenses
 * Date: 2011/11/2
 * Last Modified 2014-09-29 Ahin
 */
ESCoder.Manager = function(cfg){
	 this.createBt = 'createBt';
	 this.deleteSelected = 'deleteSelected';
	 this.allCheckBox = 'allCheckBox';
	 this.chekcboxSelector = '.chekcbox-cls';
	 this.deleteSelector = 'a.delete';
	 this.selectedTips = '请选择一条记录!';
	 this.deleteSelectedConfirmTips = '确定删除所选记录吗?';
	 this.deleteConfirmTips = '确定删除该信息吗?';
	 this.submitQueryBt = 'submitQueryBt';
	 this.submitQueryHandler = {};//function
	 this.queryForm = 'queryForm';
	 this.queryAction = '';
	 this.deleteAction = '';
	 this.createAction = '';
	 this.enabledValidate = true;
	 this.rules = {};
	 this.initNoHrefMenuEvent = true;
	 this.initCurrentLocation = true;
	 
	 if(cfg){
		 if(true === cfg.initNoHrefMenuEvent || false === cfg.initNoHrefMenuEvent){
			 this.initNoHrefMenuEvent = cfg.initNoHrefMenuEvent;
		 }
		 if(true === cfg.initCurrentLocation || false === cfg.initCurrentLocation){
			 this.initCurrentLocation = cfg.initCurrentLocation;
		 }
		 if(cfg.createBt){
			 this.createBt = cfg.createBt;
		 }
		 if(cfg.deleteSelected){
			 this.deleteSelected = cfg.deleteSelected;
		 }
		 if(cfg.allCheckBox){
			 this.allCheckBox = cfg.allCheckBox;
		 }
		 if(cfg.chekcboxSelector){
			 this.chekcboxSelector = cfg.chekcboxSelector;
		 }
		 if(cfg.deleteSelector){
			 this.deleteSelector = cfg.deleteSelector;
		 }
		 if(cfg.selectedTips){
			 this.selectedTips = cfg.selectedTips;
		 }
		 if(cfg.deleteSelectedConfirmTips){
			 this.deleteSelectedConfirmTips = cfg.deleteSelectedConfirmTips;
		 }
		 if(cfg.deleteConfirmTips){
			 this.deleteConfirmTips = cfg.deleteConfirmTips;
		 }
		 if(cfg.submitQueryBt){
			 this.submitQueryBt = cfg.submitQueryBt;
		 }
		 if(cfg.submitQueryHandler){
			 this.submitQueryHandler = cfg.submitQueryHandler;
		 }
		 if(cfg.queryForm){
			 this.queryForm = cfg.queryForm;
		 }
		 if(cfg.queryAction){
			 this.queryAction = cfg.queryAction;
		 }
		 if(cfg.deleteAction){
			 this.deleteAction = cfg.deleteAction;
		 }
		 if(cfg.createAction){
			 this.createAction = cfg.createAction;
		 }
		 if(cfg.enabledValidate && true === cfg.enabledValidate){
			 this.enabledValidate = cfg.enabledValidate;
		 }		 
		 if(cfg.rules){
			 this.rules = cfg.rules;
		 }		
		 
		 if(cfg.start && true === cfg.start ){
			 this.start(cfg.callback);
		 }
	 }
	 
	 return this;
 };
 
 ESCoder.Manager.prototype = {
	 setInitNoHrefMenuEvent : function(initNoHrefMenuEvent){
		 this.initNoHrefMenuEvent = initNoHrefMenuEvent;
	 },
	 getInitNoHrefMenuEvent : function(){
		return this.initNoHrefMenuEvent;
	 },	
	 setInitCurrentLocation : function(initCurrentLocation){
		 this.initCurrentLocation = initCurrentLocation;
	 },
	 getInitCurrentLocation : function(){
		return this.initCurrentLocation;
	 },	 
	 setCreateBt : function(createBt){
		 this.createBt = createBt;
	 },
	 getCreateBt : function(){
		return this.createBt;
	 },
	 setDeleteSelected : function(deleteSelected){
		 this.deleteSelected = deleteSelected;
	 },
	 getDeleteSelected : function(){
		 return this.deleteSelected;
	 },
	 setAllCheckBox : function(allCheckBox){
		 this.allCheckBox = allCheckBox;
	 },
	 getAllCheckBox : function(){
		 return this.allCheckBox;
	 },
	 setChekcboxSelector : function(chekcboxSelector){
		 this.chekcboxSelector = chekcboxSelector;
	 },
	 getChekcboxSelector : function(){
		 return this.chekcboxSelector;
	 },
	 setDeleteSelector : function(deleteSelector){
		 this.deleteSelector = deleteSelector;
	 },
	 getDeleteSelector : function(){
		 return this.deleteSelector;
	 },
	 setSelectedTips : function(selectedTips){
		 this.selectedTips = selectedTips;
	 },
	 getSelectedTips : function(){
		 return this.selectedTips;
	 },
	 setDeleteSelectedConfirmTips : function(deleteSelectedConfirmTips){
		 this.deleteSelectedConfirmTips = deleteSelectedConfirmTips;
	 },
	 getDeleteSelectedConfirmTips : function(){
		 return this.deleteSelectedConfirmTips;
	 },
	 setDeleteConfirmTips : function(deleteConfirmTips){
		 this.deleteConfirmTips = deleteConfirmTips;
	 },
	 getDeleteConfirmTips : function(){
		 return this.deleteConfirmTips;
	 },
	 setSubmitQueryBt : function(submitQueryBt){
		 this.submitQueryBt = submitQueryBt;
	 },
	 getSubmitQueryBt : function(){
		 return this.submitQueryBt;
	 },
	 setSubmitQueryHandler : function(submitQueryHandler){
		 this.submitQueryHandler = submitQueryHandler;
	 },
	 getSubmitQueryHandler : function(){
		 return this.submitQueryHandler;
	 },
	 setQueryForm : function(queryForm){
		 this.queryForm = queryForm;
	 },
	 getQueryForm : function(){
		 return this.queryForm;
	 },
	 setQueryAction : function(queryAction){
		 this.queryAction = queryAction;
	 },
	 getQueryAction : function(){
		 return this.queryAction;
	 },
	 setDeleteAction : function(deleteAction){
		 this.deleteAction = deleteAction;
	 },
	 getDeleteAction : function(){
		 return this.deleteAction;
	 },
	 setCreateAction : function(createAction){
		 this.createAction = createAction;
	 },
	 getCreateAction : function(){
		 return this.createAction;
	 },
	 setRules : function(rules){
		 this.rules = rules;
	 },
	 getRules : function(){
		 return this.rules;
	 },
	 
	 initValidate : function(callback){
		if(!this.enabledValidate){
			return;
		}		 
		var rules = {rules:this.getRules()};
		
		/*overwrite default date validate method 2012-03-07*/
		$.validator.methods.date = function (value, element){ 
			return this.optional(element) || Date.parse(value) != null; 
		}; 	
		
		$('#' + this.getQueryForm()).validate(rules);
		this.executeCallback(callback);
	 },
	 
	 toCreate : function(evt,el,selfManager){
		 evt.preventDefault();
		 window.location.href = selfManager.getCreateAction();
	 },
	 
	 toDeleteSelected : function(evt,el,selfManager){
        evt.preventDefault();
		var hasChecked = false;
		$(selfManager.getChekcboxSelector()).each(function(){
			var checked = $(this).attr('checked');
			if(checked){
				hasChecked = true;
				return false;
			}
		});
		
		var msg;
		
		if(!hasChecked){
			msg = selfManager.getSelectedTips() || $('#selectedTips').html();
			
			esAlert(msg);
			
			return false;
		}  
		
		msg = selfManager.getDeleteSelectedConfirmTips() || $('#deleteSelectedConfirmTips').html();
		
	 	var doDeleteSelected = function(){
	 		$('#' + selfManager.getQueryForm()).attr('action',selfManager.getDeleteAction()).submit();
	 	};
	 	
	 	esConfirm(msg,doDeleteSelected);
	 	
	 },
	 
	 allCheckBoxTrigger : function(evt,el,selfManager){
		 var checked = el.attr('checked');
		 $(selfManager.getChekcboxSelector()).attr('checked',checked);
	 },
	 
	 toDelete : function(evt,el,selfManager){
	 	evt.preventDefault();
	 	var msg =  selfManager.getDeleteConfirmTips() || $('#deleteConfirmTips').html();
	 	
	 	var doDelete = function(){
	 		var href = el.attr('href');
	 		window.location.href = href;
	 	};
	 	
	 	esConfirm(msg,doDelete);
	 	
	 },
	 
	 toSubmitQuery : function(evt,el,selfManager){
		 evt.preventDefault();
		 $('#' + selfManager.getQueryForm()).submit();
	 },
	 
	 executeCallback : function(callback){
		if(callback && (typeof callback == 'function')){
			callback(this);
		}
	 },
	 
	 start : function(callback){
		var selfManager = this;
		var toCreateHandler = this.toCreate;
		var toDeleteSelectedHandler = this.toDeleteSelected;
		var toDeleteHandler = this.toDelete;
		var allCheckBoxTriggerHandler = this.allCheckBoxTrigger; 
		var toSubmitQueryHandler = $.isFunction(this.submitQueryHandler) ? this.submitQueryHandler : this.toSubmitQuery; 
		
	 	$('#' + this.getCreateBt()).click(function(evt){
	 		var event = evt;
	 		var el = $(this);
	 		toCreateHandler(event,el,selfManager);
	 	});
	 	
	 	$('#' + this.getDeleteSelected()).click(function(evt){
	 		var event = evt;
	 		var el = $(this);
	 		toDeleteSelectedHandler(event,el,selfManager);
	 	});
	 	
	 	$(this.getDeleteSelector()).each(function(){
	 		$(this).click(function(evt){
		 		var event = evt;
		 		var el = $(this);
	 			toDeleteHandler(event,el,selfManager);
	 		});
	 	});	 	
	 	
	 	$('#' + this.getAllCheckBox()).click(function(evt){
	 		var event = evt;
	 		var el = $(this);
	 		allCheckBoxTriggerHandler(event,el,selfManager);
	 	});
	 	
	 	$('#' + this.getSubmitQueryBt()).click(function(evt){
	 		var event = evt;
	 		var el = $(this);
	 		toSubmitQueryHandler(event,el,selfManager);
	 	});
	 	
	 	$('#' + this.getQueryForm()).attr('action',this.getQueryAction());
	 	
	 	this.initValidate();
	 	
	 	if(true === this.getInitNoHrefMenuEvent()){
	 		//escoder-core-x.x.js
	 		initNoHrefMenuClickEvent();
	 	}
	 	
	 	if(true === this.getInitCurrentLocation()){
	 		//escoder-core-x.x.js
	 		initCurrentLocation();
	 	}
	 	
	 	this.executeCallback(callback);
	 }
 };
	