<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- 타이틀 -->
        <title>SANTA CANDY</title>

        <!-- 돋보기 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">

        <!-- 사전 로딩 -->
        <link rel="stylesheet"	href="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
				<script	src="<%=application.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
				<script	src="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
				<script	src="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
				<script src="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.js"></script>

        <!-- 폰트 로딩 -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&family=Raleway:wght@300;400;600&display=swap"
            rel="stylesheet">

        <!-- css 로딩 -->
        <link href="<%=application.getContextPath() %>/resources/css/review.css" rel="stylesheet" type="text/css"/>
    
</head>

<body>
    
    <!-- 한 줄 평 카드 -->
    <form method="post" action="createreview">
    		<div class="container-review">
           <div class="card-review">
               <div class="card-header">
                   <h6>한 줄 평 작성</h6>
               </div>
               
               <div class="card-body">
                   <div class="input-group form-group">
                       <input type="text" class="form-control" value="${reviews.orderNo}" readonly>
                   </div>

                   <div class="input-group form-group">
                       <input type="text" class="form-control" value="${reviews.productName}" readonly>
                   </div>

                   <!-- 한 줄 평 작성-->
                   <div class="input-group form-group">
                       <input type="text" class="form-control" id="review-write" placeholder="한 줄 평 작성 (30자 이내)" name="review-write" maxlength='30'>
                   </div>
                   
               </div>

               <div class="card-footer-review">
                   <div class="card-review-footer">
                   <!-- 한 줄 평 내용 게시 -->
                   	<a type="submit" class="btn" id="review-submit-btn" href="createreview" onclick="close_review()">게시	</a>                        
                   </div>
               </div>
               
           </div>
        </div>
    </form>
    
</body>
</html>