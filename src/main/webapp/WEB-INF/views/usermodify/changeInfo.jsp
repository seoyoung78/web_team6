<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/mypage.css" rel="stylesheet" type="text/css"/>
        <link href="<%=application.getContextPath() %>/resources/css/changeInfo.css" rel="stylesheet" type="text/css"/>
        <link href="<%=application.getContextPath() %>/resources/css/login.css" rel="stylesheet" type="text/css"/>
		<script src="<%=application.getContextPath() %>/resources/js/user/changeInfoValidate.js"></script>
	
		 
  <!-- 컨텐츠 -->
  <div >
	   <!-- 마이페이지 타이틀 -->
	  <div >
	      <h3 id="mypageTitle">MY PAGE</h3>
	  </div>

      <!-- 마이페이지 탭 목록 -->
       <div id="mypageList">
          <a href="<%=application.getContextPath()%>/user/purchaselist" class="mypage-tab">구매내역</a>
          <a href="<%=application.getContextPath()%>/user/wishlist" class="mypage-tab">위시리스트</a>
          <a href="<%=application.getContextPath()%>/user/changeinfo" class="mypage-tab-clicked">개인정보수정</a>
          <a href="<%=application.getContextPath()%>/user/withdrawal" class="mypage-tab">회원탈퇴</a>
          <a href="<%=application.getContextPath()%>/faq" class="mypage-tab">FAQ</a>
      </div>
  </div>
	<form onsubmit="changeInfoValidate()">
    <%-- <form id="changeForm" name="changeForm" method="post" action="<%=application.getContextPath()%>/user/changeinfo" onsubmit="changeInfoValidate()"> --%>
    	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		  <div >
		      <h3 id="mypageTitle-under">개인정보수정</h3>
		      <hr/>
		      <table id="changeTable">
		          <tr>
		              <th>
		                  <label for="userName">이름*</label>
		              </th>
		              <td><input type="text" value="${user.userName}" id="userName" name="userName" class="name" required="required"></td>
		              <td id="errorName" class="error"></td>
		          </tr>
		          <tr>
		              <th>
		                  <label for="userId">아이디*</label>
		              </th>
		              <input type="hidden" value="${user.userId}" id="userId" name="userId">
		              <td>${user.userId}</td>
		          </tr>
		          <tr>
		              <th>
		                  <label for="userPassword">비밀번호*</label>
		              </th>
		              <td><input type="password" id="userPassword" name="userPassword" minlength="4" maxlength="16">
		                  <small>*비밀번호는 4~16자리로 입력해주세요.</small>
		              </td>
		          </tr>
		          <tr>
		              <th>
		                  <label for="check_pw">비밀번호확인*</label>
		              </th>
		              <td>
		              	<input type="password" id="userPasswordCk" name="userPasswordCk" minlength="4" maxlength="16">
		              	 <input type="button" id="checkPassword" name="checkPassword" class="btn btn-info btn-sm"  value="비밀번호 확인" onclick="passwordCk()">
		              </td>
		            
		          </tr>
		          <tr>
		          		<th></th>
		          		<td>
		          			<div id="errorPassword" class="error"></div>
		          			<div id="nonSamePassword" class="error"></div>
		          			<div id="SamePassword" class="success"></div>
		          		</td>
		          </tr>
		          <tr>
		              <th rowspan="3">
		                  <label for="address">주소*</label>
		              </th>
		              <td>
		                  <!-- 우편번호 찾기 post.js 파일 -->
		
		                  <div>
		                      <input
		                          type="text"
		                          id="zipCode"
		                          class="form-control"
		                          name="zipCode"
		                          placeholder="우편번호"
		                          readonly="readonly">
		                      <input
		                          type="button"
		                          onclick="excution_daum_address()"
		                          class="form-control signup_btn"
		                          value="우편번호 찾기">
		                      <br>
		                  </div>
		
		                  <div><input
		                      type="text"
		                      id="roadAddress"
		                      class="form-control"
		                      name="roadAddress"
		                      placeholder="도로명주소"
		                      readonly="readonly"></div>
		                  <div><input
		                      type="text"
		                      id="sample4_detailAddress"
		                      name="detailAddress"
		                      class="form-control"
		                      placeholder="상세주소"></div>
		                      <span id="errorDetailAddress" class="error"></span>  
		              </td>
		          </tr>
		          <tr>
		              
		          </tr>
		          <tr>
		             
		          </tr>
		          <tr>
		              <th>
		                  <label for="phoneNum">휴대전화*</label>
		              </th>
		              <td>
		                  <input type="text" id="userPhone" name="userPhone">
		              </td>
		          </tr>
		          <tr>
		          	<th></th>
		          	<td id="errorPhone" class="error"></td>
		          </tr>
		          
		      </table>
		  </div>
  
  <div>
      <input
          type="submit"
          style="background-color: #d15851; color: #f3f3f3;"
          class="btn changebtn"
          value="저장하기"
          style="color:#f3f3f3"
          >
  </div>
  
  </form>
  
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
			                $("#zipCode").val(data.zonecode);
			                $("#roadAddress").val(addr);
			                // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
			                $("#sample4_detailAddress").attr("readonly", false);
			                $("#sample4_detailAddress").focus();
			            }
			        }).open();
			    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


