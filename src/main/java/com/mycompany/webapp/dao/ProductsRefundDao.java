package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.ProductsRefund;



@Mapper
public interface ProductsRefundDao {
	public List<ProductsRefund> selectAll(int orderNo);
	public int insert(ProductsRefund productsefund);
	public int update(ProductsRefund productsrefund);
	public void insert(int orderNo);
	public void update(@Param("orderNo") int ono, @Param("refundReason") String refundReason);
}