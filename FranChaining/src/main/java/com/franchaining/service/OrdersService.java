package com.franchaining.service;

import java.util.List;

import com.franchaining.vo.OrdersVO;
import com.franchaining.vo.OrderslistVO;

public interface OrdersService {
	
	public List<OrderslistVO> ordersList(OrdersVO ordersVO) throws Exception;

	public int listCount(OrdersVO ordersVO) throws Exception;
}
