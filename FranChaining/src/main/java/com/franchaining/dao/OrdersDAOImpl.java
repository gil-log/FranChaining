package com.franchaining.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.franchaining.vo.OrdersVO;
import com.franchaining.vo.OrderslistVO;
import com.franchaining.vo.StockVO;

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

	@Override
	public List<OrderslistVO> showOrders(int o_no) throws Exception {
		return sqlSession.selectList("ordersMapper.showOrders", o_no);
	}

	@Override
	public int showlistCount(int o_no) throws Exception {
		return sqlSession.selectOne("ordersMapper.showlistCount", o_no);
	}

	@Override
	public void ordersApply(OrdersVO ordersVO) throws Exception {
		System.out.println("dao");
		sqlSession.update("ordersMapper.ordersApply", ordersVO);
	}

	@Override
	public void ordersDelete(OrdersVO ordersVO) throws Exception {
		sqlSession.update("ordersMapper.ordersDelete",ordersVO);
	}

	@Override
	public void stockGoneOrdersDelete(StockVO stockVO) throws Exception {
		sqlSession.delete("ordresMapper.stockGoneOrdersDelete", stockVO);
	}

}
