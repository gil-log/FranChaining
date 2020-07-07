package com.franchaining.service;

import java.util.List;

import com.franchaining.vo.OrdersVO;


public interface OrdersService {
	public List<OrdersVO> orders_history() throws Exception;
	
}
