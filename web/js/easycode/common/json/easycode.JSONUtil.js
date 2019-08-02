/**
 *JSONUtil类 
 * 提供将javascript对象转换为字符串输出功能，输出时属性和字符串值用单引号括住
 * cfg参数为对象类型，Object{'change' : true | false,'format' : 'yyyy-MM-dd' | 'yyyy/MM/dd' | ...,}
 * 其中，change参数用来判断是否字符串中的单引号转移；format是格式化Date需要的格式(实现部分的时间格式)
 *@author : Vin(成文锋)
 *@since : 1.0
 *@date : 2011-02-16
 */
var JSONUtil = window.JSONUtil = {
	version : '1.0',
	
	toString : function(object,config){
		return JSONUtil.toJSONString(object,config);
	},
	
	isExcludeType : function(excludeTypes,type){
		if(excludeTypes && (excludeTypes instanceof Array)){
			for(var i = 0; i < excludeTypes.length; i++){
				var _type = excludeTypes[i];
				if(_type == type){
					return true;
				}
			}
		}
		return false;
	},
	
	isExcludeInstance : function(excludeInstances,obj){
		if(excludeInstances && (excludeInstances instanceof Array)){
			for(var i = 0; i < excludeInstances.length; i++){
				var OBJ = excludeInstances[i];
				if(obj instanceof OBJ){
					return true;
				}
			}
		}
		return false;
	},
	
	toJSONString : function(object,config){
		config = config || {change:true,format:'yyyy-MM-dd',excludeTypes : [],excludeInstances : []};
		var json = "";
		var typeInfo = typeof object;
		if(JSONUtil.isExcludeType(config.excludeTypes,typeInfo)){
			return '';
		}
		if(JSONUtil.isExcludeInstance(config.excludeInstances,object)){
			return '';
		}
		if(typeInfo == 'function'){
			return JSONUtil.wrapSymbol('function');
		}
		else if(typeInfo == 'number' || typeInfo == 'boolean' || typeInfo == 'string'){
			if(typeInfo == 'number' || typeInfo == 'boolean'){
				json += object;
			}
			else{
				//转义单引号
				var change = config['change'];
				if(change && true === change){
					object = object.replace(JSONUtil.symbolRegex,JSONUtil.replaceSymbol);
				}
				json += JSONUtil.wrapSymbol(object);
			}
		}
		else{
			var isArray = object instanceof Array;
			var isDate = object instanceof Date;
			if(isArray){
				json += "[";
				for(var len = 0; len < object.length; len++){
					var arrObject = object[len];
					if(JSONUtil.isExcludeType(config.excludeTypes,typeof arrObject)){
						continue;
					}
					if(JSONUtil.isExcludeInstance(config.excludeInstances,arrObject)){
						continue;
					}
					json += JSONUtil.toJSONString(arrObject,config);	
					if(len < object.length - 1){
						json += ",";
					}
				}	
				json += "]";
			}
			else if(isDate){
				var format = config['format'];
				if(!format){
					format = 'yyyy-MM-dd';
				}
				object = JSONUtil.toFormat(object,format);
				json += JSONUtil.wrapSymbol(object);
			}
			else {
				json += "{";		
				var count = 0;	
				for(var attr in object){
					var objObject = object[attr];
					if(JSONUtil.isExcludeType(config.excludeTypes,typeof objObject)){
						continue;
					}
					if(JSONUtil.isExcludeInstance(config.excludeInstances,objObject)){
						continue;
					}
					if(count > 0){
						json += ",";
					}					
					json += JSONUtil.wrapSymbol(attr) + " : " + JSONUtil.toJSONString(objObject,config);	
					count++;
				}					
				json += "}";
			}
		}
		return json;		
	},
	
	toFormat : function(date,format){
		var formatString = JSONUtil.getFormatString('' + format);
		if(formatString){
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var dat = date.getDate();
			var hour = date.getHours();
			var minutes = date.getMinutes();
			var second = date.getSeconds();
			if(month < 10){
				month = '0' + month;
			}
			if(dat < 10){
				dat = '0' + dat;
			}
			if(hour < 10){
				hour = '0' + hour;
			}
			if(minutes < 10){
				minutes = '0' + minutes;
			}
			if(second < 10){
				second = '0' + second;
			}
			var dateString = formatString.replace('{yyyy}',year).replace('{MM}',month).replace('{dd}',dat).replace('{HH}',hour).replace('{mm}',minutes).replace('{ss}',second);
			return dateString;
		}
		else{
			return date.toLocaleTimeString();
		}
	},	
	
	getFormatString : function (format){
		var formats = {
		'yyyy-MM-dd HH:mm:ss':'{yyyy}-{MM}-{dd} {HH}:{mm}:{ss}',
		'yyyy-MM-dd HH:mm':'{yyyy}-{MM}-{dd} {HH}:{mm}',
		'yyyy-MM-dd HH':'{yyyy}-{MM}-{dd} {HH}',
		'yyyy-MM-dd':'{yyyy}-{MM}-{dd}',
		
		'yyyy/MM/dd HH:mm:ss':'{yyyy}/{MM}/{dd} {HH}:{mm}:{ss}',
		'yyyy/MM/dd HH:mm':'{yyyy}/{MM}/{dd} {HH}:{mm}',
		'yyyy/MM/dd HH':'{yyyy}/{MM}/{dd} {HH}',
		'yyyy/MM/dd':'{yyyy}/{MM}/{dd}',
		
		'yyyy-dd-MM HH:mm:ss':'{yyyy}-{dd}-{MM} {HH}:{mm}:{ss}',
		'yyyy-dd-MM HH:mm':'{yyyy}-{dd}-{MM} {HH}:{mm}',
		'yyyy-dd-MM HH':'{yyyy}-{dd}-{MM} {HH}',
		'yyyy-dd-MM':'{yyyy}-{dd}-{MM}',
		
		'yyyy/dd/MM HH:mm:ss':'{yyyy}/{dd}/{MM} {HH}:{mm}:{ss}',
		'yyyy/dd/MM HH:mm':'{yyyy}/{dd}/{MM} {HH}:{mm}',
		'yyyy/dd/MM HH':'{yyyy}/{dd}/{MM} {HH}',
		'yyyy/dd/MM':'{yyyy}/{dd}/{MM}'
	   };
	   return formats[format];
	},
	
	symbol : '"',
	
	symbolRegex : /"/g,
	
	replaceSymbol : '\\"',
	
	wrapSymbol : function(source){
		return JSONUtil.symbol + source + JSONUtil.symbol;
	},
	
	toJSON : function(jsonString){
		if(!jsonString){
			return {};
		}
		return eval("(" + jsonString + ")");	
	}
};