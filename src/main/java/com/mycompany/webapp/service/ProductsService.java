package com.mycompany.webapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.controller.ProductController;
import com.mycompany.webapp.dao.CategoryDao;
import com.mycompany.webapp.dao.ProductsDao;
import com.mycompany.webapp.dao.ProductsImgDao;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.dto.ProductsImg;

@Service
public class ProductsService {
	private static final Logger logger =
			LoggerFactory.getLogger(ProductsService.class);
	
	@Autowired
	private ProductsDao productsDao;
	
	@Autowired
	private ProductsImgDao productsImgDao;
	
	@Autowired
	private CategoryDao categoryDao;

	
	public int getTotalCount(int cno) {
		int total = productsDao.count(cno);
		return total;
	}

	public List<Products> getProductsList(Pager pager, int cno) {
		List<Products> list = productsDao.selectByPage(pager, cno);
		return list;
	}
	public List<Products> getProductsNewList(Pager pager, int cno) {
		List<Products> list = productsDao.selectByNewPage(pager, cno);
		return list;
	}

	public List<Products> getProductsBestList(Pager pager, int cno) {
		List<Products> list = productsDao.selectByBestPage(pager, cno);
		return list;
	}
	

	public int insertImg(ProductsImg productImg) {
		int result = productsImgDao.insert(productImg);
		return result;
	}

	public List<Products> getProductDetail(int productNo) {
		List<Products> list = productsDao.selectByPno(productNo);
		return list;
	}

	public List<Products> getBestProductList() {
		List<Products> list = productsDao.selectBestProduct();		
		return list;
	}

	public List<Products> getNewProductList() {
		List<Products> list = productsDao.selectNewProduct();
		return list;
	}

	public void addHitCount(int productNo) {
		productsDao.updatePhitcount(productNo);
	}

	public int getTotalRows(String keyword) {
		int rows = productsDao.countKeyword(keyword);
		return rows;
	}
	
	public List<Products> getProductsSearchListPager(Pager pager,String keyword){
		List<Products> list = productsDao.selectBySearchPage(pager,keyword);
		return list;
	}	
	
}
