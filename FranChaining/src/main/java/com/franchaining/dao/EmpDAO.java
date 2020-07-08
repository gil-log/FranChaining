package com.franchaining.dao;

import java.util.List;

import com.franchaining.vo.EmpVO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.RegwaitVO;

public interface EmpDAO {
	
	public void register(RegVO regVO) throws Exception;

	public EmpVO userinfo(int e_no) throws Exception;
	
	public List<RegwaitVO> regwait(List<ManagerVO> regwaitlist) throws Exception;
	
	public int EmpCount(int e_no) throws Exception;

	public int AlreadyBranch(int b_no) throws Exception;
	
	public EmpVO masterInfo(int b_no) throws Exception;
}
