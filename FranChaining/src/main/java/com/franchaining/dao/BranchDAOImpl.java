package com.franchaining.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.franchaining.vo.RegVO;

@Repository
public class BranchDAOImpl implements BranchDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public RegVO b_no_check(RegVO regVO) throws Exception {
		return sqlSession.selectOne("branchMapper.b_no_check", regVO);
	}

}
