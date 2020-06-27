package com.franchaining.service;

import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;

public interface ManagerService {

	public void register(RegVO regVO) throws Exception;

	public ManagerVO login(ManagerVO managerVO) throws Exception;
	

	public ManagerVO regchk(ManagerVO managerVO) throws Exception;
	
}
