package com.franchaining.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.franchaining.dao.StockDAO;
import com.franchaining.vo.StockVO;

@Service
public class StockServiceImpl implements StockService {
	
	@Inject
	private StockDAO dao;


	@Override
	public StockVO stockinfo(StockVO stockVO) throws Exception {
		return dao.stockinfo(stockVO);
	}


	@Override
	public List<StockVO> s_name_info() throws Exception {
		return dao.s_name_info();
	}
}
