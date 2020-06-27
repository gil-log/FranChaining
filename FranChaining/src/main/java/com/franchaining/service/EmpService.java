package com.franchaining.service;

import com.franchaining.vo.EmpVO;
import com.franchaining.vo.RegVO;

public interface EmpService {

	public void register(RegVO regVO) throws Exception;
	
	public EmpVO userinfo(int e_no) throws Exception;
	
}
