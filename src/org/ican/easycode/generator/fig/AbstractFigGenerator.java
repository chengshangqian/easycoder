package org.ican.easycode.generator.fig;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import org.ican.easycode.generator.common.generator.AbstractGenerator;
import org.ican.easycode.generator.common.model.MDMetaData;
import org.ican.easycode.generator.common.util.Constants;

import freemarker.ext.beans.BeansWrapper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;

public abstract class AbstractFigGenerator extends AbstractGenerator {
	
	protected final static String[] templates = new String[]{
			"action.ftl"
		    ,"dao.ftl"
		    ,"ibatis.ftl"
		    ,"RESTdao.ftl"
		    ,"RESTService.ftl"
			,"service.ftl"
			,"serviceimpl.ftl"
			,"RESTServiceimpl.ftl"
			,"appUtil.ftl"
			,"to.ftl"			
			,"index.ftl"
			,"indexjs.ftl"
			,"inputjs.ftl"
			,"input.ftl"
	};
	
	private static final Map<String,String> DEFAULT_UTILS;
	
	static{
		DEFAULT_UTILS = new HashMap<String,String>();
		DEFAULT_UTILS.put("MROUtil", "org.ican.easycode.generator.common.util.MROUtil");
		DEFAULT_UTILS.put("StringUtils", "org.apache.commons.lang.StringUtils");
	}
	
	private static final String METADATA_NAME = "metadata";
	
	private final BeansWrapper wrapper;
	
	private final TemplateHashModel staticModels;

	private Map<String,String> utils;
	
	private Configuration configuration;
	
	public Map<String, String> getUtils() {
		return utils;
	}

	public void setUtils(Map<String, String> utils) {
		this.utils = utils;
	}
	
	public Configuration getConfiguration() {
		return configuration;
	}

	public void setConfiguration(Configuration configuration) {
		this.configuration = configuration;
	}

	public AbstractFigGenerator(){
		super();
		wrapper = BeansWrapper.getDefaultInstance();
		staticModels = wrapper.getStaticModels();
	}
	
	public AbstractFigGenerator(MDMetaData metaDatas){
		super(metaDatas);
		wrapper = BeansWrapper.getDefaultInstance();
		staticModels = wrapper.getStaticModels();
	}
	
	public AbstractFigGenerator(Configuration configuration){
		this();
		this.configuration = configuration;
	}
	
	public AbstractFigGenerator(MDMetaData metaDatas,Configuration configuration){
		this(metaDatas);
		this.configuration = configuration;
	}
	
	public void output(MDMetaData actionMetadata,String templateName,String outputFileName) throws Exception{
		Template template = this.getConfiguration().getTemplate(templateName);
		File outputFile = new File(outputFileName);
		if(!outputFile.getParentFile().exists()){
			outputFile.getParentFile().mkdirs();
		}
		Writer writer = new OutputStreamWriter(new FileOutputStream(outputFile),Constants.ENCODING);
		process(actionMetadata, template, writer);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void process(MDMetaData metadata,Template template,Writer writer) throws Exception{
		Map root = new HashMap();
		root.put(METADATA_NAME, metadata);
		internalUtils(root);
		template.setEncoding(Constants.ENCODING);
		template.process(root, writer);
	}	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void internalUtils(Map root) throws Exception{
		if(null == this.utils){
			this.utils = new HashMap<String,String>();
		}
		this.utils.putAll(DEFAULT_UTILS);
		for(Map.Entry<String, String> entry : utils.entrySet()){
			String key = entry.getKey();
			String value = entry.getValue();
			TemplateModel templateModel = (TemplateModel)staticModels.get(value);
			root.put(key, templateModel);
		}
	}
}
