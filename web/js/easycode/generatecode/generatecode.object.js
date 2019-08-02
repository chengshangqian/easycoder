/**
 * @author Vin
 * @since 2011-02-22
 */

var MetaData = function(cfg){
	if(cfg){
		this.projectName = cfg.projectName || '';
		this.packageName = cfg.packageName || '';
		this.projectRoot = cfg.projectRoot || '';
		this.moduleName = cfg.moduleName || '';
		this.dbName = cfg.dbName || '';
		this.tables = cfg.tables || [];
	}
	else{
		this.projectName = '';
		this.packageName = '';
		this.projectRoot = '';
		this.moduleName = '';
		this.dbName = '';
		this.tables = [];
	}
	return this;
};
MetaData.prototype = {
		
	initTables : function(array){
		if(!array || !array.length || array.length <= 0 || !(array instanceof Array)){
			return;
		}
		
		//clear
		this.tables = [];
	 	for(var i = 0; i < array.length; i++){
	 		var tableObj = array[i];
	 		var table = new Table();
	 		var cols = [];
	 		for(var p in tableObj){
	 			if(p == 'columns'){
	 				cols = tableObj.columns;
	 			}
	 			else{
	 				table[p] =  tableObj[p];
	 			}
	 		}
	 		table.initColumns(cols);
	 		this.tables.push(table);
	 	}	
	},
	
	getProjectName : function(){
		return this.projectName;
	},
	
	setProjectName : function(projectName){
		this.projectName = projectName;
	},
	
	getPackageName : function(){
		return this.packageName;
	},
	
	setPackageName : function(packageName){
		this.packageName = packageName;
	},
	
	getProjectRoot : function(){
		return this.projectRoot;
	},
	
	setProjectRoot : function(projectRoot){
		this.projectRoot = projectRoot;
	},
	
	getModuleName : function(){
		return this.moduleName;
	},
	
	setModuleName : function(moduleName){
		this.moduleName = moduleName;
	},
	
	getDbName : function(){
		return this.dbName;
	},
	
	setDbName : function(dbName){
		this.dbName = dbName;
	},
	
	getTables : function(){
		return this.tables;
	},
	
	getSelectedTables : function(){
		var selectedTbs = [];
		for(var i = 0; i < this.getTablesLength(); i++){
			var table = this.tables[i];
			if(table.getSelected()){
				selectedTbs.push(table);
			}
		}
		return selectedTbs;
	},
	
	getSelectedTablesString : function(){
		var selectedTbs = '';
		for(var i = 0; i < this.getTablesLength(); i++){
			var table = this.tables[i];
			if(table.getSelected()){
				if('' == selectedTbs){
					selectedTbs += table.getTableName();
				}
				else{
					selectedTbs += ',' + table.getTableName();
				}
			}
		}
		return selectedTbs;
	},
	
	getTablesLength : function(){
		return this.tables.length;
	},
	
	setTables : function(tables){
		this.tables = tables;
	},
	
	getTable : function(tableName){
		for(var i = 0; i < this.getTablesLength(); i++){
			var table = this.tables[i];
			var name = table.getTableName();
			if(name == tableName){
				return table;
			}
		}
		return null;
	}
};


