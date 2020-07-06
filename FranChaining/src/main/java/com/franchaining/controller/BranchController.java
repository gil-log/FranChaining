package com.franchaining.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
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
import com.franchaining.vo.EmpVO;
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
	
	@RequestMapping(value = "/master/hr/main", method = RequestMethod.GET)
	public String master_hr(){
		logger.info("/master/hr/main");

		return "/branch/master/hr/hr_main";
	}
	
	@RequestMapping(value = "/manager/hr/main", method = RequestMethod.GET)
	public String manager_hr(){
		logger.info("/manager/hr/main");

		return "/branch/manager/hr/hr_main";
	}
	
	@RequestMapping(value = "/master/hr/administration", method = RequestMethod.GET)
	public String master_hrAdministration(Model model) throws Exception {
		logger.info("master_hraAministration");

		List<ManagerVO> regwaitlist = managerService.regwait();
		
		/*
		List<EmpVO> regwaitemplist = empService.regwait(regwaitlist);

		for(int i = 0; i < regwaitemplist.size(); i++) {
			logger.info(regwaitemplist.get(i).getE_name());
		}
		
		model.addAttribute("regwait", regwaitemplist);
		*/
		return "branch/master/hr/hr_administration";
	}
	
	@RequestMapping(value = "/master/hr/administration", method = RequestMethod.POST)
	public String master_hrAdministration() throws Exception {
		logger.info("master_hrAdministration");

        return "branch/master/hr/hr_administration";	
	}
	
	@RequestMapping(value = "/manager/main", method = RequestMethod.GET)
	   public String manger(){
	      logger.info("/manager/main");

	      return "/branch/manager/manager_main";
	   }
	   
	   @RequestMapping(value = "/manager/stock", method = RequestMethod.GET)
	   public String managerStockget(Model model) throws Exception {
	      logger.info("mgrStkget");

	      return "branch/manager/manager_stock";
	   }
	   
	   @RequestMapping(value = "/manager/order", method = RequestMethod.GET)
	   public String managerOrderget(Model model) throws Exception {
	      logger.info("mgrOdrget");

	      return "branch/manager/manager_order";
	   }
	   
	   @RequestMapping(value = "/manager/orderlist", method = RequestMethod.GET)
	   public String managerOrderListget(Model model) throws Exception {
	      logger.info("mgrOLget");

	      return "branch/manager/manager_orderlist";
	   }
	
}
