package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Reviews;

@Mapper
public interface ReviewsDao {
	public int insert(@Param("userId") String userId, @Param("orderNo") int orderNo, @Param("productNo") int productNo, @Param("reviewContent") String reviewContent);
	public List<Reviews> selectByPno(int productNo);
	public int deleteReview(@Param("reviewNo") int reviewNo, @Param("userId") String userID);
	public List<Reviews> selectByPage(@Param("productNo") int productNo, @Param("pager") Pager pager);
	public int count(int productNo);	
}
