package com.mycompany.webapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderProductsDao;
import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.dto.OrderProducts;

@Service
public class OrderProductsService {
	private static final Logger logger =
			LoggerFactory.getLogger(OrderProductsService.class);
	
	@Autowired
	private OrderProductsDao orderProductsDao;
	
	public void saveOrderProduct(OrderProducts orderProducts) {
		orderProductsDao.insert(orderProducts);
	}
	
	/*주문디테일*/
	public List<OrderProducts> getOrderDetail(int orderNo, String userId){
		List<OrderProducts> list = orderProductsDao.selectDetail(orderNo, userId);
        logger.info("상세디테일 서비스실행");
		return list;
	}

	public void updateReview(int orderNo, int productNo, String userId) {
		orderProductsDao.update(orderNo, productNo, userId);
	}
}
