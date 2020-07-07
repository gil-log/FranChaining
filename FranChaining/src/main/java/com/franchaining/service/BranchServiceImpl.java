package com.franchaining.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.franchaining.dao.BranchDAO;
import com.franchaining.vo.BranchVO;
import com.franchaining.vo.RegVO;

@Service
public class BranchServiceImpl implements BranchService {
	
	@Inject
	private BranchDAO dao;
	
	@Override
	public RegVO b_no_check(RegVO regVO) throws Exception {
		return dao.b_no_check(regVO);
	}

	@Override
	public int BranchCount() throws Exception {
		return dao.BranchCount();
	}

	@Override
	public BranchVO branchinfo(BranchVO branchVO) throws Exception {
		return dao.branchinfo(branchVO);
	}
	
}
