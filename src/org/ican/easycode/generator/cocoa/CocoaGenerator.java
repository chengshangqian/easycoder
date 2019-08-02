package org.ican.easycode.generator.cocoa;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringReader;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tools.ant.DefaultLogger;
import org.apache.tools.ant.DemuxOutputStream;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Delete;
import org.apache.tools.ant.taskdefs.XSLTProcess;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.ican.easycode.common.config.EasycodeConfig;
import org.ican.easycode.generator.common.generator.Generator;
import org.ican.easycode.generator.common.model.MDColumn;
import org.ican.easycode.generator.common.model.MDMetaData;
import org.ican.easycode.generator.common.model.MDSourceFile;
import org.ican.easycode.generator.common.model.MDTable;
import org.ican.easycode.generator.common.util.MROUtil;

/**
 * Cocoa代码生成器
 * @author Vin,lhx222@gmail.com
 */
public class CocoaGenerator extends AbstractCocoaGenerator{
	
	public CocoaGenerator(){
		super();
	}
	
	public CocoaGenerator(MDMetaData metaDatas){
		super(metaDatas);
	}

	/**
	 * 运行代码生成任务
	 * @param mdMetaData
	 * @return
	 */
	public String run() {
		boolean success = false;
		String root = this.getMetaDatas().getProjectRoot();
		String projectName = this.getMetaDatas().getProjectName();
		String packageName = this.getMetaDatas().getPackageName();
		String moduleName = this.getMetaDatas().getModuleName();
		String zipDir = projectName + System.currentTimeMillis();
		String destDir = root + separator + projectName + separator + zipDir;
		String appRealpath = EasycodeConfig.getProperty("generator.web.app.realpath");
		String temppath = EasycodeConfig.getProperty("generator.web.xml.temppath");
		String in = destDir + separator + temppath + separator + metadataXml;
		String templatePath = this.getTemplatePath();
		int count = 0;
		try{
			List<MDSourceFile> list = new ArrayList<MDSourceFile>();
			Map<String,String> map = new HashMap<String,String>();
			for(MDTable mdTable : this.getMetaDatas().getTables()){
				String xmlContent = transformClassIbatisJspJsXml(projectName,packageName, moduleName, mdTable);
				String className = MROUtil.tableNameToClassName(mdTable.getTableName());
				String tableName = mdTable.getTableName().toLowerCase();
			    for(int i = 0; i < styles.length; i++){
			    	String style = styles[i];
			    	String fileSuffixName = fileSuffixNames[i];
					MDSourceFile mdSourceFile = new MDSourceFile();
					map.put("destDir",destDir);
					map.put("projectName",projectName); 
					map.put("packageName",packageName); 
					map.put("moduleName",moduleName); 
					map.put("className",className);
					map.put("tableName",tableName); 
					map.put("fileSuffixName",fileSuffixName);
					String out = getOutpath(map);
					
					mdSourceFile.setXmlId(className);
					mdSourceFile.setIn(MessageFormat.format(in, new Object[]{count++ + ""}));
					mdSourceFile.setOut(out);
					mdSourceFile.setXmlContent(xmlContent);
					mdSourceFile.setStyle(appRealpath + templatePath + style);
					list.add(mdSourceFile);
			    }
			}

			String springStruts2Xml = transformSpinrgStruts2Xml(this.getMetaDatas());
			
			MDSourceFile springMDSourceFile = new MDSourceFile();
			springMDSourceFile.setXmlId("spring");
			springMDSourceFile.setIn(MessageFormat.format(in, new Object[]{count++ + ""}));
			springMDSourceFile.setOut(destDir + separator + "src" + separator + "spring" + separator + projectName + "-" + moduleName + ".xml");
			springMDSourceFile.setXmlContent(springStruts2Xml);
			springMDSourceFile.setStyle(appRealpath + templatePath + "spring.xsl");
			list.add(springMDSourceFile);
			
			MDSourceFile struts2MDSourceFile = new MDSourceFile();
			struts2MDSourceFile.setXmlId("struts2");
			struts2MDSourceFile.setIn(MessageFormat.format(in, new Object[]{count++ + ""}));
			struts2MDSourceFile.setOut(destDir + separator + "src" + separator + "struts" + separator + projectName + "-" + moduleName + ".xml");
			struts2MDSourceFile.setXmlContent(springStruts2Xml);
			struts2MDSourceFile.setStyle(appRealpath + templatePath + "struts2.xsl");
			list.add(struts2MDSourceFile);
			
			write(root,destDir,list);
			success = true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return "";
		}
		
		//返回打包后的代码路径
		String result = "";//failure
		if(success){
			if(this.isZip() && null != destDir){
				result = this.zip(destDir,this.constructZipPackName(projectName, zipDir));
			}
			else{
				result = "success";
			}
		}
		
		return result;
	}
	
