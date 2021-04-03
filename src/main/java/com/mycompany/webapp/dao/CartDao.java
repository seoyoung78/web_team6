package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface CartDao {
	public List<Cart> selectAll(String userId);
	//public List<Cart> selectByPage(@Param("pager") Pager pager, @Param("userId") String userId);
	public int insert(Cart cart);
	public int deleteCart(@Param("productNo") int productNo, @Param("userId") String userId);
	public int count(String userId);
	public void updateCart(Cart cart);
}
