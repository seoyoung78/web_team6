package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductsImg {
	
	private int imgNo;
	private MultipartFile[] battach;
	private int imgState;
	private String imgOname;
	private String imgSname;
	private String imgType;
	
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	
	public int getImgState() {
		return imgState;
	}
	public void setImgState(int imgState) {
		this.imgState = imgState;
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
	public MultipartFile[] getBattach() {
		return battach;
	}
	public void setBattach(MultipartFile[] battach) {
		this.battach = battach;
	}
	
	
	
	
}
