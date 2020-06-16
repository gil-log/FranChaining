package com.franchaining.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.franchaining.dao.ManagerDAO;
import com.franchaining.vo.RegVO;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Inject
	private ManagerDAO dao;

	@Override
	public void register(RegVO regVO) throws Exception {
		dao.register(regVO);
	}
	
}
