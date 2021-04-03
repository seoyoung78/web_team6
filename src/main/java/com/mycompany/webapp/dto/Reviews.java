package com.mycompany.webapp.dto;

import java.util.Date;

public class Reviews {
	private int reviewNo;	//리뷰 번호
	private int orderNo;	//주문 번호
	private int productNo;	//상품 번호
	private String productName; //상품 이름
	private String userId;	//사용자 아이디
	private String reviewContent;	//리뷰 내용
	private Date reviewRegdate;		//리뷰 등록일
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewRegdate() {
		return reviewRegdate;
	}
	public void setReviewRegdate(Date reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}
}
