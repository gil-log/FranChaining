package com.franchaining.dao;

import com.franchaining.vo.BranchVO;
import com.franchaining.vo.RegVO;

public interface BranchDAO {
	
	public RegVO b_no_check(RegVO regVO) throws Exception;
	
	public int BranchCount() throws Exception;
	
	public BranchVO branchinfo(int b_no) throws Exception;

}
