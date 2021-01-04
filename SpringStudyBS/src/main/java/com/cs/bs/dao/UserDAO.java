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

}
