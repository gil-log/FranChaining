package com.franchaining.dao;

import java.util.List;

import com.franchaining.vo.EmpVO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;

public interface EmpDAO {
	
	public void register(RegVO regVO) throws Exception;

	public EmpVO userinfo(int e_no) throws Exception;
	
	public List<EmpVO> regwait(List<ManagerVO> regwaitlist) throws Exception;
}
