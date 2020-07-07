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
	public StockVO stockinfo(StockVO stockVO) throws Exception {
		return sqlSession.selectOne("stockMapper.stockinfo", stockVO);
	}

	@Override
	public List<StockVO> s_name_info() throws Exception {
		return sqlSession.selectList("stockMapper.s_name_info");
	}

	
	
	
}
