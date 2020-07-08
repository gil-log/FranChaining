package com.franchaining.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.franchaining.vo.RegVO;
import com.franchaining.vo.StockVO;

@Repository
public class StockDAOImpl implements StockDAO{

	@Inject 
	private SqlSession sqlSession;
	
	@Override
	public List<StockVO> stockcenterlist() throws Exception{
		return sqlSession.selectList("stockMapper.stockcenterlist");
	}

	@Override
	public void register(RegVO regVO) throws Exception {
		//담에 지움.
	}
	
	@Override
	public List<StockVO> stocklist() throws Exception{
		return sqlSession.selectList("stockMapper.stockList");
	}
	
}
