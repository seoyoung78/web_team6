package com.mycompany.webapp.dto;

import java.util.Date;

public class Users {
	// 개인정보관련
	private String userId; // 회원번호(P)
	private String userName;
	private String userPassword;
	private String userPhone;
	private int userSsn1; // 생년월일
	private int userSsn2; // 주민번호 뒷자리

	// 주소관련
	private int zipCode;
	private String roadAddress;
	private String detailAddress;

	// 가입관련
	private Date userRegdate; // 가입일

	// 탈퇴관련
	private int deleteState; // 탈퇴상태
	private Date deleteDate; // 탈퇴일
	private String deleteReason; // 탈퇴사유

	// 로그인관련
	private int userEnabled; // 로그인상태
	private String userAuthority; // 권한

	// 계좌관련
	private String userAccount; // 계좌번호
	private String userBank; // 은행명
	private String accountName; // 예금주
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getUserSsn1() {
		return userSsn1;
	}
	public void setUserSsn1(int userSsn1) {
		this.userSsn1 = userSsn1;
	}
	public int getUserSsn2() {
		return userSsn2;
	}
	public void setUserSsn2(int userSsn2) {
		this.userSsn2 = userSsn2;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public Date getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(Date userRegdate) {
		this.userRegdate = userRegdate;
	}
	public int getDeleteState() {
		return deleteState;
	}
	public void setDeleteState(int deleteState) {
		this.deleteState = deleteState;
	}
	public Date getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}
	public String getDeleteReason() {
		return deleteReason;
	}
	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}
	public int getUserEnabled() {
		return userEnabled;
	}
	public void setUserEnabled(int userEnabled) {
		this.userEnabled = userEnabled;
	}
	public String getUserAuthority() {
		return userAuthority;
	}
	public void setUserAuthority(String userAuthority) {
		this.userAuthority = userAuthority;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserBank() {
		return userBank;
	}
	public void setUserBank(String userBank) {
		this.userBank = userBank;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	

}
