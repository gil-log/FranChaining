package com.franchaining.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.franchaining.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO{

	@Inject 
	private SqlSession sqlSession;
	
	@Override
	public List<OrderVO> orderList() throws Exception {
		return sqlSession.selectList("orderMapper.orderlist");
	}

	@Override
	public List<OrderVO> viewList() throws Exception {
		return sqlSession.selectList("orderMapper.viewlist");
	}
	
	

	
	
}
