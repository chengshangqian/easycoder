package org.ican.easycode.generator.fig;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ican.easycode.generator.common.generator.Generator;
import org.ican.easycode.generator.common.model.MDMetaData;
import org.ican.easycode.generator.common.model.MDTable;
import org.ican.easycode.generator.common.util.JSONUtil;
import org.ican.easycode.generator.common.util.MROUtil;

import freemarker.template.Configuration;

public class FigGenerator extends AbstractFigGenerator{
	
	public FigGenerator(){
		super();
	}
	
	public FigGenerator(Configuration configuration){
		super(configuration);
	}
	
	public FigGenerator(MDMetaData metaDatas){
		super(metaDatas);
	}
	
	public FigGenerator(MDMetaData metaDatas,Configuration configuration){
		super(metaDatas,configuration);
	}
	
	public String run() throws Exception {
		String result = "";
		MDMetaData metaDatas = this.getMetaDatas();
		if(null != metaDatas){
			
			String root = metaDatas.getProjectRoot();
			String projectName = metaDatas.getProjectName();
			String packageName = metaDatas.getPackageName();
			String moduleName = metaDatas.getModuleName();
			String dbName = metaDatas.getDbName();
			String zipDir = projectName + System.currentTimeMillis();
			String destDir = root + separator + projectName + separator + zipDir;
			Map<String,String> map = new HashMap<String,String>();
			
			boolean success = false;
			
			try{
				//action,ibatis,dao,service,to,js,jsp
				for(MDTable table : metaDatas.getTables()){
					MDMetaData metaData = new MDMetaData();
					metaData.setProjectName(projectName);
					metaData.setPackageName(packageName);
					metaData.setProjectRoot(root);
					metaData.setModuleName(moduleName);
					metaData.setDbName(dbName);
					
					List<MDTable> oneTable = new ArrayList<MDTable>();
					oneTable.add(table);
					metaData.setTables(oneTable);
					
					String className = MROUtil.tableNameToClassName(table.getTableName());
					String tableName = table.getTableName().toLowerCase();
					
				    for(int i = 0; i < templates.length; i++){
				    	String template = templates[i];
				    	//不生成TO
				    	if("to.ftl".equals(template)){
				    		continue;
				    	}
				    	String fileSuffixName = fileSuffixNames[i];
						map.put("destDir",destDir);
						map.put("projectName",projectName); 
						map.put("packageName",packageName); 
						map.put("moduleName",moduleName); 
						map.put("className",className);
						map.put("tableName",tableName); 
						map.put("fileSuffixName",fileSuffixName);
						String outputFile = this.getOutpath(map);
						this.output(metaData,template,outputFile);
				    }
				}
				
				//struts2
				String struts2OutputFileName = destDir + separator + "src" + separator + "struts" + separator + projectName + "-" + moduleName + ".xml";
				this.output(metaDatas, "struts2.ftl", struts2OutputFileName);
				//spring
				String springOutputFileName = destDir + separator + "src" + separator + "spring" + separator + projectName + "-" + moduleName + ".xml";
				this.output(metaDatas, "spring.ftl", springOutputFileName);
				
				success = true;
			}
			catch(Exception ex){
				ex.printStackTrace();
				return "";
			}
			
			if(success){
				if(this.isZip() && null != destDir){
					result = this.zip(destDir,this.constructZipPackName(projectName, zipDir));
				}
				else{
					result = "success";
				}
			}
			else{
				result = "";//failure
			}
		}
		
		return result;
	}

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		String json = "{"
			+ "'projectName':'nts',"
			+ "'packageName':'com.gzdec.nts',"
			+ "'projectRoot':'G:/codes/source',"
			+ "'moduleName':'counseling',"
			+ "'tables' : ["
			+ "{'primaryKey':'COUNSELING_ID','tableName':'NTS_COUNSELING','columns':[{'columnName':'COUNSELING_ID','remarks':'辅导编号'},{'columnName':'TITLE','remarks':'辅导标题'}]}"
			+ "]}";
		
		Configuration configuration = new Configuration();
		configuration.setClassForTemplateLoading(FigGenerator.class,"templates");
		MDMetaData metaDatas = JSONUtil.toMDMetaData(json);
		
		Generator generator = new FigGenerator(metaDatas,configuration);
		generator.run();
	}
	
}
