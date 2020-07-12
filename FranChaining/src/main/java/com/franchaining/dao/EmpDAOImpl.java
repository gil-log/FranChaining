package com.franchaining.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.franchaining.vo.EmpVO;
import com.franchaining.vo.EmplistVO;
import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;
import com.franchaining.vo.RegwaitVO;

@Repository
public class EmpDAOImpl implements EmpDAO {

	@Inject
	private SqlSession sqlSession;
	   
	@Override
	public void register(RegVO regVO) throws Exception {
		sqlSession.insert("empMapper.register", regVO);
	}

	@Override
	public EmpVO userinfo(int e_no) throws Exception {
		return sqlSession.selectOne("empMapper.userinfo", e_no);
	}

	@Override
	public List<RegwaitVO> regwait(List<ManagerVO> regwaitlist) throws Exception {
		return sqlSession.selectList("empMapper.regwait", regwaitlist);
	}

	@Override
	public int EmpCount(int e_no) throws Exception {
		return sqlSession.selectOne("empMapper.EmpCount", e_no);
	}

	@Override
	public int AlreadyBranch(int b_no) throws Exception {
		return sqlSession.selectOne("empMapper.AlreadyBranch", b_no);
	}

	@Override
	public EmpVO masterInfo(int b_no) throws Exception {
		return sqlSession.selectOne("empMapper.masterInfo", b_no);
	}

	@Override
	public List<EmplistVO> managerlist(int b_no) throws Exception {
		return sqlSession.selectList("empMapper.managerlist");
	}

}
