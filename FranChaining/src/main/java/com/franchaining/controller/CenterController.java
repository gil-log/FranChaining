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
import com.franchaining.vo.RegwaitVO;

@Controller
@RequestMapping(value = "/center/*")
public class CenterController {
	
	@Inject
	EmpService empService;
	@Inject
	ManagerService managerService;
	@Inject
	BranchService branchService;
	
	private static final Logger logger = LoggerFactory.getLogger(CenterController.class);
	
	@RequestMapping(value = "/hr/main", method = RequestMethod.GET)
	public String hr(Model model) throws Exception{
		logger.info("/hr/main");

		//본사 사원수
		int centerEmpCount = empService.EmpCount(0);
		int branchCount = branchService.BranchCount();
		int regwaitCount = managerService.MflagCount(0);
		
		//logger.info(Integer.toString(regwaitCount));
		
		
		model.addAttribute("centerEmpCount", centerEmpCount);
		model.addAttribute("branchCount", branchCount);
		model.addAttribute("regwaitCount", regwaitCount);
		
		
		return "/center/hr/hr_main";
	}
	
	@RequestMapping(value = "/hr/acception", method = RequestMethod.GET)
	public String hrAcceptionget(Model model) throws Exception {
		logger.info("hrAcceptionget");

		List<ManagerVO> regwaitlist = managerService.regwait();
		
		List<RegwaitVO> regwaitemplist = empService.regwait(regwaitlist);

		for(int i = 0; i < regwaitemplist.size(); i++) {
			logger.info(regwaitemplist.get(i).getE_name());
		}
		
		model.addAttribute("list", regwaitemplist);
		
		return "center/hr/hr_acception";
	}
	
	@RequestMapping(value = "/hr/acception", method = RequestMethod.POST)
	public String hrAcceptionpost(HttpServletRequest request, Model model) throws Exception {
		logger.info("hrAcceptionpost");
		
		logger.info(request.getParameter("m_flag"));
		logger.info(request.getParameter("e_no"));
		
		int e_no = Integer.parseInt(request.getParameter("e_no"));
		int m_flag = Integer.parseInt(request.getParameter("m_flag"));

		ManagerVO managerVO = new ManagerVO();
		
		managerVO.setE_no(e_no);
		managerVO.setM_flag(m_flag);
		
		managerService.regupdate(managerVO);
		
		if(m_flag==1) {
			model.addAttribute("msg", "승인 처리 되었습니다.");
			model.addAttribute("url", "/center/hr/acception");
		} else {
			model.addAttribute("msg", "거부 처리 되었습니다.");
			model.addAttribute("url", "/center/hr/acception");			
		}
		return "redirect";
	}
	
	@RequestMapping(value = "/stock/main", method = RequestMethod.GET)
	public String stock(){
		logger.info("/stock_main");

		return "/center/stock/stock_main";
	}
}
