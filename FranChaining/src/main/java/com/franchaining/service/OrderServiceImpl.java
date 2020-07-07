package com.franchaining.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.franchaining.dao.OrderDAO;
import com.franchaining.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderDAO dao;

	@Override
	public List<OrderVO> orderList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderVO> viewList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
