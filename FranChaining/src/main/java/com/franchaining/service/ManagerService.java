package com.franchaining.service;

import java.util.List;

import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;

public interface ManagerService {

	public void register(RegVO regVO) throws Exception;

	public ManagerVO login(ManagerVO managerVO) throws Exception;
	
	public ManagerVO regchk(ManagerVO managerVO) throws Exception;
	
	public List<ManagerVO> regwait() throws Exception;
	
	public void regupdate(ManagerVO managerVO) throws Exception;
	
	public int MflagCount(int m_flag) throws Exception;

	public void hasEnoReg(RegVO regVO) throws Exception;
	
	public int mflagChk(int e_no) throws Exception;
}
