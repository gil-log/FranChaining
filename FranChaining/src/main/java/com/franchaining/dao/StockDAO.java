package com.franchaining.dao;

import java.util.List;

import com.franchaining.vo.StockVO;

public interface StockDAO {
	public StockVO stockinfo(StockVO stockVO) throws Exception;
	
	public List<StockVO> s_name_info() throws Exception;
}
