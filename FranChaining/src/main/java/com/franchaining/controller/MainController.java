package com.franchaining.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/franchaining", method = RequestMethod.GET)
	public String franchainingget(){
		logger.info("franchainingget");
		return "franchain";
	}
	
	
	
	@RequestMapping(value = "/franchaining", method = RequestMethod.POST)
	public String franchainingpost(){
		logger.info("franchaining");

		return "franchain";
	}
	
	@RequestMapping(value = "/franchaining/main", method = RequestMethod.GET)
	public String main(){
		logger.info("main");

		return "main";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String ttt(){
		logger.info("franchaining");

		return "user/login";
	}
	
}
