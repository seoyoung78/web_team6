package com.mycompany.webapp.dto;

import java.util.Date;

public class Qna {
	
	private int qnaNo;
	private String userId;
	private String email;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaRegdate;
	private String answerState;
	private String answerContent;
	private Date answerDate;
	
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public Date getQnaRegdate() {
		return qnaRegdate;
	}
	public void setQnaRegdate(Date qnaRegdate) {
		this.qnaRegdate = qnaRegdate;
	}
	
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public Date getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}
	public String getAnswerState() {
		return answerState;
	}
	public void setAnswerState(String answerState) {
		this.answerState = answerState;
	}
	
	
	
	

}
