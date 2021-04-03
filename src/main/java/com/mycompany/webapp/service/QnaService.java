package com.mycompany.webapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.QnaDao;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;

@Service
public class QnaService{
	
	private static final Logger logger = LoggerFactory.getLogger(QnaService.class);
	
	@Autowired
	private QnaDao qnaDao;
	
	/*	public List<Qna> getQnaList() {
			List<Qna> list = qnaDao.selectAll();
			return list;
		}	
		
		public Qna getQna(int qnaNo) {
			Qna qna = qnaDao.selectByQnaNo(qnaNo);
			
			return qna;
		}
	
		public void updateQna(Qna qna) {
			qnaDao.update(qna);
			
		}
	
		public List<Qna> getQna(Pager pager) {
			List<Qna> list = qnaDao.selectByPage(pager);
			
			return list;
		}*/
	
	public void insertFaq(Qna qna) {
		
		qnaDao.insert(qna);
	}

	
}