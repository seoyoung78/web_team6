package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.OrderProducts;

@Mapper
public interface OrderProductsDao {

	public void insert(OrderProducts orderProducts);
	public List<OrderProducts> selectDetail(@Param("orderNo") int orderNo, @Param("userId") String userId);
	public void update(@Param("userId") String userId, @Param("orderNo") int orderNo, @Param("productNo") int productNo);
}
