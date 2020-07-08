package com.franchaining.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.franchaining.dao.OrdersDAO;
import com.franchaining.vo.OrdersVO;
import com.franchaining.vo.OrderslistVO;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Inject
	private OrdersDAO dao;

	@Override
	public List<OrderslistVO> ordersList(OrdersVO ordersVO) throws Exception {
		return dao.ordersList(ordersVO);
	}

	@Override
	public int listCount(OrdersVO ordersVO) throws Exception {
		return dao.listCount(ordersVO);
	}
	
}
