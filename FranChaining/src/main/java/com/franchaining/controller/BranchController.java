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
import com.franchaining.vo.EmpVO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;

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
	public String manager_order(){
		logger.info("/manager_order");

		return "/branch/manager/manager_order";
	}
	
	@RequestMapping(value = "/manager/orderlist", method = RequestMethod.GET)
	public String manager_orderlist(){
		logger.info("/manager_orderlist");

		return "/branch/manager/manager_orderlist";
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
	
}
