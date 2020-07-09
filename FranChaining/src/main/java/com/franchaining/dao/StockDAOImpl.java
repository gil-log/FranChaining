package com.franchaining.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.franchaining.vo.StockVO;

@Repository
public class StockDAOImpl implements StockDAO{
	
	@Inject 
	private SqlSession sqlSession;

	@Override
	public List<StockVO> stockList() throws Exception {
		return sqlSession.selectList("stockMapper.stocklist");
	}

	@Override
	public int listCount() throws Exception {
		return sqlSession.selectOne("stockMapper.listcount");
	}

	@Override
	public void stockAdd(StockVO stockVO) throws Exception{
		sqlSession.insert("stockMapper.stockAdd", stockVO);
		
	}

	@Override
	public void stockModul(StockVO stockVO) throws Exception {
		sqlSession.update("stockMapper.stockModul", stockVO);
	}

	@Override
	public void stockDelete(StockVO stockVO) throws Exception {
		sqlSession.delete("stockMapper.stockDelete", stockVO);
	}

	@Override
	public List<StockVO> s_name_info() throws Exception {
		return sqlSession.selectList("stockMapper.s_name_info");
	}
	

	
	
}
