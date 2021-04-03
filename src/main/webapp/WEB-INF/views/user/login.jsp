<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/login.css" rel="stylesheet" type="text/css"/>


<!-- 컨텐츠 -->


<div class="login-content">
	<div class="container-fluid">
		<div class="login-wrapper">
			<div class="login-path">
				<p>로그인</p>
			</div>
		</div>
		<div class="container-login">
			<!-- 로그인 카드 -->
			<div class="d-flex justify-content-center container">
				<div class="card-login">
					<div class="card-header">
						<h6>LOGIN</h6>
					</div>
					<div class="card-body">
						<form method="post" action="<%=application.getContextPath()%>/login">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="input-group form-group">
								<input type="text" id="userId" name="userId" class="form-control" placeholder="이메일 아이디">
							</div>
							<div class="input-group form-group">
								<input type="password" id="userPassword" name="userPassword" class="form-control" placeholder="패스워드">
							</div>
					
					<!-- 로그인 카드 푸터 -->
					<div class="card-footer">
						<!-- email_password.js 파일을 통해 아이디와 비밀번호 데이터베이스 대조 후 로그인 판별 -->
						<div d-flex justify-content-xl-end>
							<input type="submit" value="로그인" class="btn login-btn">
						</div>
					</div>
					</form>
				
						<!-- 회원가입 창으로 넘어감 -->
						<div class="d-flex justify-content-start links">
							<a href="<%=application.getContextPath()%>/signup">회원가입</a>
						</div>

						<!-- 아이디/비밀번호 찾기 창으로 넘어감 -->
						<div class="d-flex justify-content-start links">
							<a href="<%=application.getContextPath()%>/findidpw">아이디/비밀번호 찾기</a>
						</div>

		</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>


