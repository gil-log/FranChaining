package com.franchaining.dao;

import java.util.List;

import com.franchaining.vo.OrdersVO;

public interface OrdersDAO {
	
	public List<OrdersVO> orders_history() throws Exception;

}
