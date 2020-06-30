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

import com.franchaining.service.EmpService;
import com.franchaining.service.ManagerService;
import com.franchaining.vo.EmpVO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;

@Controller
@RequestMapping(value = "/center/*")
public class CenterController {
	
	@Inject
	EmpService empService;
	@Inject
	ManagerService managerService;
	
	private static final Logger logger = LoggerFactory.getLogger(CenterController.class);
	
	@RequestMapping(value = "/hr/main", method = RequestMethod.GET)
	public String hr(){
		logger.info("/hr/main");

		return "/center/hr/hr_main";
	}
	
	@RequestMapping(value = "/hr/acception", method = RequestMethod.GET)
	public String hrAcceptionget(Model model) throws Exception {
		logger.info("hrAcceptionget");

		List<ManagerVO> regwaitlist = managerService.regwait();
		
		List<EmpVO> regwaitemplist = empService.regwait(regwaitlist);

		for(int i = 0; i < regwaitemplist.size(); i++) {
			logger.info(regwaitemplist.get(i).getE_name());
		}
		
		model.addAttribute("regwait", regwaitemplist);
		
		return "center/hr/hr_acception";
	}
	
	@RequestMapping(value = "/hr/acception", method = RequestMethod.POST)
	public String hrAcceptionpost() throws Exception {
		logger.info("hrAcceptionpost");

        return "center/hr/hr_acception";	
	}
	
	@RequestMapping(value = "/stock/main", method = RequestMethod.GET)
	public String stock(){
		logger.info("/stock_main");

		return "/center/stock/stock_main";
	}
}
