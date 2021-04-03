package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductsRefundDao;
import com.mycompany.webapp.dto.ProductsRefund;

@Service
public class ProductsRefundService {
	@Autowired
	private ProductsRefundDao refundDao;
	
	public List<ProductsRefund> getRefund(int orderNo) {
		List<ProductsRefund> list = refundDao.selectAll(orderNo);
		return list;
	}

	public void saveRefund(int orderNo) {
		refundDao.insert(orderNo);
	}

	public void updateRefund(int orderNo, String refundReason) {
		refundDao.update(orderNo, refundReason);
	}
	
	/*public void saveReview(ProductsRefund refund) {
		refundDao.insert(refund);
	}
	
	public void updateRefund(ProductsRefund refund) {
		refundDao.update(refund);
	}*/
}
