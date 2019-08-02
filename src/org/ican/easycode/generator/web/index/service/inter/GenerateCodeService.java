package org.ican.easycode.generator.web.index.service.inter;

import java.util.Map;

import org.ican.easycode.generator.common.model.MDMetaData;

/**
 * 代码生成接口
 * @author Vin
 */
public interface GenerateCodeService {
	/**
	 * 查询元素据
	 * @param valueMap
	 * @return
	 */
	public MDMetaData loadMDMetaData(Map<String,String> valueMap);
	
	/**
	 * 生成代码
	 * @param valueMap
	 * @return
	 */
	public String generate(Map<String,String> valueMap);
}
