package com.mycompany.webapp.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;



@Mapper
public interface QnaDao{
	
	/*
	 * public List<Qna> selectAll();
	
	public List<Qna> selectByPage(Pager pager);
	
	public Qna selectByQnaNo(int qnaNo);
	
	public int update(Qna qna);
	*/
	
	public int insert(Qna qna);
	
	
	
	
}


