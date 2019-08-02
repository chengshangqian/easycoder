package org.ican.easycode.generator.common.util;

import java.util.Comparator;

import org.ican.easycode.generator.common.model.MDTable;

public class MDTableComparator implements Comparator<MDTable> {
	public int compare(MDTable one, MDTable two) {
		String oneTableName = one.getTableName();
		String twoTableName = two.getTableName();
		if(oneTableName == null){
			oneTableName = "";
		} 
		if(twoTableName == null){
			twoTableName = "";
		} 
		
		return oneTableName.hashCode() - twoTableName.hashCode();
	}

}
