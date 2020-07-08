package com.franchaining.service;

import java.util.List;

import com.franchaining.vo.BranchVO;
import com.franchaining.vo.RegVO;

public interface BranchService {
	
	public RegVO b_no_check(RegVO regVO) throws Exception;
	
	public int BranchCount() throws Exception;
	
	public List<BranchVO> branchlist() throws Exception;
}
