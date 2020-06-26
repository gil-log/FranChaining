package com.franchaining.service;

import com.franchaining.vo.RegVO;

public interface BranchService {
	
	public RegVO b_no_check(RegVO regVO) throws Exception;
	
	public RegVO b_id_check(RegVO regVO) throws Exception;
}
