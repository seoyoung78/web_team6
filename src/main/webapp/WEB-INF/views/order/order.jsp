<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/order.css" rel="stylesheet" type="text/css"/>

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


  <!-- 컨텐츠 -->
        <div class="login-content">
            <div class="container-fluid">
                <div class="login-wrapper">
                    <div class="login-path">
                        <p>주문</p>
                    </div>
                </div>
                <div class="container-order">
                    <div class="d-flex justify-content-center container">

						<form method="post" action="<%=application.getContextPath()%>/user/ordercomplete">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              <!-- 수령인 관련 정보입력 카드
              ======================================================================== -->
              <div class="card-order">
                <div class="card-header">
                    <h6>수령인</h6>
                </div>
                <div class="card-body">                	
             		  <div class="input-group form-group">
                     <!-- 주소입력 -->
                     <div>
                         <input
                             type="text"
                             id="sample4_postcode"
                             name="zipCode"
                             class="form-control"
                             placeholder="우편번호"
                             readonly="readonly"
                             required="required">
                         <input
                             type="button"
                             onclick="excution_daum_address()"
                             class="form-control find_btn"
                             value="우편번호 찾기">
                         <br>
                     </div>
                     <div><input
                         type="text"
                         id="sample4_roadAddress"
                         name="roadAddress"
                         class="form-control"
                         placeholder="도로명주소"
                         readonly="readonly"
                         required="required"></div>
                     <div><input
                         type="text"
                         id="sample4_detailAddress"
                         name="detailAddress"
                         class="form-control"
                         placeholder="상세주소"
                         required="required"></div>
                   </div>
                </div>
             	</div>

              <!-- 결제방법 카드
              ======================================================================== -->
              <div class="card-order">
                  <div class="card-header">
                      <h6>결제방법-무통장입금</h6>
                  </div>
                  <div class="card-body">
                          <!-- 산타캔디의 입금전용 계좌 고정값-->
                          <div class="input-group form-group">
                              <label class="align-self-center" id="accountlabel">입금하실 계좌번호</label>
                              <input
                                  type="text"
                                  class="form-control"
                                  placeholder="202100-00-000000"
                                  readonly="readonly">
                          </div>

                          <div class="input-group form-group">
                              <label class="align-self-center" id="accountlabel">예금주</label>
                              <input type="text" class="form-control" placeholder="송파은행" readonly="readonly">
                          </div>
                          <div class="input-group form-group">
                              <label class="align-self-center" id="accountlabel">은행명</label>
                              <input type="text" class="form-control" placeholder="산타캔디" readonly="readonly">
                          </div>

                          <div>
                              <h6>※ 위 계좌로 결제 금액을 입금하시면, 확인 후 2~3일 내에 배송이 시작됩니다.</h6>
                          </div>
                  </div>
              </div>

              <!-- 결제 금액 및 배송비 카드 -->
              <div class="card-order">
                  <div class="card-header">
                      <h6>결제금액</h6>
                  </div>
                  <div class="row card-body">
                      <table class="table">
                          <thead>
                              <tr>
                                  <th>항목</th>
                                  <th>금액</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <!-- 상품 금액 받아옴 -->
                                  <td>상품 금액</td>
                                  <td>
                                      <p>${sum}원</p>
                                  </td>
                              </tr>

                              <tr>
                                  <td>배송비</td>
                                  <td><c:set var="delivery" value="3000"/>${delivery}원</td>
                              </tr>

                              <tr>
                                  <td>총 결제금액</td>
                                  <td><c:set var="allPrice" value="${sum+delivery}"/>${allPrice}원</td>
                              </tr>
                          </tbody>
                      </table>
                      <!--
                      *************************************************************************************************************-->

                      <!-- 결제약관 동의 체크박스 추후 결제약관 동의 관련 order.js 파일에 추가 예정-->
                      <div class="row form-group remember" style="margin-left:30px;">
                          <input type="checkbox" id="agree-pay" required> 결제 및 이용약관에 동의합니다.
                      </div>

                      <!-- 구매확정 창으로 넘어가기 위한 버튼 -->
                      <div class="form-group pay_btn_div">
                      	<input type="hidden" name="allPrice" value="${allPrice}">
                        <button type="submit" class="btn btn-primary" id="pay-btn">결제하기</button>
                      </div>

                    </div>
                </div>
							</form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>