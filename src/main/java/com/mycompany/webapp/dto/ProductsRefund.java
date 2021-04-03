package com.mycompany.webapp.dto;

import java.util.Date;

public class ProductsRefund {
	private int orderNo;	// 주문 번호
	private int refundState;	// 환불상태(0: 환불중, 1:환불완료)
	private Date refundDate;	// 환불 완료일
	private String refundReason;	// 환불 사유
	private Date orderDate;	// 주문 날짜
	private int amount;	// 주문 수량
	private String imgOname;
	private String imgSname;
	private String imgType;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getRefundState() {
		return refundState;
	}
	public void setRefundState(int refundState) {
		this.refundState = refundState;
	}
	public Date getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}
	public String getRefundReason() {
		return refundReason;
	}
	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
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
