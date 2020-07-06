package com.franchaining.service;

import java.util.List;

import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;

public interface StockService {

	public List<StockVO> stockList() throws Exception;
	
	public int listCount() throws Exception;
	
	public void stockAdd(StockVO stockVO) throws Exception;
}
