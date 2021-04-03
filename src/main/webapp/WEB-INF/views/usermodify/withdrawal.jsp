<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=application.getContextPath() %>/resources/css/withdrawal.css" rel="stylesheet" type="text/css"/>
<link href="<%=application.getContextPath() %>/resources/css/mypage.css" rel="stylesheet" type="text/css"/>
        


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
          <a href="<%=application.getContextPath()%>/user/changeinfo" class="mypage-tab">개인정보수정</a>
          <a href="<%=application.getContextPath()%>/user/withdrawal" class="mypage-tab-clicked">회원탈퇴</a>
          <a href="<%=application.getContextPath()%>/faq" class="mypage-tab">FAQ</a>
      </div>
  </div>
  
  
  <form method="post" action="<%=application.getContextPath()%>/user/withdrawal">
  	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
     <div id="withdraw-reason">
		<hr/>
        <h5 id="select-withdraw-reason-title">탈퇴사유를 선택해주세요.</h5>
		<hr/>
	        <div>
	            <input type="radio" name="delReason" value="one" checked> 상품 다양성/가격/품질에 불만족<br/>
	            <input type="radio" name="delReason" value="two"> 회원 특혜/쇼핑 혜택 부족<br/>
	            <input type="radio" name="delReason" value="three"> 쇼핑몰 이용 불편<br/>
	            <input type="radio" name="delReason" value="four"> 배송지연<br/>
	            <input type="radio" name="delReason" value="five"> 이용 빈도 낮음<br/>
	            <input type="radio" name="delReason" value="six"> 기타<br/>
	        </div>
        
     </div> <hr/>
     <div>
         <p id="withdraw-notice">
             정말 탈퇴하시겠습니까?<br/>
             (탈퇴 즉시 모든 구매내역 및 개인정보가 파기되며,<br>
             파기된 정보는 복구할 수 없습니다.)
         </p>
     </div> <hr/>
     <div id="withdraw-btn-div">
         <input
             type="submit"
             id="withdraw-btn"
             onclick="alert('탈퇴가 완료되었습니다.')"
             value="회원탈퇴">
		
		<input
             type="button"
             id="withdraw-btn"
             onClick="location.href='<%=application.getContextPath()%>/main'"
         	 value="취소">
         
     </div>
   </form>
  
<%@ include file="/WEB-INF/views/common/footer.jsp"%>


