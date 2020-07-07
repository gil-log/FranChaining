package com.franchaining.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.franchaining.service.BranchService;
import com.franchaining.service.EmpService;
import com.franchaining.service.ManagerService;
import com.franchaining.service.StockService;
import com.franchaining.vo.EmpVO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.RegwaitVO;
import com.franchaining.vo.StockVO;
import com.franchaining.vo.WrapperVO;

@Controller
@RequestMapping(value = "/center/*")
public class CenterController {
	
	@Inject
	EmpService empService;
	@Inject
	ManagerService managerService;
	@Inject
	BranchService branchService;
	@Inject
	StockService stockService;
	
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
		if(regwaitlist.isEmpty()) {
			logger.info("emptywaitlist");
			model.addAttribute("isNull", 1);
			
			return "center/hr/hr_acception";
			
		}
		
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
	public String stockmain(){
		logger.info("stock_main");

		return "/center/stock/stock_main";
	}
	
	@RequestMapping(value = "/stock/order", method = RequestMethod.GET)
	public String stockorder(){
		logger.info("/stock_order");

		return "/center/stock/stock_order";
	}

	@RequestMapping(value = "/stock/orderhistory", method = RequestMethod.GET)
	public String stockorderhistory(){
		logger.info("/stock_orderhistory");

		return "/center/stock/stock_orderhistory";
	}

	@RequestMapping(value = "/stock/orderpage", method = RequestMethod.GET)
	public String stockorderpage(){
		logger.info("/stock_orderpage");

		return "/center/stock/stock_orderpage";
	}

	@RequestMapping(value = "/stock/modulation", method = RequestMethod.GET)
	public String stock(){
		logger.info("/stock_modulation");

		return "/center/stock/stock_modulation";
	}
	
	@RequestMapping(value = "/stock/add", method = RequestMethod.GET)
	public String stockadd(){
		logger.info("/stock_add");

		return "/center/stock/stock_add";
	}
	
	@RequestMapping(value = "/stock/add", method = RequestMethod.POST)
	@ResponseBody
	public String stockaddpost(HttpServletRequest request) throws Exception {
	        
	    String[] ajaxMsg = request.getParameterValues("stockadd");
	    int size = ajaxMsg.length;
		logger.info("size : "+ Integer.toString(size));
	    
	    List<StockVO> stockVO = new ArrayList<StockVO>();
	    
	    String[][] msgSplit = new String[size][5];
	    
	    String resultMsg = "항목이 추가 되었습니다.";
	    
		for (int i = 0; i < size; i++) {

			msgSplit[i] = ajaxMsg[i].split(",");


			logger.info("JSP에서 받은 MSG : " + msgSplit[i][0]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][1]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][2]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][3]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][4]);
			
			StockVO sVO = new StockVO();

			sVO.setS_name(msgSplit[i][0]);
			sVO.setS_size(Integer.parseInt(msgSplit[i][1]));
			sVO.setS_cost(Integer.parseInt(msgSplit[i][2]));
			sVO.setS_price(Integer.parseInt(msgSplit[i][3]));
			sVO.setS_origin(msgSplit[i][4]);

			stockVO.add(sVO);


		}

	    
	    if(stockVO !=null || stockVO.size() != 0) {
	    	for(StockVO stock : stockVO) {
	    		stockService.stockAdd(stock);
	    	}
	    }
	    
	    //Map<String, Object> result = new HashMap<String, Object>();
	    //result.put("stockVO", stockVO);
	    
		logger.info("Controller에서 보낸 MSG : "+ resultMsg);
	        
	    return resultMsg;
	}
	
	@RequestMapping(value = "/stock/stocklist", method = RequestMethod.POST)
	@ResponseBody
	public Object stocklist() throws Exception{
		logger.info("/stock_list");
		
		List<StockVO> stockList = stockService.stockList();
		
		WrapperVO rtnVO = new WrapperVO();
		rtnVO.setAaData(stockList);
		rtnVO.setiTotalDisplayRecords(stockService.listCount());
		rtnVO.setiTotalRecords(stockService.listCount());
		
		return rtnVO;
	}
	
	@RequestMapping(value = "/stock/test", method = RequestMethod.GET)
	public String stest(){
		logger.info("/stock_test");

		return "/center/stock/test";
	}

}
