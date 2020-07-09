package com.franchaining.controller;

import java.text.DateFormat;
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
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.OrdersVO;
import com.franchaining.vo.OrderslistVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;
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
	
	@RequestMapping(value = "/master/hr/main", method = RequestMethod.GET)
	public String master_hr(){
		logger.info("/master/hr/main");

		return "/branch/master/hr/hr_main";
	}
	
	@RequestMapping(value = "/manager/main", method = RequestMethod.GET)
	public String manager_hr(){
		logger.info("/manager/main");

		return "/branch/manager/manager_main";
	}
	
	@RequestMapping(value = "/master/hr/administration", method = RequestMethod.GET)
	public String master_hrAdministration(Model model) throws Exception {
		logger.info("master_hraAministration");

		List<ManagerVO> regwaitlist = managerService.regwait();
		
		List<EmpVO> regwaitemplist = empService.regwait(regwaitlist);

		for(int i = 0; i < regwaitemplist.size(); i++) {
			logger.info(regwaitemplist.get(i).getE_name());
		}
		
		model.addAttribute("regwait", regwaitemplist);
		
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
	
	@RequestMapping(value = "/manager/orderlisttest", method = RequestMethod.GET)
	public String managerorderhistoryget(){
		logger.info("/manager/orderhistory");

		return "/branch/manager/manager_orderlisttest";
	}
	
}
