<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/login.css" rel="stylesheet" type="text/css"/>

<!-- 컨텐츠 -->
<div>
	<div class="alert alert-success">
		게시물 입력
	</div>
	
	<form method="post" action="insertImg" enctype="multipart/form-data">
	 	<div class="form-group">
		    <label for="battach">첨부</label>
		    <!-- 여러개의 파일을 받으려면 dto에서 배열로 받아야 함 -->
		    <input class="form-control-file" multiple="multiple" type="file" id="battach" name="battach">
		    <!-- <input type="file" class="form-control-file" id="battach" name="battach"> -->
		</div>
		<button type="submit" class="btn btn-primary">저장</button>
	</form>
	
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


