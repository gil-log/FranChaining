package com.franchaining.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.franchaining.dao.ManagerDAO;
import com.franchaining.dao.StockDAO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;
import com.franchaining.vo.StocklistVO;

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

	@Override
	public List<StockVO> s_name_info() throws Exception {
		return dao.s_name_info();
	}

	@Override
	public StockVO stockinfo(StockVO stockVO) throws Exception {
		return dao.stockinfo(stockVO);
	}

	@Override
	public List<StocklistVO> stockcenterlist() throws Exception {
		return dao.stockcenterlist();
	}
}
