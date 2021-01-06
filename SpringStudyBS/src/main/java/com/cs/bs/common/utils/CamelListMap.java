package com.cs.bs.common.utils;

import org.apache.commons.collections4.map.ListOrderedMap;

public class CamelListMap extends ListOrderedMap{

	private String toProperCase(String s, boolean isCapital) {
		String rtnVal = "";
		
		if (isCapital) {
			rtnVal = s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
		} else {
			rtnVal = s.toLowerCase();
		}
		return rtnVal;
	}
	
	private String toCamelCase(String s) {
		String[] parts = s.split("_");
		StringBuilder camelCaseString = new StringBuilder();
		
		for (int i = 0; i < parts.length; i++) {
			String part = parts[i];
			camelCaseString.append(toProperCase(part, (i != 0 ? true : false)));
		}
		
		return camelCaseString.toString();
	}
	
	@Override
	public Object put(Object key, Object value) {
		return super.put(toCamelCase((String)key), value.toString());
	}
}
