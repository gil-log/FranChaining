package com.franchaining.dao;

import java.util.ArrayList;
import java.util.List;

import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;

public interface StockDAO {

	public void register(RegVO regVO) throws Exception;

	public List<StockVO> stockcenterlist() throws Exception;
	
	public List<StockVO> stocklist() throws Exception;
	
}
