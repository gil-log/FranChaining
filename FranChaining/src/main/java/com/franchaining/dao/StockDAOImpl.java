package com.franchaining.dao;

import org.apache.ibatis.session.SqlSession;

public interface StockDAOImpl implements StockDAO{
	
	@Inject 
	private SqlSession sqlSession;
	
	@Override
	public void register(StockVO stockVO) throws Exception{
		
		sqlSession.insert("stockMapper.register", StockVO);
	}
	
	@Override
	public StockVO login(StockVO stockVO) throws Exception{

		return sqlSession.selectOne("managerMapper.login", managerVO);
		
	}
	
	
	
}
