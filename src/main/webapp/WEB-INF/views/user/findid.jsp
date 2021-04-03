<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=application.getContextPath() %>/resources/css/findidpw.css" rel="stylesheet" type="text/css"/>

<div class="d-flex justify-content-around">
				<div class="card-find">
					<div class="card-header">
						<h6>아이디 찾기</h6>
					</div>

					<!-- 이름과 전화번호를 데이터베이스와 대조해 아이디 리턴 -->
					<div class="card-body-find">
						<c:if test="${userId == null}">
							<div>
								<div style="margin-top:5%; margin-left:20%; font-size:1.2em;">
								<span>작성한 정보로 가입된 회원이 없습니다.</span>
							</div>
							</div>		
							<div class="d-flex justify-content-start links">
									<a href="<%=application.getContextPath()%>/signup" style="margin-top:5%; margin-left:40%; font-size:1em;">회원가입</a>
							</div>
						</c:if>
						<c:if test="${userId != null}">
							<div style="margin-top:5%; margin-left:9%; font-size:1em;">
								<span>회원님의 계정 아이디(이메일)는 ${userId}입니다.</span>
							</div>
							<div class="d-flex justify-content-start links" style="margin-top:5%; margin-left:43%; font-size:1em;">		
							 <a href="<%=application.getContextPath()%>/auth/login" style="1px solid blue;">로그인</a>
							 </div>
							 <div class="d-flex justify-content-start links" style="margin-top:2%; margin-left:39%; font-size:1em;">		
							 <a href="<%=application.getContextPath()%>/changePassword" style="1px solid blue;">비밀번호 변경</a>
							 </div>
							
						</c:if>
					</div>
				</div>
			</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


