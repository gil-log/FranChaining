package com.franchaining.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.franchaining.dao.ManagerDAO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;

@Service
public class StockServiceImpl implements StockService {
	
	@Inject
	private ManagerDAO dao;

	@Override
	public void register(RegVO regVO) throws Exception {
		dao.register(regVO);
	}

	@Override
	public ManagerVO login(ManagerVO managerVO) throws Exception {
		return dao.login(managerVO);
	}

	@Override
	public ManagerVO regchk(ManagerVO managerVO) throws Exception {
		return dao.regchk(managerVO);
	}

	@Override
	public List<ManagerVO> regwait() throws Exception {

		return dao.regwait();
	}
}
