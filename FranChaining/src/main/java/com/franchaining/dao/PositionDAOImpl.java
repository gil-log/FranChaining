package com.franchaining.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PositionDAOImpl implements PositionDAO {
	
	@Inject
	private SqlSession sqlSession;
	
}
