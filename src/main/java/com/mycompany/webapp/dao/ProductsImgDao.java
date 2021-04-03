package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.dto.ProductsImg;

@Mapper
public interface ProductsImgDao {
	public List<ProductsImg> selectAll();
	public Products selectByImgno(int imgNo);
	public int insert(ProductsImg productImg);
	public int update(ProductsImg productImg);
	public int deleteByImgno(int imgNo);
	public int count();
}
