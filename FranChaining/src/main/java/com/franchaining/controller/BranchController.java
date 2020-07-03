package com.franchaining.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.franchaining.service.BranchService;
import com.franchaining.service.EmpService;
import com.franchaining.service.ManagerService;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/branch/*")
public class BranchController {
	
	@Inject
	EmpService empService;
	@Inject
	ManagerService managerService;
	@Inject
	BranchService branchService;
	
	private static final Logger logger = LoggerFactory.getLogger(BranchController.class);
	
}
