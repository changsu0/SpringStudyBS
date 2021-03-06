package com.cs.bs.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cs.bs.common.dao.AbstractDAO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO {

	public List<Map<String, Object>> selectUserList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("user.selectUserList", map);
	}

	public int insertUser(Map<String, Object> map) {
		return (int) insert("user.insertUser", map);
	}

	public int updateUser(Map<String, Object> map) {
		return (int) update("user.updateUser", map);
	}

	public int deleteUser(String empNo) {
		return (int) delete("user.deleteUser", empNo);
	}

	public Map<String, Object> selectUser(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("user.selectUser", map);
	}

}
