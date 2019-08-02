package org.ican.easycode.generator.cocoa;

import org.ican.easycode.generator.common.generator.AbstractGenerator;
import org.ican.easycode.generator.common.model.MDMetaData;

public abstract class AbstractCocoaGenerator extends AbstractGenerator {
	
	private static final String DEFAULT_TEMPLATE_PATH = "/org/ican/easycode/generator/cocoa/templates/";
	protected static final String metadataXml = "metadata{0}.xml";

	protected static String[] styles = new String[]{
			"action.xsl",
			"dao.xsl",
			"ibatis.xsl",
			"RESTdao.xsl",
			"RESTService.xsl",
			"service.xsl",
			"serviceimpl.xsl",
			"RESTServiceimpl.xsl",
			"appUtil.xsl",
			"to.xsl",
			"index.xsl",
			"indexjs.xsl",
			"inputjs.xsl",
			"input.xsl"
	};
	
	/**
	 * sub class over writen
	 * @return
	 */
	public String getTemplatePath(){
		return DEFAULT_TEMPLATE_PATH;
	}
	
	public AbstractCocoaGenerator(){
		super();
	}
	
	public AbstractCocoaGenerator(MDMetaData metaDatas){
		super(metaDatas);
	}
}
