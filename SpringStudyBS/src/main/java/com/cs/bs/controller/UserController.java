package com.cs.bs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cs.bs.common.common.CommandMap;
import com.cs.bs.service.UserService;

@Controller
public class UserController {
	Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping(value = "/user/userMgmtList.go")
	public ModelAndView userMgmtList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/user/userMgmtList");
		List<Map<String, Object>> list = userService.selectUserList(commandMap);
		mv.addObject("list", list);
		
		
		for (Map<String, Object> map : list) {
			System.out.println(map);
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/user/userMgmtWrite.go")
	public ModelAndView userMgmtWrite(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/user/userMgmtWrite");
		return mv;
	}
	
	@RequestMapping(value = "/user/userMgmtDetail.go")
	public ModelAndView userMgmtDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/user/userMgmtDetail");
		mv.addObject("user", userService.selectUser(commandMap.getMap()));
		return mv;
	}
	
	@RequestMapping(value = "/user/userMgmtSave.go")
	public ModelAndView userMgmtSave(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/user/userMgmtList.go");
		
		Map<String, Object> user = userService.selectUser(commandMap.getMap());
		
		if (user == null) {
			int rstCnt = userService.insertUser(commandMap.getMap());
			return mv;
		} else {
			mv = new ModelAndView("/user/userMgmtWrite");
			Map<String, Object> errMap = commandMap.getMap();
			errMap.put("msg", "동일한 사번이 존재합니다.");
			mv.addObject("err", errMap );
			return mv;
		}
	}
	
	@RequestMapping(value = "/user/userMgmtUpdate.go")
	public ModelAndView userMgmtUpdate(CommandMap commandMap) throws Exception {
		int rstCnt = userService.updateUser(commandMap.getMap());
		ModelAndView mv = new ModelAndView("redirect:/user/userMgmtList.go");
		return mv;
	}
	
	@RequestMapping(value = "/user/userMgmtDelete.go")
	public ModelAndView userMgmtDelete(HttpServletRequest request) throws Exception {
		String[] arrEmpNo = request.getParameterValues("empNo");
		String[] arrChk = request.getParameterValues("hidchk");
		
		int idx = 0;
		for (String empNo : arrEmpNo) {
			if ("Y".equals( arrChk[idx] )) {
				int rstCnt = userService.deleteUser( empNo );
			}
			idx++;
		}
		
		ModelAndView mv = new ModelAndView("redirect:/user/userMgmtList.go");
		return mv;
	}

}
