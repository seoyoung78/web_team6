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
                        <p>회원가입</p>
                    </div>
                </div>
                <div class="container-signup">

                    <div class="d-flex justify-content-center container">
                        <div class="card-signup">

                            <!-- 회원가입 헤더 -->
                            <div class="card-header">
                                <h6>SIGN-UP</h6>
                            </div>

                            <!-- 회원가입 바디 -->
                            <div class="card-body">
                            
                                <form id="joinForm" name="joinForm" method="post" action="<%=application.getContextPath()%>/signup" onsubmit="joinValidate()">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
  									<div id="errorSsn" class="error"></div>
                                    <!-- 이메일 인증 진행 email.js 파일 -->
                                    <div class="input-group form-group" style="margin-bottom:0;">
                                        <input type="text" id="userId" name="userId" class="form-control" placeholder="이메일 아이디">
                                        <input
                                            type="button"
                                            class="btn btn-primary form-control signup-btn"
                                            value="이메일 인증">
                                    </div>
									<div id="errorId" class="error"></div>
									
									
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
                                    
                                     <div class="input-group form-group" style="margin-bottom:0;">
                                        <input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="전화번호('-'없이 작성)">
                                   	 </div>
                                   	 <div id="errorPhone" class="error"></div>

                                    <!-- 우편번호 찾기 post.js 파일 -->
                                    <div class="input-group form-group" style="margin-bottom:0;">
                                        <div>
                                            <input
                                                type="text"
                                                id="sample4_postcode"
                                                class="form-control"
                                                name="zipCode"
                                                placeholder="우편번호"
                                                readonly="readonly">
                                            <input
                                                type="button"
                                                class="form-control signup_btn"
                                                value="우편번호 찾기"
                                                onclick="excution_daum_address()">
                                            <br>
                                        </div>

                                        <div>
                                        	<input
	                                            type="text"
	                                            id="sample4_roadAddress"
	                                            class="form-control"
	                                            name="roadAddress"
	                                            placeholder="도로명주소"
	                                            readonly="readonly">
                                        </div>
                                        <div>
                                        	<input
	                                            type="text"
	                                            id="sample4_detailAddress"
	                                            class="form-control"
	                                            name="detailAddress"
	                                            placeholder="상세주소">
	                                            <span id="errorDetailAddress" class="error"></span>  
	                                    </div>
	                                  
                                    </div>
                                   

                                    <!-- 환불용 계좌번호 입력 -->
                                    <div class="input-group form-group" style="margin-bottom:0;">
                                        <input type="text" class="form-control"  id="userAccount" name="userAccount"placeholder="계좌번호('-'없이 작성)">
                                    </div>
                                    <div id="errorAccount" class="error"></div>
                                    <div class="input-group form-group" style="margin-bottom:0;">
                                        <input type="text" class="form-control" id="userBank" name="userBank" placeholder="은행명">
                                    </div>
                                    <div id="errorBank" class="error"></div>

                                    <div class="input-group form-group" style="margin-bottom:0;">
                                        <input type="text" class="form-control" id="accountName" name="accountName" placeholder="예금주">
                                    </div>
                                    <div id="errorAccountName" class="error"></div>
                                    <div class="form-group">
                                        <hr/>
                                        <input
                                            type="submit"
                                            value="회원가입"
                                            id="saveUser"
                                            class="btn float-right signup-btn-complete"
                                            >
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
			<!-- 다음 주소 연동 -->
			    function excution_daum_address(){
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    //주소변수 문자열과 참고항목 문자열 합치기
			                    addr += extraAddr;
			                } else {
			                    addr += ' ';
			                }
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                $("#sample4_postcode").val(data.zonecode);
			                $("#sample4_roadAddress").val(addr);
			                // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
			                $("#sample4_detailAddress").attr("readonly", false);
			                $("#sample4_detailAddress").focus();
			            }
			        }).open();
			    }
			</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>


