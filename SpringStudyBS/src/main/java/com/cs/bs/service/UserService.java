package com.cs.bs.service;

import java.util.List;
import java.util.Map;

public interface UserService {

	public List<Map<String, Object>> selectUserList(Map<String, Object> commandMap) throws Exception;

	public int insertUser(Map<String, Object> commandMap);

	public Map<String, Object> selectUser(Map<String, Object> commandMap);

	public int updateUser(Map<String, Object> commandMap);
	
	public int deleteUser(String empNo);
	
}
