package com.franchaining.service;

import java.util.List;

import com.franchaining.vo.OrdersVO;
import com.franchaining.vo.OrderslistVO;

public interface OrdersService {
	
	public List<OrderslistVO> ordersList(OrdersVO ordersVO) throws Exception;

	public int listCount(OrdersVO ordersVO) throws Exception;

	public List<OrderslistVO> showOrders(int o_no) throws Exception;

	public int showlistCount(int o_no) throws Exception;

	public void ordersApply(OrdersVO ordersVO) throws Exception;
}
