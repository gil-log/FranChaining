package com.franchaining.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.franchaining.dao.OrdersDAO;
import com.franchaining.vo.OrdersVO;


@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Inject
	private OrdersDAO dao;

	@Override
	public List<OrdersVO> orders_history() throws Exception {

		return dao.orders_history();
	}

	
}
