package com.cs.bs.study.service;

import java.util.List;
import java.util.Map;

public interface UserService {

	public List<Map<String, Object>> selectUserList(Map<String, Object> commandMap) throws Exception;
	
}
