<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=application.getContextPath() %>/resources/css/mypage.css" rel="stylesheet" type="text/css"/>
<link href="<%=application.getContextPath() %>/resources/css/faq.css" rel="stylesheet" type="text/css"/>


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
          <a href="<%=application.getContextPath()%>/user/withdrawal" class="mypage-tab">회원탈퇴</a>
          <a href="<%=application.getContextPath()%>/faq" class="mypage-tab-clicked">FAQ</a>
      </div>
  </div>

  <div class="container-fluid">
  
  
			<!-- FAQ -->
             <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="accordion" id="accordionExample">
                        <h3 style="text-align: center;">FAQ</h3>
                        <div class="card">
                            <div class="card-header" id="headingOne">
								<h2 class="clearfix mb-0">

									<!-- data-target을 통해 내용물이 연결되게 함 -->
									<!-- 처음 기본값은 aria-expended를 false로 default해서 닫혀있게 설정 -->
                                    <a
                                        class="btn btn-link"
                                        data-toggle="collapse"
                                        data-target="#collapseOne"
                                        aria-expanded="false"
                                        aria-controls="collapseOne">[반품]반품 교환 정책은 무엇입니까?
                                        <i class="material-icons">add</i>
                                    </a>
                                </h2>
                            </div>
                            <div
                                id="collapseOne"
                                class="collapse show"
                                aria-labelledby="headingOne"
                                data-parent="#accordionExample">
                                <div class="card-body">어쩌구저쩌구</div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingTwo">
                                <h2 class="mb-0">
                                    <a
                                        class="btn btn-link collapsed"
                                        data-toggle="collapse"
                                        data-target="#collapseTwo"
                                        aria-expanded="false"
                                        aria-controls="collapseTwo">[배송] 주문한 상품이 일부만 도착했어요
                                        <i class="material-icons">add</i>
                                    </a>
                                </h2>
                            </div>
                            <div
                                id="collapseTwo"
                                class="collapse"
                                aria-labelledby="headingTwo"
                                data-parent="#accordionExample">
                                <div class="card-body">Anim par3 wolf mo eiusm nulla assumenda shoreditch et.</div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingThree">
                                <h2 class="mb-0">
                                    <a
                                        class="btn btn-link collapsed"
                                        data-toggle="collapse"
                                        data-target="#collapseThree"
                                        aria-expanded="false"
                                        aria-controls="collapseThree">[환불] 상품 불량, 오배송 환불
                                        <i class="material-icons">add</i>
                                    </a>
                                </h2>
                            </div>
                            <div
                                id="collapseThree"
                                class="collapse"
                                aria-labelledby="headingThree"
                                data-parent="#accordionExample">
                                <div class="card-body">Lorem ipsum dolor sit amet, consectetur adipiscing elit. sagittlum.</div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingFour">
                                <h2 class="mb-0">
                                    <a
                                        class="btn btn-link collapsed"
                                        data-toggle="collapse"
                                        data-target="#collapseFour"
                                        aria-expanded="false"
                                        aria-controls="collapseFour">[배송] 잘못된 주소를 입력했습니다. 어떻게 해야 할까요?<i class="material-icons">add</i>
                                    </a>
                                </h2>
                            </div>
                            <div
                                id="collapseFour"
                                class="collapse"
                                aria-labelledby="headingFour"
                                data-parent="#accordionExample">
                                <div class="card-body">Anim pariatur cl on it squid single-origin coffee nulla assumenda shoreditch et.</div>
                            </div>
                        </div>

                        <br/>
                        <br/>


						<!-- Q&A -->
                        <h3 style="text-align: center;">Q&A</h3>


						<!-- form 태그의 action, post, target 기능을 사용해 Q&A 내용을 서버로 전송할 예정 -->
                        <form action="qna" method="POST" >
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text bg-white">
                                                    <i class="fa fa-user"></i>&nbsp
                                                </span>
                                            </div>
                                            <input
                                                name="userId"
                                                type="email"
                                                placeholder="회원아이디"
                                                class="form-control border-left-0"
                                                required="required"
                                               
                                                />
                                        </div>
                                    </div>
                                </div>
                               <div class="col">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text bg-white">
                                                    <i class="fa fa-envelope"></i>
                                                </span>
                                            </div>
                                            <input
                                                name="email"
                                                type="email"
                                                placeholder="이메일"
                                                class="form-control border-left-0"
                                                required="required"
                                             
                                                >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text bg-white">
                                                    <i class="fa fa-envelope"></i>
                                                </span>
                                            </div>
                                            <input
                                                name="qnaTitle"
                                                type="text"
                                                placeholder="제목"
                                                class="form-control border-left-0"
                                                required="required"
                                                >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea
                                    class="form-control"
                                    id="qnaContent"
                                    name="qnaContent"
                                    rows="5"
                                    placeholder="Enter message"
                                    required="required"
                                    ></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary float-right">
                                <i class="fa fa-paper-plane"></i>
                                제출
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

