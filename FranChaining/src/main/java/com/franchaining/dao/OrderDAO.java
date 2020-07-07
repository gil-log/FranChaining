package com.franchaining.dao;

import java.util.List;

import com.franchaining.vo.OrderVO;

public interface OrderDAO {

	public List<OrderVO> orderList() throws Exception;
	
	public List<OrderVO> viewList() throws Exception;
	
}
