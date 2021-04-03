<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/signup.css" rel="stylesheet" type="text/css"/>


<script src="<%=application.getContextPath() %>/resources/js/user/joinValidate.js"></script> 

  <!-- 컨텐츠 -->
         <div class="signup-content">
            <div class="container-fluid">
                <div class="login-wrapper">
                    <div class="login-path">
                        <p>비밀번호 변경</p>
                    </div>
                </div>
                <div class="container-signup">

                    <div class="d-flex justify-content-center container">
                        <div class="card-signup">

                            
                            <div class="card-header">
                                <h6>비밀번호 변경</h6>
                            </div>

                            <!-- 바디 -->
                            <div class="card-body">
                                <form id="changeForm" name="changeForm" method="post" action="<%=application.getContextPath()%>/changepassword" onsubmit="changePwValidate()">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                
                                 	<div class="input-group form-group" style="margin-bottom:0;">
                                        <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
                                    </div>
                                    <div id="errorId" class="error"></div>
                                    <div class="input-group form-group" style="margin-bottom:0;">
                                        <input type="text" class="form-control" id="userName" name="userName" placeholder="이름">
                                    </div>
                                    <div id="errorName" class="error"></div>
                                    <div class="input-group form-group" style="margin-bottom:0;">
	                                    <div>
	                                        <input type="text" id="userSsn1" name="userSsn1" class="form-control" placeholder="주민번호 앞자리">
	                                    </div>
	                                    -
                                        <div>
                                            <input type="password" id="userSsn2" name="userSsn2" class="form-control" placeholder="주민번호 뒷자리">
                                        </div>
                                    </div>
                                     <div style="margin-top:1%;">
                                            <input
                                                type="button"
                                                id="checkPassword"
                                                class="btn btn-primary form-control signup-btn"
                                                value="회원 확인"
                                               	onclick="passwordCk()">
                                        </div>
                                
  									<div id="errorSsn" class="error"></div>
                                    
									
                                    <!-- 비밀번호 확인 진행 password.js 파일 -->
                                    <div class="input-group form-group" style="margin-bottom:0;">
                                        <div>
                                            <input type="password" id="userPassword" name="userPassword" class="form-control" placeholder="비밀번호">
                                        </div>
                                        <div>
                                            <input type="password" id="userPasswordCk" name="userPasswordCk" class="form-control" placeholder="비밀번호 재입력">
                                        </div>
                                        <div>
                                            <input
                                                type="button"
                                                id="checkPassword"
                                                class="btn btn-primary form-control signup-btn"
                                                value="비밀번호 확인"
                                               	onclick="passwordCk()">
                                        </div>
                                    </div>
                                     <div id="nonSamePassword" class="error"></div>
                                     <div id="SamePassword" class="success"></div>
                                     <div id="errorPassword" class="error"></div>
                                    
                                   


                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
         
<%@ include file="/WEB-INF/views/common/footer.jsp"%>


