package com.franchaining.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.franchaining.vo.ManagerVO;
import com.franchaining.vo.RegVO;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Inject
	private SqlSession sqlSession;
	   
	@Override
	public void register(RegVO regVO) throws Exception {
		
		sqlSession.insert("managerMapper.register", regVO);
		
	}

	@Override
	public ManagerVO login(ManagerVO managerVO) throws Exception {
		
		return sqlSession.selectOne("managerMapper.login", managerVO);
		
	}

	@Override
	public ManagerVO regchk(ManagerVO managerVO) throws Exception {

		return sqlSession.selectOne("managerMapper.regchk", managerVO);
	}

	@Override
	public List<ManagerVO> regwait() throws Exception {
	
		return sqlSession.selectList("managerMapper.regwait");
	}

	@Override
	public void regupdate(ManagerVO managerVO) throws Exception {
		
		sqlSession.update("managerMapper.regupdate", managerVO);
	}

	@Override
	public int MflagCount(int m_flag) throws Exception {
		return sqlSession.selectOne("managerMapper.MflagCount", m_flag);
	}

	@Override
	public void hasEnoReg(RegVO regVO) throws Exception {
		
		sqlSession.insert("managerMapper.hasEnoReg", regVO);
		
	}
	

}
