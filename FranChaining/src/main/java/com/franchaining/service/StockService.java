package com.franchaining.service;

import java.util.ArrayList;
import java.util.List;

import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;

public interface StockService {

	public void register(RegVO regVO) throws Exception;
	
	public StockVO stockcenter(StockVO StockVO) throws Exception;
	
	public List<StockVO> stockcenterlist() throws Exception;
	
	public List<StockVO> stocklist() throws Exception;
}