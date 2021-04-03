package com.mycompany.webapp.dto;

import java.util.Date;

public class Wishlist {
	
	private String userId;
	private int productNo;
	private Date regdate;
	
	private String productName;	
	private String imgSname;
	
	private String imgType;
	
	
	
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getImgSname() {
		return imgSname;
	}

	public void setImgSname(String imgSname) {
		this.imgSname = imgSname;
	}
	
}
