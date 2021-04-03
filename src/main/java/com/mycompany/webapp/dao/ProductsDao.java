package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Products;

@Mapper
public interface ProductsDao{
	public List<Products> selectAll();
	public List<Products> selectBestProduct();
	public List<Products> selectNewProduct();
	public List<Products> selectByPage(@Param("pager") Pager pager, @Param("cno") int cno);
	public List<Products> selectByBestPage(@Param("pager") Pager pager, @Param("cno") int cno);
	public List<Products> selectByNewPage(@Param("pager") Pager pager, @Param("cno") int cno);
	public int insert(Products product);
	public List<Products> selectByPno(int productNo);
	public int update(Products product);
	public int updatePhitcount(int productNo);
	public int updatePsellcount(int productNo);
	public int updateState(int productNo);
	public int deleteByPno(int productNo);
	public int count(int cno);
	public List<Products> selectBySearchPage(@Param("pager")Pager pager,@Param("keyword")String keyword);
	
	public int countKeyword(String keyword);
	
		
}
