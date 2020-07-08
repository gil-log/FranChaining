package com.franchaining.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.franchaining.dao.ManagerDAO;
import com.franchaining.dao.StockDAO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;

@Service
public class StockServiceImpl implements StockService {
	
	@Inject
	private StockDAO dao;

	@Override
	public void register(RegVO regVO) throws Exception {
		dao.register(regVO);
	}
	
	@Override
	public List<StockVO> stockcenterlist() throws Exception {
		return dao.stockcenterlist();
	}

	@Override
	public StockVO stockcenter(StockVO StockVO) throws Exception {
		// 담에지움
		return null;
	}
	
	@Override
	public List<StockVO> stocklist() throws Exception{
		return dao.stocklist();
	}
}
