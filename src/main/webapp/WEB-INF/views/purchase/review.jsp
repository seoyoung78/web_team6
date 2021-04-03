<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/purchaseList.css" rel="stylesheet" type="text/css"/>
        <link href="<%=application.getContextPath() %>/resources/css/mypage.css" rel="stylesheet" type="text/css"/>


<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/review.js"></script>

  <!-- 컨텐츠 -->
  <div >
	   <!-- 마이페이지 타이틀 -->
	  <div >
	      <h3 id="mypageTitle">MY PAGE</h3>
	  </div>

      <!-- 마이페이지 탭 목록 -->
      <div id="mypageList">
          <a href="<%=application.getContextPath()%>/user/purchaselist" class="mypage-tab-clicked">구매내역</a>
          <a href="<%=application.getContextPath()%>/user/wishlist" class="mypage-tab">위시리스트</a>
          <a href="<%=application.getContextPath()%>/user/changeinfo" class="mypage-tab">개인정보수정</a>
          <a href="<%=application.getContextPath()%>/user/withdrawal" class="mypage-tab">회원탈퇴</a>
          <a href="<%=application.getContextPath()%>/user/faq" class="mypage-tab">FAQ</a>
      </div>
  </div>

	<!-- 리뷰 작성 -->
   <div class="container-fluid border">
       <h3 id="mypageTitle-under">리뷰 작성</h3>
       <hr/>
       
       <form method="post" action="<%=application.getContextPath()%>/user/createreview">
       		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
       		<div class="card-body">
              <div class="input-group form-group">
              		<a>주문 번호 : ${orderNo}</a>
                  <input type="hidden" name="orderNo" value="${orderNo}" readonly>
              </div>
              <div class="input-group form-group">
                  <a>상품 번호 : ${productNo}</a>
                  <input type="hidden" name="productNo" value="${productNo}" readonly>
              </div>

              <!-- 한 줄 평 작성-->
              <div class="input-group form-group">
                  <input type="text" class="form-control" id="review-write" placeholder="한 줄 평 작성 (30자 이내)" name="reviewContent" maxlength='30' required>
              </div>
          </div>

          <div class="card-footer-review">
              <div class="card-review-footer">
              	<button id="review-submit-btn">게시</button>              	                        
              </div>
          </div>
       </form>
 
   </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


