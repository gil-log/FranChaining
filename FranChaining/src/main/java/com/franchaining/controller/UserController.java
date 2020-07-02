package com.franchaining.controller;

import java.io.IOException;
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
import com.franchaining.vo.EmpVO;
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
	@Inject
	BranchService branchService;	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/logincenter", method = RequestMethod.GET)
	public String logincenterget(String type, RedirectAttributes rttr, HttpServletRequest request) {
		logger.info("logincenterget");
		logger.info(type);
		
		HttpSession session = request.getSession();
	
		if (!(type == null)) {
			session.setAttribute("type", type);
		}

		return "center/logincenter";
	}
	@RequestMapping(value = "/loginbranch", method = RequestMethod.GET)
	public String loginbranchget(String type, RedirectAttributes rttr, HttpServletRequest request) {
		logger.info("loginbranchget");
		logger.info(type);
		
		HttpSession session = request.getSession();
	
		if (!(type == null)) {
			session.setAttribute("type", type);
		}

		return "branch/loginbranch";
	}
	
	
	@RequestMapping(value = "/logincenter", method = RequestMethod.POST)
	public String logincenterpost(ManagerVO managerVO, Model model, HttpServletRequest request) throws Exception {
		logger.info("logincenterpost");

		logger.info(managerVO.getId());
		logger.info(managerVO.getPwd());

		HttpSession session = request.getSession();

		
		
		ManagerVO userchk = managerService.login(managerVO);
		
		if(userchk == null) {
    		//로그인 실패
			session.setAttribute("user", null);
            model.addAttribute("msg","로그인 정보를 확인 해주세요!");
            model.addAttribute("url","/user/logincenter");

    		
    	}else {
    		
    		if(userchk.getM_flag()==0) {
    			//로그인 실패(가입 대기 상태인 아이디라서)
    			session.setAttribute("user", null);
                model.addAttribute("msg","가입 승인이 나지 않은 아이디 입니다.");
                model.addAttribute("url","/user/logincenter");
    			
    		} else {
    			
        		EmpVO bnochk = empService.userinfo(userchk.getE_no());
        		logger.info(Integer.toString(bnochk.getB_no()));
        		
        		if(bnochk.getB_no()==0) {
        			if(bnochk.getP_no()==3) {
        				session.setAttribute("user", userchk);
        				model.addAttribute("msg","로그인 성공!");
                        model.addAttribute("url","/center/hr/main");
        			}
        			else if(bnochk.getP_no()==4) {
        				session.setAttribute("user", userchk);
        				model.addAttribute("msg","로그인 성공!");
                        model.addAttribute("url","/center/stock/main");
        			}
        			else {
        				session.setAttribute("user", userchk);
        				model.addAttribute("msg","올바르지 않은 부서 번호 입니다.");
                        model.addAttribute("url","/user/logincenter");
        			}
        		}
        		else {
        			logger.info(Integer.toString(bnochk.getB_no()));
        			model.addAttribute("msg","지점 항목에서 로그인을 해주세요!");
                    model.addAttribute("url","/franchaining");
        		}
    		}

    	}    	
    	return "redirect";	
	}
	
	@RequestMapping(value = "/loginbranch", method = RequestMethod.POST)
	public String loginbranchpost(ManagerVO managerVO, Model model, HttpServletRequest request) throws Exception {
		logger.info("loginbranchpost");

		logger.info(managerVO.getId());
		logger.info(managerVO.getPwd());

		HttpSession session = request.getSession();
		
		ManagerVO userchk = managerService.login(managerVO);
		
    	if(userchk == null) {
    		//로그인 실패
			session.setAttribute("user", null);
            model.addAttribute("msg","로그인 정보를 확인 해주세요!");
            model.addAttribute("url","/user/loginbranch");

    		
    	}else {
    		EmpVO bnochk = empService.userinfo(userchk.getE_no());
    		logger.info(Integer.toString(bnochk.getB_no()));
    		if(bnochk.getB_no()==0) {
    			logger.info(Integer.toString(bnochk.getB_no()));
    			model.addAttribute("msg","본사로 로그인을 해주세요!");
                model.addAttribute("url","/franchaining");
			
    		}
    		
    		else {
    			if(bnochk.getP_no()==1) {
    				session.setAttribute("user", userchk);
        			
                    //로그인 성공
                    model.addAttribute("msg","로그인 성공!");
                    model.addAttribute("url","/master_main");
    			}
    			else {
    			
    			session.setAttribute("user", userchk);
    			
                //로그인 성공
                model.addAttribute("msg","로그인 성공!");
                model.addAttribute("url","/manager_main");
    			}
    		}
            
			
    	}    	
    	return "redirect";	
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logoutget(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("logoutget");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		String url = "../franchaining";
		response.sendRedirect(url);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(RegVO regVO, Model model, HttpServletResponse response) throws Exception {
		logger.info("registerpost");

		logger.info(regVO.getE_name());

		ManagerVO managerVO = new ManagerVO();
		managerVO.setId(regVO.getId());

		ManagerVO regchkVO = managerService.regchk(managerVO);

		if (regchkVO == null) {

			empService.register(regVO);
			managerService.register(regVO);

			return "login";

		} else {

			model.addAttribute("msg", "회원가입 실패!");
			model.addAttribute("url", "/user/regcenter");

			return "redirect";
		}

	}
	

	@RequestMapping(value = "/regcenter", method = RequestMethod.GET)
	public String regcenterget(HttpServletRequest request) throws Exception {
		logger.info("regcenterget");
		
		HttpSession session = request.getSession();
		logger.info((String)session.getAttribute("type"));
		
		return "center/regcenter";
	}
	
	@RequestMapping(value = "/regcenter", method = RequestMethod.POST)
	public String regcenterpost(RegVO regVO, Model model, HttpServletResponse response) throws Exception {
		logger.info("regcenterpost");
		
		logger.info(regVO.getE_name());
		

		ManagerVO managerVO = new ManagerVO();
		managerVO.setId(regVO.getId());

		ManagerVO regchkVO = managerService.regchk(managerVO);

		if (regchkVO == null) {

			empService.register(regVO);
			managerService.register(regVO);

			return "center/logincenter";

		} else {

			model.addAttribute("msg", "회원가입 실패!");
			model.addAttribute("url", "/user/regcenter");

			return "redirect";
		}

	}
	
	@RequestMapping(value = "/regbranch", method = RequestMethod.GET)
	public String regbranchget(HttpServletRequest request) throws Exception {
		logger.info("regbranchget");
		HttpSession session = request.getSession();
		logger.info((String)session.getAttribute("type"));

		return "branch/regbranch";
	}
	
	@RequestMapping(value = "/regbranch", method = RequestMethod.POST)
	public String regbranchpost(RegVO regVO, Model model) throws Exception {
		logger.info("regbranchpost");

        	RegVO branchchk = branchService.b_no_check(regVO);
        	
        	if(branchchk == null) {
        		//로그인 실패
                model.addAttribute("msg","지점번호를 확인 해주세요!");
                model.addAttribute("url","/user/regbranch");

        		
        	} else {
        		empService.register(regVO);
    			managerService.register(regVO);
    			
                //로그인 성공
                model.addAttribute("msg","회원가입 성공!");
                model.addAttribute("url","/user/login");

        	}
            
        return "redirect";	
	}
	
}