	/**
	 * 生成代码
	 * @param root
	 * @param list
	 * @return
	 * @throws Exception 
	 */
	public boolean write(String root,String destDir,List<MDSourceFile> list) throws Exception{
		Project project = new Project();
		project.init();
		DefaultLogger logger = new DefaultLogger();
		project.addBuildListener(logger);
		logger.setOutputPrintStream(System.out);
		logger.setErrorPrintStream(System.err);
		logger.setMessageOutputLevel(Project.MSG_INFO);
		System.setOut(new PrintStream(new DemuxOutputStream(project, false)));
		System.setErr(new PrintStream(new DemuxOutputStream(project, true)));
		project.fireBuildStarted();
		project.setBaseDir(new File(root));
		
		XSLTProcess xslt = new XSLTProcess();
		xslt.setTaskName("xslt.code");
		xslt.setProject(project);
		xslt.init();
		
		File in = null;
		String lastXmlId = "";
		
		for(MDSourceFile mdSourceFile : list){
			String xmlId = mdSourceFile.getXmlId();
			if(!xmlId.equals(lastXmlId)){
				in = new File(mdSourceFile.getIn());
				if(!in.exists()){
					in.getParentFile().mkdirs();
				}
			    BufferedReader reader = new BufferedReader(new StringReader(mdSourceFile.getXmlContent().toString()));
			    PrintWriter writer = new PrintWriter(new BufferedWriter(new FileWriter(in)));
			    String text;
			    while((text = reader.readLine()) != null ){
			    	writer.println(text);
			    }
			    writer.close();
			}
			xslt.setStyle(mdSourceFile.getStyle());
			xslt.setIn(in);
			xslt.setOut(new File(mdSourceFile.getOut()));
			xslt.execute();
		}
		
		String temppath = EasycodeConfig.getProperty("generator.web.xml.temppath");
		Delete delete = new Delete();
		delete.setTaskName("delete.temppath");
		delete.setProject(project);
		delete.init();
		delete.setDir(new File(destDir + separator + temppath));
		delete.setIncludeEmptyDirs(true);
		delete.execute();
		
		project.fireBuildFinished(null);
		
		return true;
	}
	
