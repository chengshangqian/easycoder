package org.ican.easycode.generator.common.generator;

import org.ican.easycode.generator.common.model.MDMetaData;

public interface Generator {
	public boolean isZip();
	public void setZip(boolean zip);
	
	public void setMetaDatas(MDMetaData metaDatas);
	public MDMetaData getMetaDatas();
	
	public String run() throws Exception;
}
