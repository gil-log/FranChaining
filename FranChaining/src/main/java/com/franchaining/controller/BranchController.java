package com.franchaining.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.franchaining.service.BranchService;
import com.franchaining.service.EmpService;
import com.franchaining.service.ManagerService;
import com.franchaining.service.OrdersService;
import com.franchaining.service.StockService;
import com.franchaining.vo.BranchVO;
import com.franchaining.vo.EmpVO;
import com.franchaining.vo.EmplistVO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.OrdersVO;
import com.franchaining.vo.OrderslistVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;
import com.franchaining.vo.StocklistVO;
import com.franchaining.vo.WrapperVO;

import net.sf.json.JSONArray;

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
	
	
	@RequestMapping(value = "/manager/main", method = RequestMethod.GET)
	public String manager_hr(){
		logger.info("/manager/main");

		return "/branch/manager/manager_main";
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
	
	@RequestMapping(value = "/manager/order", method = RequestMethod.GET)
	public String managerOrderget(Model model, HttpServletRequest request) throws Exception {
		logger.info("/manager/order");

		List<StockVO> s_name_info = stockService.s_name_info();

		model.addAttribute("s_name_info", s_name_info);
		for (int i = 0; i < s_name_info.size(); i++) {
			logger.info(s_name_info.get(i).getS_name());
		}
		return "branch/manager/manager_order";
	}

	@RequestMapping(value = "/manager/order", method = RequestMethod.PUT)
	public @ResponseBody Object managerOrderput(HttpServletRequest request) throws Exception {
		logger.info("/manager/order");

		String s_name = request.getParameter("s_name");

		logger.info(s_name);
		// List<StockVO> s_name_info = stockService.s_name_info();
		StockVO stockVO = new StockVO();
		stockVO.setS_name(s_name);
		StockVO stockinfo = stockService.stockinfo(stockVO);
		// JSONArray jsonArray = JSONArray(s_name_info);

		return stockinfo;
	}
	
	@RequestMapping(value = "/manager/order", method = RequestMethod.POST)
	public @ResponseBody Object managerOrderpost(HttpServletRequest request) throws Exception {
		logger.info("/manager/order");

		String[] ajaxMsg = request.getParameterValues("orders");
	    int size = ajaxMsg.length;
		logger.info("size : "+ Integer.toString(size));
		
		List<OrdersVO> ordersVO = new ArrayList<OrdersVO>();
	    
	    String[][] msgSplit = new String[size][5];
	    
	    String resultMsg = "항목이 추가 되었습니다.";
	    
		for (int i = 0; i < size; i++) {

			msgSplit[i] = ajaxMsg[i].split(",");


			logger.info("JSP에서 받은 MSG : " + msgSplit[i][0]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][1]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][2]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][3]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][4]);
			
			OrdersVO oVO = new OrdersVO();
			
			oVO.setB_no(Integer.parseInt(msgSplit[i][0]));
			oVO.setS_no(Integer.parseInt(msgSplit[i][1]));
			oVO.setO_amount(Integer.parseInt(msgSplit[i][2]));
			oVO.setO_date(msgSplit[i][3]);
			oVO.setO_deadline(msgSplit[i][4]);

			ordersVO.add(oVO);


		}

	    
		
		  if(ordersVO !=null || ordersVO.size() != 0) { 
			  for(OrdersVO orders : ordersVO){ 
				  ordersService.ordersadd_master(orders);
				  } 
			  }
		
	    
	    //Map<String, Object> result = new HashMap<String, Object>();
	    //result.put("stockVO", stockVO);
	    
		logger.info("Controller에서 보낸 MSG : "+ resultMsg);
	        
	    return resultMsg;

	}

	@RequestMapping(value = "/manager/orderlist", method = RequestMethod.GET)
	public String manager_orderlist(Model model) throws Exception{
		logger.info("/manager_orderlist");
		
		List<StockVO> s_name_info = stockService.s_name_info();
		
		model.addAttribute("s_name_info", s_name_info);
		
		return "/branch/manager/manager_orderlist";
	}
	
	@RequestMapping(value = "/manager/orderlist", method = RequestMethod.POST)
	@ResponseBody
	public Object orderlistpost(HttpServletRequest request) throws Exception{
		logger.info("/order_list");
		
		HttpSession session = request.getSession();
		
		BranchVO branchinfo = (BranchVO) session.getAttribute("branch");
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setB_no(branchinfo.getB_no());
		
		List<OrderslistVO> ordersList = ordersService.ordersList(ordersVO);
		
		
		logger.info("날짜 : " + ordersList.get(0).getS_name());
		
		
		WrapperVO rtnVO = new WrapperVO();
		rtnVO.setAaData(ordersList);
		rtnVO.setiTotalDisplayRecords(ordersService.listCount(ordersVO));
		rtnVO.setiTotalRecords(ordersService.listCount(ordersVO));
		
		return rtnVO;
	}
	
	@RequestMapping(value = "/manager/orderlist", method = RequestMethod.PUT, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object orderlistput(HttpServletRequest request) throws Exception{
		logger.info("/order_list/put");
		
		String so_no = request.getParameter("o_no");
		
		int o_no = Integer.parseInt(so_no);
		
		logger.info(so_no);
			
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setO_no(o_no);
		ordersService.ordersApply(ordersVO);

		String smsg = "승인 신청 되었습니다.";
		
		return smsg;
	}
	
	@RequestMapping(value = "/manager/orderlist", method = RequestMethod.DELETE, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object orderlistdelete(HttpServletRequest request) throws Exception{
		logger.info("/order_list/delete");
		
		String so_no = request.getParameter("o_no");
		
		int o_no = Integer.parseInt(so_no);
		
		logger.info(so_no);
			
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setO_no(o_no);
		ordersService.ordersDelete(ordersVO);
		
		String smsg = "삭제 되었습니다.";
		
		return smsg;
	}
	
	@RequestMapping(value = "/manager/showorder", method = RequestMethod.POST)
	@ResponseBody
	public Object showorderpost(HttpServletRequest request) throws Exception{
		logger.info("ajax_showorder");
		
	    String s_o_no = request.getParameter("o_no");
		logger.info(s_o_no);
		
		int o_no = Integer.parseInt(s_o_no);
		
		List<OrderslistVO> showorderslist = ordersService.showOrders(o_no);
		
		JSONArray jsonArray = JSONArray.fromObject(showorderslist);
		
		return jsonArray;
	}
	
	@RequestMapping(value = "/manager/modulation", method = RequestMethod.PUT)
	@ResponseBody
	public String stockmodulationput(HttpServletRequest request) throws Exception {

		String[] ajaxMsg = request.getParameterValues("stockmodul");
		int size = ajaxMsg.length;
		logger.info("size : " + Integer.toString(size));

		List<StockVO> stockVO = new ArrayList<StockVO>();

		String[][] msgSplit = new String[size][6];

		String resultMsg = "항목이 변경 되었습니다.";

		for (int i = 0; i < size; i++) {

			msgSplit[i] = ajaxMsg[i].split(",");

			logger.info("JSP에서 받은 MSG : " + msgSplit[i][0]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][1]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][2]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][3]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][4]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][5]);

			StockVO sVO = new StockVO();

			sVO.setS_name(msgSplit[i][0]);
			sVO.setS_size(Integer.parseInt(msgSplit[i][1]));
			sVO.setS_cost(Integer.parseInt(msgSplit[i][2]));
			sVO.setS_price(Integer.parseInt(msgSplit[i][3]));
			sVO.setS_origin(msgSplit[i][4]);
			sVO.setS_no(Integer.parseInt(msgSplit[i][5]));

			stockVO.add(sVO);

		}

		if (stockVO != null || stockVO.size() != 0) {
			for (StockVO stock : stockVO) {
				//stockService.stockModul(stock);
			}
		}

		// Map<String, Object> result = new HashMap<String, Object>();
		// result.put("stockVO", stockVO);

		logger.info("Controller에서 보낸 MSG : " + resultMsg);

		return resultMsg;
	}

	@RequestMapping(value = "/manager/modulation", method = RequestMethod.DELETE)
	@ResponseBody
	public String stockmodulationdelete(HttpServletRequest request) throws Exception {

		String[] ajaxMsg = request.getParameterValues("stockmodul");
		int size = ajaxMsg.length;
		logger.info("size : " + Integer.toString(size));

		List<StockVO> stockVO = new ArrayList<StockVO>();

		String[][] msgSplit = new String[size][6];

		String resultMsg = "항목이 삭제 되었습니다.";

		for (int i = 0; i < size; i++) {

			msgSplit[i] = ajaxMsg[i].split(",");

			logger.info("JSP에서 받은 MSG : " + msgSplit[i][0]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][1]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][2]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][3]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][4]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][5]);

			StockVO sVO = new StockVO();

			sVO.setS_name(msgSplit[i][0]);
			sVO.setS_size(Integer.parseInt(msgSplit[i][1]));
			sVO.setS_cost(Integer.parseInt(msgSplit[i][2]));
			sVO.setS_price(Integer.parseInt(msgSplit[i][3]));
			sVO.setS_origin(msgSplit[i][4]);
			sVO.setS_no(Integer.parseInt(msgSplit[i][5]));

			stockVO.add(sVO);

		}

		if (stockVO != null || stockVO.size() != 0) {
			for (StockVO stock : stockVO) {
				//stockService.stockDelete(stock);
			}
		}

		// Map<String, Object> result = new HashMap<String, Object>();
		// result.put("stockVO", stockVO);

		logger.info("Controller에서 보낸 MSG : " + resultMsg);

		return resultMsg;
	}
	
	@RequestMapping(value = "/master/orderlist", method = RequestMethod.GET)
	public String managerorderhistoryget(Model model) throws Exception{
		logger.info("/master/orderlist");
		List<StockVO> s_name_info = stockService.s_name_info();
		
		model.addAttribute("s_name_info", s_name_info);
		return "/branch/master/master_orderlist";
	}
	
	@RequestMapping(value = "/master/orderlist", method = RequestMethod.POST)
	@ResponseBody
	public Object masterorderlistpost(HttpServletRequest request) throws Exception{
		logger.info("/masterorder_list");
		
		HttpSession session = request.getSession();
		
		BranchVO branchinfo = (BranchVO) session.getAttribute("branch");
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setB_no(branchinfo.getB_no());
		
		List<OrderslistVO> ordersList = ordersService.ordersList(ordersVO);
		
		
		logger.info("날짜 : " + ordersList.get(0).getS_name());
		
		
		WrapperVO rtnVO = new WrapperVO();
		rtnVO.setAaData(ordersList);
		rtnVO.setiTotalDisplayRecords(ordersService.listCount(ordersVO));
		rtnVO.setiTotalRecords(ordersService.listCount(ordersVO));
		
		return rtnVO;
	}
	
	@RequestMapping(value = "/master/orderlist", method = RequestMethod.PUT, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object masterorderlistput(HttpServletRequest request) throws Exception{
		logger.info("/masterorder_list/put");
		
		String so_no = request.getParameter("o_no");
		
		int o_no = Integer.parseInt(so_no);
		
		logger.info(so_no);
			
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setO_no(o_no);
		ordersService.ordersApply(ordersVO);

		String smsg = "승인 신청 되었습니다.";
		
		return smsg;
	}
	
	@RequestMapping(value = "/master/orderlist", method = RequestMethod.DELETE, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object masterorderlistdelete(HttpServletRequest request) throws Exception{
		logger.info("/order_list/delete");
		
		String so_no = request.getParameter("o_no");
		
		int o_no = Integer.parseInt(so_no);
		
		logger.info(so_no);
			
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setO_no(o_no);
		ordersService.ordersDelete(ordersVO);
		
		String smsg = "삭제 되었습니다.";
		
		return smsg;
	}
	
	@RequestMapping(value = "/master/showorder", method = RequestMethod.POST)
	@ResponseBody
	public Object mastershoworderpost(HttpServletRequest request) throws Exception{
		logger.info("ajax_showorder");
		
	    String s_o_no = request.getParameter("o_no");
		logger.info(s_o_no);
		
		int o_no = Integer.parseInt(s_o_no);
		
		List<OrderslistVO> showorderslist = ordersService.showOrders(o_no);
		
		JSONArray jsonArray = JSONArray.fromObject(showorderslist);
		
		return jsonArray;
	}
	
	@RequestMapping(value = "/manager/stock", method = RequestMethod.GET)
	public String managerstock(){
		logger.info("/manager/stock");

		return "/branch/manager/manager_stock";
	}
	
	@RequestMapping(value = "/master/main", method = RequestMethod.GET)
	public String master_main(){
		logger.info("/master/main");

		return "/branch/master/master_main";
	}

@RequestMapping(value = "/master/order", method = RequestMethod.GET)
	public String master_order(StockVO stockVO, Model model, HttpServletRequest request)throws Exception {
		logger.info("/master_order");

		List<StockVO> s_name_info = stockService.s_name_info();

		model.addAttribute("s_name_info", s_name_info);
		for (int i = 0; i < s_name_info.size(); i++) {
			logger.info(s_name_info.get(i).getS_name());
		}

		return "/branch/master/master_order";
	}

@RequestMapping(value = "/master/order", method = RequestMethod.PUT)
public @ResponseBody Object masterOrderput(HttpServletRequest request) throws Exception {
	logger.info("/master/order");

	String s_name = request.getParameter("s_name");

	logger.info(s_name);
	StockVO stockVO = new StockVO();
	stockVO.setS_name(s_name);
	StockVO stockinfo = stockService.stockinfo(stockVO);

	return stockinfo;
}

@RequestMapping(value = "/master/order", method = RequestMethod.POST)
public @ResponseBody Object masterOrderpost(HttpServletRequest request) throws Exception {
	logger.info("/master/order");

	String[] ajaxMsg = request.getParameterValues("orders");
    int size = ajaxMsg.length;
	logger.info("size : "+ Integer.toString(size));
	
	List<OrdersVO> ordersVO = new ArrayList<OrdersVO>();
    
    String[][] msgSplit = new String[size][5];
    
    String resultMsg = "항목이 추가 되었습니다.";
    
	for (int i = 0; i < size; i++) {

		msgSplit[i] = ajaxMsg[i].split(",");


		logger.info("JSP에서 받은 MSG : " + msgSplit[i][0]);
		logger.info("JSP에서 받은 MSG : " + msgSplit[i][1]);
		logger.info("JSP에서 받은 MSG : " + msgSplit[i][2]);
		logger.info("JSP에서 받은 MSG : " + msgSplit[i][3]);
		logger.info("JSP에서 받은 MSG : " + msgSplit[i][4]);
		
		OrdersVO oVO = new OrdersVO();
		
		oVO.setB_no(Integer.parseInt(msgSplit[i][0]));
		oVO.setS_no(Integer.parseInt(msgSplit[i][1]));
		oVO.setO_amount(Integer.parseInt(msgSplit[i][2]));
		oVO.setO_date(msgSplit[i][3]);
		oVO.setO_deadline(msgSplit[i][4]);

		ordersVO.add(oVO);


	}

    
	
	  if(ordersVO !=null || ordersVO.size() != 0) { 
		  for(OrdersVO orders : ordersVO){ 
			  ordersService.ordersadd_center(orders);
			  } 
		  }
	
    
    //Map<String, Object> result = new HashMap<String, Object>();
    //result.put("stockVO", stockVO);
    
	logger.info("Controller에서 보낸 MSG : "+ resultMsg);
        
    return resultMsg;

}


@RequestMapping(value = "/master/orderhistory", method = RequestMethod.GET)
	public String master_orederhistory(Model model) throws Exception{
		logger.info("/master_orderhistory");


		return "/branch/master/master_orderhistory";
	}

@RequestMapping(value = "/master/stock", method = RequestMethod.GET)
	public String master_stock(){
		logger.info("/master_stock");

		return "/branch/master/master_stock";
	}


@RequestMapping(value = "/master/managerlist", method = RequestMethod.GET)
public String master_mgrlist(Model model, HttpServletRequest request)throws Exception {
	logger.info("/master_managerlist");
	String s_b_no = request.getParameter("b_no");
	logger.info("000000000000" + s_b_no);
	int b_no = Integer.parseInt(s_b_no);
	logger.info("kkkkkkkkkkkkkkkk" + b_no);
	List<EmplistVO> managerlist = empService.managerlist(b_no);
	
	for(int i = 0; i < managerlist.size(); i++) {
		logger.info(managerlist.get(i).getE_name());
	}
	
	model.addAttribute("managerlist", managerlist);
	
	return "/branch/master/master_managerlist";
	}

@RequestMapping(value = "/master/regmanager", method = RequestMethod.GET)
public String master_regmgr()throws Exception {
	logger.info("/master_regmanager");


	return "/branch/master/master_regmanager";
	}

}

