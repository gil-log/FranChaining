package com.franchaining.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.franchaining.vo.OrdersVO;
import com.franchaining.vo.OrderslistVO;

@Repository
public class OrdersDAOImpl implements OrdersDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<OrderslistVO> ordersList(OrdersVO ordersVO) throws Exception {
		return sqlSession.selectList("ordersMapper.ordersList", ordersVO);
	}

	@Override
	public int listCount(OrdersVO ordersVO) throws Exception {
		return sqlSession.selectOne("ordersMapper.listCount", ordersVO);
	}

}
