package com.franchaining.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.franchaining.service.EmpService;
import com.franchaining.service.ManagerService;
import com.franchaining.vo.RegVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/user/*")
public class UserController {
	
	@Inject
	EmpService empService;
	@Inject
	ManagerService managerService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginget() {
		logger.info("loginget");

		return "user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginpost() {
		logger.info("loginpost");

		return "user/login";
	}
	
	
	
	
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(RegVO regVO) throws Exception {
		logger.info("registerpost");

		logger.info(regVO.getE_name());
		
		empService.register(regVO);
		managerService.register(regVO);
		
		
		return "login";
	}
	
	
	
	
	
	@RequestMapping(value = "/regcenter", method = RequestMethod.GET)
	public String regcenterget() {
		logger.info("regcenterget");

		return "user/regcenter";
	}
	
	@RequestMapping(value = "/regcenter", method = RequestMethod.POST)
	public String regcenterpost() {
		logger.info("regcenterpost");

		return "user/regcenter";
	}
	
	@RequestMapping(value = "/regbranch", method = RequestMethod.GET)
	public String regbranchget() {
		logger.info("regbranchget");

		return "user/regbranch";
	}
	
	@RequestMapping(value = "/regbranch", method = RequestMethod.POST)
	public String regbranchpost() {
		logger.info("regbranchpost");

		return "user/regbranch";
	}
}
