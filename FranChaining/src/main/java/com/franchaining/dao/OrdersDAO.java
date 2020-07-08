package com.franchaining.dao;

import java.util.List;

import com.franchaining.vo.OrdersVO;
import com.franchaining.vo.OrderslistVO;

public interface OrdersDAO {
	
	public List<OrderslistVO> ordersList(OrdersVO ordersVO) throws Exception;

	public int listCount(OrdersVO ordersVO) throws Exception;
}



