package com.franchaining.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.franchaining.dao.EmpDAO;
import com.franchaining.vo.EmpVO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.RegwaitVO;

@Service
public class EmpServiceImpl implements EmpService{

	@Inject
	private EmpDAO dao;

	@Override
	public void register(RegVO regVO) throws Exception {
		
		dao.register(regVO);
	}

	@Override
	public EmpVO userinfo(int e_no) throws Exception {
		return dao.userinfo(e_no);
	}

	@Override
	public List<RegwaitVO> regwait(List<ManagerVO> regwaitlist) throws Exception {		
		return dao.regwait(regwaitlist);
	}

	@Override
	public int EmpCount(int e_no) throws Exception {
		return dao.EmpCount(e_no);
	}

	@Override
	public int AlreadyBranch(int b_no) throws Exception {
		return dao.AlreadyBranch(b_no);
	}

	
	
}
