package com.cs.bs.study.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cs.bs.study.service.UserService;

@Controller
public class UserController {
	Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping(value = "/user/userMgmtList.do")
	public ModelAndView userMgmtList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/user/userMgmtList");
		List<Map<String, Object>> list = userService.selectUserList(commandMap);
		mv.addObject("list", list);
		return mv;
	}

}
