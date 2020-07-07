package com.franchaining.service;

import com.franchaining.vo.BranchVO;
import com.franchaining.vo.RegVO;

public interface BranchService {
	
	public RegVO b_no_check(RegVO regVO) throws Exception;
	
	public int BranchCount() throws Exception;
	
	public BranchVO branchinfo(BranchVO branchVO) throws Exception;
}
