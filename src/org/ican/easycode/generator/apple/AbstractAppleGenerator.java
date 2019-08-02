package org.ican.easycode.generator.apple;

import org.apache.velocity.app.Velocity;
import org.ican.easycode.generator.common.generator.AbstractGenerator;
import org.ican.easycode.generator.common.model.MDMetaData;

public abstract class AbstractAppleGenerator extends AbstractGenerator {
	
	private static final String DEFAULT_TEMPLATE_PATH = "src/org/ican/easycode/generator/apple/templates/";
	
	static {
        try
        {
        	Velocity.setProperty(Velocity.FILE_RESOURCE_LOADER_PATH, DEFAULT_TEMPLATE_PATH);
            Velocity.init();
        }
        catch(Exception e)
        {
            System.out.println("Problem initializing Velocity : " + e );
        }
	}	
	
	protected static String[] templates = new String[]{
		"action.vm",
		"dao.vm",
		"ibatis.vm",
		"RESTdao.vm",
		"RESTService.vm",
		"service.vm",
		"serviceimpl.vm",
		"RESTServiceimpl.vm",
		"appUtil.vm",
		"to.vm",
		"index.vm",
		"indexjs.vm",
		"inputjs.vm",
		"input.vm"
   };

/**
 * sub class over writen
 * @return
 */
public String getTemplatePath(){
	return DEFAULT_TEMPLATE_PATH;
}

public AbstractAppleGenerator(){
	super();
}

public AbstractAppleGenerator(MDMetaData metaDatas){
	super(metaDatas);
}
}
