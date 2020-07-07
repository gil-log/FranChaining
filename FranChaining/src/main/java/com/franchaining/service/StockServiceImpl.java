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
	public List<StockVO> stockList() throws Exception{
		return dao.stockList();
	}

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	@Override
	public void stockAdd(StockVO stockVO) throws Exception {
		dao.stockAdd(stockVO);
	}

	@Override
	public void stockModul(StockVO stockVO) throws Exception {
		dao.stockModul(stockVO);
	}

	@Override
	public void stockDelete(StockVO stockVO) throws Exception {
		dao.stockDelete(stockVO);
	}
}
