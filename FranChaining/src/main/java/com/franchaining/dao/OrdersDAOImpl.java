package com.franchaining.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.franchaining.vo.OrdersVO;


@Repository
public class OrdersDAOImpl implements OrdersDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<OrdersVO> orders_history() throws Exception {
		return sqlSession.selectList("ordersMapper.order_history");
	}




}
