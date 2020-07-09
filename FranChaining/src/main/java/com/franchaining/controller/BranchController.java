package com.franchaining.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.franchaining.service.BranchService;
import com.franchaining.service.EmpService;
import com.franchaining.service.ManagerService;
import com.franchaining.service.OrdersService;
import com.franchaining.service.StockService;
import com.franchaining.service.StockServiceImpl;
import com.franchaining.vo.EmpVO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.OrdersVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;
import com.franchaining.vo.WrapperVO;

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
	@Inject
	OrdersService ordersService;
	@Inject
	StockService stockService;
	
	private static final Logger logger = LoggerFactory.getLogger(BranchController.class);
	
	@RequestMapping(value = "/master/main", method = RequestMethod.GET)
	public String master_hr(){
		logger.info("/master/main");

		return "/branch/master/master_main";
	}
	
	@RequestMapping(value = "/manager/hr/main", method = RequestMethod.GET)
	public String manager_hr(){
		logger.info("/manager/hr/main");

		return "/branch/manager/hr/hr_main";
	}
	
	@RequestMapping(value = "/master/hr/administration", method = RequestMethod.GET)
	public String master_hrAdministration(Model model) throws Exception {
		logger.info("master_hraAministration");

		
		return "branch/master/hr/hr_administration";
	}
	
	@RequestMapping(value = "/master/hr/administration", method = RequestMethod.POST)
	public String master_hrAdministration() throws Exception {
		logger.info("master_hrAdministration");

        return "branch/master/hr/hr_administration";	
	}
	
	@RequestMapping(value = "/master/order", method = RequestMethod.GET)
	public String master_order(StockVO stockVO, Model model, HttpServletRequest request)throws Exception {
		logger.info("/master_order");
		
		HttpSession session = request.getSession();
		StockVO stockinfo = stockService.stockinfo(stockVO);
		session.setAttribute("stockinfo", stockinfo);

		return "/branch/master/master_order";
	}
	
	@RequestMapping(value = "/master/orderhistory", method = RequestMethod.GET)
	public String master_orederhistory(Model model) throws Exception{
		logger.info("/master_orderhistory");
		
		List<OrdersVO> orders_history = ordersService.orders_history();
		
		model.addAttribute("list", orders_history);

		return "/branch/master/master_orderhistory";
	}
	
	@RequestMapping(value = "/master/stock", method = RequestMethod.GET)
	public String master_stock(){
		logger.info("/master_stock");

		return "/branch/master/master_stock";
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
	   public String managerOrderget(Model model, HttpServletRequest request) throws Exception {
	      logger.info("mgrOdrget");
	      
	      List<StockVO> s_name_info = stockService.s_name_info();
	      
	      model.addAttribute("s_name_info", s_name_info);
	      for(int i = 0; i < s_name_info.size(); i++) {
				logger.info(s_name_info.get(i).getS_name());
			}
	      return "branch/manager/manager_order";
	   }
	   /*
	   @RequestMapping(value = "/manager/order", method = RequestMethod.POST)
		public String managerOrderget(HttpServletRequest request, Model model) throws Exception {
			logger.info("mgrOdrpost");
			HttpSession session = request.getSession();
		    List<StockVO> s_name_info = stockService.s_name_info();
		    String s_name = request.getParameter("s_name");
		    StockVO stockVO = new StockVO();
		    stockVO.setS_name(s_name);
	     	logger.info(s_name);
	     	StockVO stockinfo = stockService.stockinfo(stockVO);
	     	session.setAttribute("stockinfo", stockinfo);
	     	model.addAttribute("s_name_info", s_name_info);
		    for(int i = 0; i < s_name_info.size(); i++) {
		    		logger.info(s_name_info.get(i).getS_name());
				}
	        return "branch/manager/manager_order";	
		}
	   */
	   /*
	    * 
	    * 
	   @RequestMapping(value = "/manager/getstockinfo", method = RequestMethod.POST) 
	   public StockVO getStockInfo(String s_name) throws Exception {
		      logger.info("nnnnnnnnn");

		   StockVO stockVO = new StockVO();
		   stockVO.setS_name(s_name);
		   StockVO stockinfo = stockService.stockinfo(stockVO);
		   
		   return stockinfo;
	   }
	   */
	   
	   @RequestMapping(value = "/manager/getstockinfo", method = RequestMethod.POST)
	   
		public @ResponseBody Object getStockInfo(HttpServletRequest request) throws Exception {
		      logger.info("logloglog");

		      String s_name = request.getParameter("s_name");
		      
		      logger.info(s_name);
		      //List<StockVO> s_name_info = stockService.s_name_info();
		      StockVO stockVO = new StockVO();
			  stockVO.setS_name(s_name);
			  StockVO stockinfo = stockService.stockinfo(stockVO);
			  //JSONArray jsonArray = JSONArray(s_name_info);
			  
		      return stockinfo;
		}
	   
	   @RequestMapping(value = "/manager/orderlist", method = RequestMethod.GET)
	   public String managerOrderListget(Model model) throws Exception {
	      logger.info("mgrOLget");

	      return "branch/manager/manager_orderlist";
	   }
}
