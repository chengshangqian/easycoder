package org.ican.easycode.generator.common.generator;

import java.io.File;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.tools.ant.DefaultLogger;
import org.apache.tools.ant.DemuxOutputStream;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.FileSet;
import org.ican.easycode.common.config.EasycodeConfig;
import org.ican.easycode.generator.common.model.MDMetaData;

public abstract class AbstractGenerator implements Generator {
	
	private boolean zip;
	
	private MDMetaData metaDatas;
	
	public final static String separator = "/";
	
	protected final static Map<String,String> classFilePaths = new HashMap<String,String>();

	protected final static String[] fileSuffixNames = new String[]{
			"Action.java",
			"Dao.java",
			".xml",
			"RESTDao.java",
			"RESTService.java",
			"Service.java",
			"ServiceImpl.java",
			"RESTServiceImpl.java",
			"AppUtil.java",
			"To.java",
			"_index.jsp",
			"_index.js",
			"_input.js",
			"_input.jsp"
	};	

	static{
		classFilePaths.put("Action.java", "actions.");
		classFilePaths.put("Dao.java", "dao.");
		classFilePaths.put(".xml", "dao.");
		classFilePaths.put("RESTDao.java", "dao.");
		classFilePaths.put("RESTService.java", "service.inter.");
		classFilePaths.put("Service.java", "service.inter.");
		classFilePaths.put("ServiceImpl.java", "service.impl.");
		classFilePaths.put("RESTServiceImpl.java", "service.impl.");
		classFilePaths.put("AppUtil.java", "util.");
		classFilePaths.put("To.java", "to.");
		classFilePaths.put("_index.jsp", "jsp.");
		classFilePaths.put("_index.js", "js.");
		classFilePaths.put("_input.js", "js.");
		classFilePaths.put("_input.jsp", "jsp.");
	}
	
	public MDMetaData getMetaDatas() {
		return metaDatas;
	}

	public void setMetaDatas(MDMetaData metaDatas) {
		this.metaDatas = metaDatas;
	}
	
	public AbstractGenerator(){
		
	}
	
	public AbstractGenerator(MDMetaData metaDatas){
		this();
		this.metaDatas = metaDatas;
	}

	/**
	 * 包名转换为文件路径名
	 * @param packages
	 * @return
	 */
	public String toFilePath(String packages){
		return packages.replaceAll("\\.", separator);
	}	
	
	/**
	 * 输出路径
	 * @param map
	 * @return
	 */
	public String getOutpath(Map<String,String> map){
		String destDir = map.get("destDir");
		String projectName = map.get("projectName"); 
		String packageName = map.get("packageName"); 
		String moduleName = map.get("moduleName"); 
		String className = map.get("className");
		String tableName = map.get("tableName"); 
		String fileSuffixName = map.get("fileSuffixName");
		String out = "";
		if("AppUtil.java".equals(fileSuffixName)){
			out = destDir + separator + "src"+ separator + toFilePath(packageName + "." + classFilePaths.get(fileSuffixName)) + fileSuffixName;
		}
		else if(".xml".equals(fileSuffixName)){
			out = destDir + separator + "src"+ separator + toFilePath(packageName + "." + moduleName + "." + classFilePaths.get(fileSuffixName)) + tableName.toUpperCase() + fileSuffixName;
		}
		else if("_index.jsp".equals(fileSuffixName) || "_index.js".equals(fileSuffixName)
				|| "_input.js".equals(fileSuffixName) || "_input.jsp".equals(fileSuffixName)){
			out = destDir + separator + "web"+ separator + toFilePath(classFilePaths.get(fileSuffixName) + projectName + "." +moduleName + ".") + tableName.toLowerCase() +  fileSuffixName;
		}
		else{
			out = destDir + separator + "src"+ separator + toFilePath(packageName + "." + moduleName + "." + classFilePaths.get(fileSuffixName))  + className +  fileSuffixName;
		}
		return out;
	}

	public boolean isZip() {
		return zip;
	}

	public void setZip(boolean zip) {
		this.zip = zip;
	}
	
	/**
	 * 打包生成的代码
	 * @param sourceDir
	 * @param destZipFileName
	 * @return
	 */
	public String zip(String srcDir,String destZipFileName){
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
		File baseDir = new File(srcDir);
		project.setBaseDir(baseDir);
		
		Zip zip = new Zip();
		zip.setTaskName("zip.file");
		zip.setProject(project);
		zip.init();
		FileSet set = new FileSet();
		set.setDir(baseDir);
		zip.addFileset(set);
		File destFile = new File(destZipFileName);
		zip.setDestFile(destFile);
		zip.execute();
		
		project.fireBuildFinished(null);
		
		return destFile.getPath();
	}
	
	public String constructZipPackName(String projectName,String zipDir){
		String savepath = EasycodeConfig.getProperty("generator.web.zip.savepath");
		String destFileName = savepath + separator + projectName + separator + zipDir + ".zip";
		return destFileName;
	}
}
