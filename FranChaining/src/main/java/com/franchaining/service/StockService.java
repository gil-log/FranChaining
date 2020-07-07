package com.franchaining.service;


import java.util.List;

import com.franchaining.vo.StockVO;

public interface StockService {
	
	public StockVO stockinfo(StockVO stockVO) throws Exception;
	
	public List<StockVO> s_name_info() throws Exception;
}
