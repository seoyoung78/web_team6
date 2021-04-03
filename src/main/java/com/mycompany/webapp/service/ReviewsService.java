package com.mycompany.webapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ReviewsDao;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Reviews;

@Service
public class ReviewsService {
	private static final Logger logger =
			LoggerFactory.getLogger(ReviewsService.class);
	
	@Autowired
	private ReviewsDao reviewsDao;
	
	public List<Reviews> getReview(int productNo) {
		List<Reviews> list = reviewsDao.selectByPno(productNo);
		return list;
	}
	
	public void saveReview(String userId, int orderNo, int productNo, String reviewContent) {
		reviewsDao.insert(userId, orderNo, productNo, reviewContent);
	}

	public void deleteReview(int reviewNo, String userId) {
		logger.info(userId);
		reviewsDao.deleteReview(reviewNo, userId);
	}

	/*public int getTotalRows(String userID) {
		int rows = reviewsDao.count(userID);
		return rows;
	}*/
}
