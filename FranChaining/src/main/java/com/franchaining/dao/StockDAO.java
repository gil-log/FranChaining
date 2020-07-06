package com.franchaining.dao;

import java.util.List;

import com.franchaining.vo.StockVO;

public interface StockDAO {

	public List<StockVO> stockList() throws Exception;
	
	public int listCount() throws Exception;
	
	public void stockAdd(StockVO stockVO) throws Exception;
}
