package com.franchaining.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/franchaining", method = RequestMethod.GET)
	public String home(){
		logger.info("franchaining");

		return "franchain";
	}
	
	@RequestMapping(value = "/franchaining/main", method = RequestMethod.GET)
	public String main(){
		logger.info("main");

		return "main";
	}
	
}
