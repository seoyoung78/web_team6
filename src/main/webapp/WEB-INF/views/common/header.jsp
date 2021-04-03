<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- 타이틀 -->
        <title>SANTA CANDY</title>

        <!-- 폰트 로딩 -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&family=Raleway:wght@300;400;600&display=swap" rel="stylesheet">

        <!-- 돋보기 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">

        <!-- 사전 로딩 -->
        <link rel="stylesheet"	href="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
		<script	src="<%=application.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
		<script	src="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
		<script	src="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>


        <!-- css 로딩 -->
        <link href="<%=application.getContextPath() %>/resources/css/header_footer.css" rel="stylesheet" type="text/css"/>

        <!-- FAQ 추가 -->
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,500|Open+Sans">
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            
              <script type="text/javascript">
            $(document).on('click', '#btnSearch', function(e){
                alert("검색");
                e.preventDefault();

                var url = "${pageContext.request.contextPath}/search";

                url = url + "?keyword=" + $('#keyword').val();

                location.href = url;

                console.log(url);

             });   
            </script>
    </head>
    <body>
        <!-- 헤더 -->
        <div class="header">
            <div class="top-img"></div>
            <div class="login-out">
                <ul>
                    <li>
                        <a href="<%=application.getContextPath()%>/faq">마이페이지</a>
                    </li>
                    <sec:authorize access="isAnonymous()">
                     <li>
						 <a href="<%=application.getContextPath()%>/auth/login">로그인</a>
					</li>
					<li>
                        <a href="<%=application.getContextPath()%>/signup">회원가입</a>
                    </li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<li style="margin-top:0;">
						<form method="post" class="d-inline-block" action="<%=application.getContextPath()%>/logout">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								사용자: <sec:authentication property="name"/>
								<button class="logout-button">로그아웃</button>
						</form>
					</li>
					</sec:authorize>
                </ul>
            </div>
            <div class="center-img">
                <a href="<%=application.getContextPath()%>/main">
                    <div class="logo-img"></div>
                </a>
                <a href="<%=application.getContextPath()%>/user/cart">
                    <div class="shopping-basket	"></div>
                </a>
                <div class="shopping-basket-text-box">
                    <div class="shopping-basket-text">장바구니</div>
                </div>
            </div>
            <div class="down-category">
                <ul>
                    <li>
                        <a href="<%=application.getContextPath()%>/category?cno=1&kind=0">캔들</a>
                    </li>
                    <li>
                        <a href="<%=application.getContextPath()%>/category?cno=2&kind=0">조명</a>
                    </li>
                    <li>
                        <a href="<%=application.getContextPath()%>/category?cno=3&kind=0">트리</a>
                    </li>
                    <li>
                        <a href="<%=application.getContextPath()%>/category?cno=4&kind=0">기타</a>
                    </li>
                </ul>
                <div class="search-box">
                    <div class="input-group rounded">
                       <input
                        	id="keyword"
                            type="search"
                            class="form-control rounded"
                            placeholder="Search"
                            aria-label="Search"
                            aria-describedby="search-addon"/>
                        <a class="btn btn-light">
                            <i class="bi bi-search" id="btnSearch"></i>
                    	</a>
                    </div>
                </div>
            </div>
        </div>