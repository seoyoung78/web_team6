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

	<!-- 구매내역 -->
   <div class="container-fluid border">
       <h3 id="mypageTitle-under">구매내역</h3>
       <hr/>
       
       <c:forEach var="order" items="${list}">
       	<form method="post" action="<%=application.getContextPath()%>/user/exchangerefund?orderNo=${order.orderNo}">
       		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
       		<div class="row purchaseContent">
		           <div class="col purchase-details">
		               <input type="hidden" name="orderNo" value="${order.orderNo}">	               
		               <p>주문일자 : <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd"/></p>
		               <p>주문번호 : ${order.orderNo}</p>
		               <p>주문가격 : ${order.allPrice}</p>
		               <p>선택옵션 : 단일품목</p>
		           </div>
		           
		           <div class="col">
		               <a href="<%=application.getContextPath()%>/user/purchaseListDetail?orderNo=${order.orderNo}" class="exchange-btn">주문상세정보</a>
		           </div>
           		 <div class="col">
           			 <button class="exchange-btn" type="submit">교환/환불/구매취소</button>		               	
           		 </div>
		       </div>
       	</form>

       </c:forEach>

	<!--페이지 넘어가는 부분-->
	  <div class="pagination-purchase">
	      <nav aria-label="Page navigation example">
	          <ul class="pagination">
	              <li class="page-item">
	                  <a class="page-link" href="#" aria-label="Previous">
	                      <span aria-hidden="true">&laquo;</span>
	                  </a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#">1</a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#">2</a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#">3</a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#">4</a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#">5</a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#" aria-label="Next">
	                      <span aria-hidden="true">&raquo;</span>
	                  </a>
	              </li>
	          </ul>
	      </nav>
	  </div>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