	/**
	 * 转换为XML文件内容
	 * @param mdMetaData
	 * @param isSpringStruts2
	 * @return
	 */
	public String transformXml(MDMetaData mdMetaData,boolean isSpringStruts2){
		String projectName = mdMetaData.getProjectName();
		String packageName = mdMetaData.getPackageName();
		String moduleName = mdMetaData.getModuleName();
		Document document = null;
		try{
			document = DocumentHelper.createDocument();
			document.setXMLEncoding("GBK");
			Element metadata = document.addElement("metadata");
			
			Element projectNameEl = metadata.addElement("projectName");
			projectNameEl.addCDATA(projectName);
			
		    Element packageNameEl = metadata.addElement("packageName");
		    packageNameEl.addCDATA(packageName);
		    
			Element moduleNameEl = metadata.addElement("moduleName");
			moduleNameEl.addCDATA(moduleName);
			
			Element tablesEl = metadata.addElement("tables");
			
			for(MDTable mdTable : mdMetaData.getTables()){
				Element tableEl = tablesEl.addElement("table");
				
				Element classNameEl = tableEl.addElement("className");
				classNameEl.addCDATA(MROUtil.tableNameToClassName(mdTable.getTableName()));
				
				Element beanNameEl = tableEl.addElement("beanName");
				beanNameEl.addCDATA(MROUtil.tableNameToBeanName(mdTable.getTableName()));
			
				Element upperTableNameEl = tableEl.addElement("upperTableName");
				upperTableNameEl.addCDATA(mdTable.getTableName().toUpperCase());
				
				Element lowerTableNameEl = tableEl.addElement("lowerTableName");
				lowerTableNameEl.addCDATA(mdTable.getTableName().toLowerCase());
				
				Element primaryKeyEl = tableEl.addElement("primaryKey");
				primaryKeyEl.addElement("upperKey").addCDATA(MROUtil.tableNameToClassName(mdTable.getPrimaryKey()));
				primaryKeyEl.addElement("lowerKey").addCDATA(MROUtil.tableNameToBeanName(mdTable.getPrimaryKey()));
				primaryKeyEl.addElement("columnKey").addCDATA(mdTable.getPrimaryKey().toUpperCase());				
				
				if(!isSpringStruts2){
					//结果列表列数
					Element headCountEl = tableEl.addElement("headCount");
					int headCount = 0;
					
					Element columnsEl = tableEl.addElement("columns");
					for(MDColumn mdColumn : mdTable.getColumns()){
						Element columnEl = columnsEl.addElement("column");
						columnEl.addElement("javaTypeName").addCDATA(MROUtil.getTypeMapping(mdColumn.getTypeName()));
						columnEl.addElement("upperName").addCDATA(MROUtil.tableNameToClassName(mdColumn.getColumnName()));
						columnEl.addElement("lowerName").addCDATA(MROUtil.tableNameToBeanName(mdColumn.getColumnName()));
						columnEl.addElement("columnName").addCDATA(mdColumn.getColumnName());
						columnEl.addElement("typeName").addCDATA(mdColumn.getTypeName());
						columnEl.addElement("remarks").addCDATA(mdColumn.getRemarks());
						columnEl.addElement("isQuery").addCDATA(String.valueOf(mdColumn.isQuery()));
						columnEl.addElement("isHead").addCDATA(String.valueOf(mdColumn.isHead()));
						columnEl.addElement("requried").addCDATA(String.valueOf(mdColumn.isRequired()));
						columnEl.addElement("isInput").addCDATA(String.valueOf(mdColumn.isIuput()));
						columnEl.addElement("isPrimaryKey").addCDATA(String.valueOf(mdColumn.isPrimaryKey()));
						columnEl.addElement("inputType").addCDATA(mdColumn.getInputType());
						columnEl.addElement("format").addCDATA(mdColumn.getFormat());
						columnEl.addElement("columnDef").addCDATA(mdColumn.getColumnDef());
						columnEl.addElement("standardType").addCDATA(mdColumn.getStandardType());
						if(mdColumn.isHead()){
							headCount++;
						}
					}
					
					headCountEl.addCDATA(String.valueOf(headCount));
				}
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return document.asXML();
	}
	
	/**
	 * 转换为SPRING与STRUTS2文件所需的XML文件内容
	 * @param mdMetaData
	 * @return
	 */
	public String transformSpinrgStruts2Xml(MDMetaData mdMetaData){
		return transformXml(mdMetaData,true);
	}
	
	/**
	 * 转化为类、IBATIS、JSP、JS文件所学的XML文件内容
	 * @param projectName
	 * @param packageName
	 * @param moduleName
	 * @param mdTable
	 * @return
	 */
	public String transformClassIbatisJspJsXml(String projectName,String packageName,String moduleName,MDTable mdTable){
		MDMetaData mdMetaData = new MDMetaData();
		mdMetaData.setProjectName(projectName);
		mdMetaData.setPackageName(packageName);
		mdMetaData.setModuleName(moduleName);
		List<MDTable> tables = new ArrayList<MDTable>();
		tables.add(mdTable);
		mdMetaData.setTables(tables);
		return transformXml(mdMetaData,false);
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
		
		Generator generater = new CocoaGenerator(mdMetaData);
		generater.run();
	}
}
