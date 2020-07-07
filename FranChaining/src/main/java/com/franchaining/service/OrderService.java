package com.franchaining.service;

import java.util.List;

import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.OrderVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;

public interface OrderService {

	public List<OrderVO> orderList() throws Exception;
	
	public List<OrderVO> viewList() throws Exception;
	
}
