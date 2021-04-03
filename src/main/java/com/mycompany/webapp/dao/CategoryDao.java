package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.dto.ProductsCategories;

@Mapper
public interface CategoryDao {
	public Products selectByCno(int categoryNo);
	public int insert(ProductsCategories category);
	public int update(ProductsCategories category);
	public int deleteByCno(int categoryNo);
}
