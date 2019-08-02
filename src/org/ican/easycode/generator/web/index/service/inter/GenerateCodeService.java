package org.ican.easycode.generator.web.index.service.inter;

import java.util.Map;

import org.ican.easycode.generator.common.model.MDMetaData;

/**
 * �������ɽӿ�
 * @author Vin
 */
public interface GenerateCodeService {
	/**
	 * ��ѯԪ�ؾ�
	 * @param valueMap
	 * @return
	 */
	public MDMetaData loadMDMetaData(Map<String,String> valueMap);
	
	/**
	 * ���ɴ���
	 * @param valueMap
	 * @return
	 */
	public String generate(Map<String,String> valueMap);
}
