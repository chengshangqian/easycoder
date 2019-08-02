package org.ican.easycode.generator.gzdec;

import java.util.ArrayList;
import java.util.List;
import org.ican.easycode.generator.cocoa.CocoaGenerator;
import org.ican.easycode.generator.common.model.MDColumn;
import org.ican.easycode.generator.common.model.MDMetaData;
import org.ican.easycode.generator.common.model.MDTable;

/**
 * 远教定制版
 * Difference Between GzdecGenerater And CocoaGenerator IS Template
 * @author Vin,lhx222@gmail.com
 */
public final class GzdecGenerater extends CocoaGenerator{
	private static final String templatePath = "/org/ican/easycode/generator/gzdec/templates/";
	
	public GzdecGenerater(){
		super();
	}
	
	public GzdecGenerater(MDMetaData metaDatas){
		super(metaDatas);
	}
	
	/**
	 * Difference Between GzdecGenerater And CocoaGenerator IS Template
	 * @return
	 */
	public String getTemplatePath(){
		return templatePath;
	}	

	public static void main(String[] args) throws Exception{
		MDMetaData mdMetaData = new MDMetaData();
		mdMetaData.setModuleName("cms");
		mdMetaData.setPackageName("org.ican.easycode");
		mdMetaData.setProjectName("easycode");
		mdMetaData.setProjectRoot("E:/codes/source");
		List<MDTable> tables = new ArrayList<MDTable>();
		MDTable mdTable = new MDTable();
		mdTable.setPrimaryKey("TYPE_ID");
		mdTable.setTableName("CMS_TYPE");
		mdTable.setSelected(true);
		List<MDColumn> columns = new ArrayList<MDColumn>();
		
		MDColumn typeId = new MDColumn();
		typeId.setColumnName("TYPE_ID");
		typeId.setTypeName("VARCHAR2");
		typeId.setStandardType("VARCHAR");
		typeId.setPrimaryKey(true);
		typeId.setIuput(false);
		typeId.setHead(false);
		columns.add(typeId);
		
		MDColumn typeName = new MDColumn();
		typeName.setColumnName("TYPE_NAME");
		typeName.setTypeName("VARCHAR2");
		typeName.setStandardType("VARCHAR");
		typeName.setRemarks("分类名称");
		typeName.setHead(true);
		typeName.setQuery(true);
		typeName.setRequired(true);
		typeName.setIuput(true);
		typeName.setInputType("text");
		columns.add(typeName);
		
		MDColumn createdDt = new MDColumn();
		createdDt.setColumnName("CREATED_DT");
		createdDt.setTypeName("DATE");
		createdDt.setStandardType("DATE");
		createdDt.setRemarks("创建日期");
		createdDt.setHead(true);
		createdDt.setQuery(true);
		createdDt.setRequired(true);
		createdDt.setFormat("yyyy-MM-dd");
		createdDt.setIuput(true);
		columns.add(createdDt);
		
		MDColumn typeDesc = new MDColumn();
		typeDesc.setColumnName("TYPE_DESC");
		typeDesc.setTypeName("VARCHAR2");
		typeDesc.setStandardType("VARCHAR");
		typeDesc.setRemarks("description");
		typeDesc.setHead(true);
		typeDesc.setQuery(false);
		typeDesc.setRequired(false);
		typeDesc.setIuput(true);
		typeDesc.setInputType("textarea");
		columns.add(typeDesc);
		
		MDColumn typeDetail = new MDColumn();
		typeDetail.setColumnName("TYPE_DETAIL");
		typeDetail.setTypeName("VARCHAR2");
		typeDetail.setStandardType("VARCHAR");
		typeDetail.setRemarks("details");
		typeDetail.setHead(true);
		typeDetail.setQuery(false);
		typeDetail.setRequired(true);
		typeDetail.setIuput(true);
		typeDetail.setInputType("htmlEditor");
		columns.add(typeDetail);
		
		MDColumn version = new MDColumn();
		version.setColumnName("VERSION");
		version.setTypeName("NUMBER");
		version.setStandardType("NUMBER");
		version.setHead(false);
		version.setQuery(true);
		version.setRequired(false);
		version.setIuput(false);
		columns.add(version);
		
		mdTable.setColumns(columns);
		tables.add(mdTable);
		mdMetaData.setTables(tables);
		
		GzdecGenerater gzdecGenerater = new GzdecGenerater(mdMetaData);
		gzdecGenerater.run();
	}

}
