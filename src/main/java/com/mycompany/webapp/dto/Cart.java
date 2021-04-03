package com.mycompany.webapp.dto;

import java.util.Date;

public class Cart {
	private int productNo;		//상품 번호
	private String userId;		//사용자 아이디
	private int amount;			//구매 수량
	private int allPrice;		//총 구매 가격
	private Date regdate;		//카트 등록일
	private String productName;	//상품 이름
	private int price;			//상품 가격
	private String imgOname;	//상품 이미지
	private String imgSname;
	private String imgType;
		
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getAllPrice() {
		return allPrice;
	}
	public void setAllPrice(int allPrice) {
		this.allPrice = allPrice;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImgOname() {
		return imgOname;
	}
	public void setImgOname(String imgOname) {
		this.imgOname = imgOname;
	}
	public String getImgSname() {
		return imgSname;
	}
	public void setImgSname(String imgSname) {
		this.imgSname = imgSname;
	}
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
}
