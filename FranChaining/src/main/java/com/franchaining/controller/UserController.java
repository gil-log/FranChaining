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

import com.franchaining.service.EmpService;
import com.franchaining.service.ManagerService;
import com.franchaining.vo.ManagerVO;
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
	public String loginget(String type, RedirectAttributes rttr, HttpServletRequest request) {
		logger.info("loginget");
		logger.info(type);
		
		HttpSession session = request.getSession();
	
		if (!(type == null)) {
			session.setAttribute("type", type);
		}

		return "user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginpost(ManagerVO managerVO, HttpServletRequest request, RedirectAttributes rttr, HttpServletResponse response) throws Exception {
		logger.info("loginpost");

		logger.info(managerVO.getId());
		logger.info(managerVO.getPwd());

		HttpSession session = request.getSession();
		
		ManagerVO userchk = managerService.login(managerVO);
		
		String url = "../franchaining/main";
		
		
		if(userchk == null) {
			
			session.setAttribute("user", null);
			
			rttr.addFlashAttribute("msg", false);
			
			response.sendRedirect("login");
			
		} else {
			session.setAttribute("user", userchk);
			
			response.sendRedirect(url);
		}
		
	}
	
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public void register(RegVO regVO, HttpServletResponse response) throws Exception {
		logger.info("registerpost");

		logger.info(regVO.getE_name());
		
		empService.register(regVO);
		managerService.register(regVO);
		
		String url = "login";
		
		response.sendRedirect(url);
		
	}
	

	@RequestMapping(value = "/regcenter", method = RequestMethod.GET)
	public String regcenterget(HttpServletRequest request) throws Exception {
		logger.info("regcenterget");
		
		HttpSession session = request.getSession();
		
		logger.info((String)session.getAttribute("type"));
		
		return "center/regcenter";
	}
	
	@RequestMapping(value = "/regcenter", method = RequestMethod.POST)
	public void regcenterpost(RegVO regVO, HttpServletResponse response) throws Exception {
		logger.info("regcenterpost");

		logger.info(regVO.getE_name());
		
		empService.register(regVO);
		managerService.register(regVO);
		
		String url = "../franchaining";
		
		response.sendRedirect(url);

	}
	
	@RequestMapping(value = "/regbranch", method = RequestMethod.GET)
	public String regbranchget() throws Exception {
		logger.info("regbranchget");

		return "branch/regbranch";
	}
	
	@RequestMapping(value = "/regbranch", method = RequestMethod.POST)
	public String regbranchpost() throws Exception {
		logger.info("regbranchpost");

		return "branch/regbranch";
	}
}