var Table = function(cfg){
	if(cfg){
		this.tableName = cfg.tableName || '';
		this.primaryKey = cfg.primaryKey || '';		
		this.columns = cfg.columns || [];
		this.selected = cfg.selected === true ? true : false;
	}
	else{
		this.tableName = '';
		this.primaryKey = '';		
		this.columns = [];
		this.selected = false;
	}
	return this;
};
Table.prototype = {
	initColumns : function(array){
		if(!array || !array.length || array.length <= 0 || !(array instanceof Array)){
			return;
		}
	 	//clear columns
	 	this.columns = [];
	 	for(var i = 0; i < array.length; i++){
	 		var col = array[i];
	 		var columnName = col.columnName;
	 		var column = new Column();
	 		for(var p in col){
	 			if(p == 'columnDef' || p == 'format' || p == 'inputType'){
	 				continue;
	 			}
	 			column[p] = col[p];
	 		}
	 		if(columnName == this.primaryKey){
	 			column.setIsPrimaryKey(true);
	 			column.setIsQuery(false);
	 			column.setIsIuput(false);
	 			column.setIsHead(false);
	 		}
	 		this.columns.push(column);
	 	}
	},
	
	getTableName : function(){
		return this.tableName;
	},
	
	setTableName : function(tableName){
		this.tableName = tableName;
	},	
	
	getColumns : function(){
	 	return this.columns;		
	},
	
	getColumn : function(columnName){
		for(var i = 0; i < this.getColumnsLength(); i++){
			var column = this.columns[i];
			var name = column.getColumnName();
			if(name == columnName){
				return column;
			}
		}
		return null;	
	},
	
	setColumns : function(columns){
		this.columns = columns;
	},
	
	getColumnsString : function(){
	 	var columnsHtml = '';
	 	for(var i = 0; i < this.getColumnsLength(); i++){
	 		var column = this.columns[i];
	 		columnsHtml +=  column.getColumnName();
			if(i < this.columns.length - 1){
				columnsHtml +=  ', ';
			}
	 	}
	 	return columnsHtml;			
	},
	
	getColumnsLength : function(){
		return this.columns.length;		
	},

	getPrimaryKey : function(){
		return this.primaryKey;
	},
	
	setPrimaryKey : function(primaryKey){
		this.primaryKey = primaryKey;
	},
	
	getSelected : function(){
		return this.selected;
	},
	
	setSelected : function(selected){
		this.selected = selected;
	}
};


var Column = function(cfg){
	if(cfg){
		this.columnName = cfg.columnName || '';
		this.typeName = cfg.typeName || '';		
		this.standardType = cfg.standardType || '';		
		this.remarks = cfg.remarks || '';
		this.isPrimaryKey = cfg.isPrimaryKey === true ? true : false;
		this.isQuery = cfg.isQuery === true ? true : false;
		this.isHead = cfg.isHead === false ? false : true;
		this.isIuput = cfg.isIuput === false ? false : true;
		this.inputType = cfg.inputType || 'text';
		this.format = cfg.format || 'yyyy-MM-dd HH:mm:ss';
		this.columnDef = cfg.columnDef || '';
		this.required = cfg.required === true ? true : false;
	}
	else{
		this.columnName = '';
		this.typeName = '';		
		this.standardType = '';		
		this.remarks = '';
		this.isPrimaryKey = false;
		this.isQuery = false;
		this.isHead = true;
		this.isIuput = true;
		this.inputType = 'text';
		this.format = 'yyyy-MM-dd HH:mm:ss';
		this.columnDef = '';
		this.required = false;		
	}	
	return this;
};
Column.prototype = {
	
	getColumnName : function(){
		return this.columnName;
	},
	
	setColumnName : function(columnName){
		this.columnName = columnName;
	},	
	
	getTypeName : function(){
	 	return this.typeName;		
	},
	
	setTypeName : function(typeName){
		this.typeName = typeName;
	},
	
	getStandardType : function(){
		return this.standardType;		
	},
	
	setStandardType : function(standardType){
		this.standardType = standardType;
	},
	
	getRemarks : function(){
		return this.remarks;		
	},
	
	setRemarks : function(remarks){
		this.remarks = remarks;
	},
	
	getIsPrimaryKey : function(){
		return this.isPrimaryKey;
	},
	
	setIsPrimaryKey : function(isPrimaryKey){
		this.isPrimaryKey = isPrimaryKey;
	},
	
	getIsQuery : function(){
		return this.isQuery;
	},
	
	setIsQuery : function(isQuery){
		this.isQuery = isQuery;
	},
	
	getIsHead : function(){
		return this.isHead;
	},
	
	setIsHead : function(isHead){
		this.isHead = isHead;
	},
	
	getIsIuput : function(){
		return this.isIuput;
	},
	
	setIsIuput : function(isIuput){
		this.isIuput = isIuput;
	},
	
	getInputType : function(){
		return this.inputType;
	},
	
	setInputType : function(inputType){
		this.inputType = inputType;
	},
	
	getRequired : function(){
		return this.required;
	},
	
	setRequired : function(required){
		this.required = required;
	},
	
	getFormat : function(){
		return this.format;
	},
	
	setFormat : function(format){
		this.format = format;
	},
	
	getColumnDef : function(){
		return this.columnDef;
	},
	
	setColumnDef : function(columnDef){
		this.columnDef = columnDef;
	}
};