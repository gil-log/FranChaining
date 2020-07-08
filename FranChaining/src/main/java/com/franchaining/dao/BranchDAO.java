package com.franchaining.dao;

import java.util.List;

import com.franchaining.vo.BranchVO;
import com.franchaining.vo.RegVO;

public interface BranchDAO {
	
	public RegVO b_no_check(RegVO regVO) throws Exception;
	
	public int BranchCount() throws Exception;

	public List<BranchVO> branchlist() throws Exception;
}
