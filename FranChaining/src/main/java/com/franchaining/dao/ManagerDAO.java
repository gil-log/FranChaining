package com.franchaining.dao;

import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;

public interface ManagerDAO {
	
	public void register(RegVO regVO) throws Exception;
	public ManagerVO login(ManagerVO managerVO) throws Exception;
	public ManagerVO userinfo(ManagerVO managerVO) throws Exception;

}
