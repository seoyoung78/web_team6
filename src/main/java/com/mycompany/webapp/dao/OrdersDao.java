package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Orders;

@Mapper
public interface OrdersDao {

	public void createOrder(String userId, int orderNo);
	public void updateOrder(int orderNo);
	public void deleteOrder(int orderNo);
	public void insert(Orders orders);
	/*주문디테일*/
	public List<Orders> selectAll(String userId);
	
}
