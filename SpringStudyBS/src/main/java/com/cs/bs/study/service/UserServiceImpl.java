package com.cs.bs.study.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cs.bs.study.dao.UserDAO;

@Service("userService")
public class UserServiceImpl implements UserService {

	Logger log = LoggerFactory.getLogger(this.getClass());
	@Resource(name = "userDAO")
	private UserDAO userDAO;

	@Override
	public List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception {
		return userDAO.selectUserList(map);
	}

}
