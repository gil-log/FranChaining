package com.franchaining.service;

import java.util.List;

import com.franchaining.vo.OrdersVO;
import com.franchaining.vo.OrderslistVO;
import com.franchaining.vo.StockVO;

public interface OrdersService {
	
	public List<OrderslistVO> ordersList(OrdersVO ordersVO) throws Exception;

	public int listCount(OrdersVO ordersVO) throws Exception;

	public List<OrderslistVO> showOrders(int o_no) throws Exception;

	public int showlistCount(int o_no) throws Exception;

	public void ordersApply(OrdersVO ordersVO) throws Exception;
	
	public void ordersDelete(OrdersVO ordersVO) throws Exception;
	
	public void stockGoneOrdersDelete(StockVO stockVO) throws Exception;
	
	public List<OrdersVO> ordersadd_master (OrdersVO ordersVO) throws Exception;
	
	public List<OrdersVO> ordersadd_center (OrdersVO ordersVO) throws Exception;
}
