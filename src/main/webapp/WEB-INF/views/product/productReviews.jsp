<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 
<link href="<%=application.getContextPath() %>/resources/css/product.css" rel="stylesheet" type="text/css"/>

<div class="row review-section" >
   <div class="col-md-12">
       <hr>
       <h3>| Reviews |</h3>
       <hr>
   </div>
     
   <c:forEach var="reviews" items="${rlist}">
    	<div class="col-md-12">
        <div class="row">
            <div class="col-md-4 review-part-left">
                <div class="row">
                    <div class="col-md-4">
                        <img src="http://placekitten.com/400/252">
                    </div>
                    <div class="col-md-4">
                        <p><fmt:formatDate value="${reviews.reviewRegdate}" pattern="yyyy-MM-dd"/></p>
                        <span>${reviews.userId}</span><br>
                    </div>
                </div>
            </div>
            <div class="col-md-6 review-part-right">
                <p>${reviews.reviewContent}</p>
            </div>
            <div class="col-md-2 review-part-right">
            	<c:if test=""></c:if>
            		<button class="btn review-btn" onclick="alert('삭제할 수 없습니다.')" type="button">remove</button>
            		<a class="btn review-btn" href="<%=application.getContextPath()%>/user/delreview?reviewNo=${reviews.reviewNo}&productNo=${product.productNo}">remove</a>                        	                                                 	                         
            </div>
        </div>
    	</div>
    </c:forEach>     
       
   <div class="col-5 text-center">
			<div class="d-flex">
				<div class="flex-grow-1">							
				<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
					<button class="btn btn-outline-primary btn-sm"
						onclick="getList(1)">처음</button>
			
					<c:if test="${pager.groupNo>1}">
					<button class="btn btn-outline-info btn-sm"
					onclick="getList(${pager.startPageNo-1})">이전</button>
					</c:if>
			
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo!=i}">
							<button class="btn btn-outline-success btn-sm"
							onclick="getList(${i})">${i}</button>
						</c:if>
						<c:if test="${pager.pageNo==i}">
							<button class="btn btn-danger btn-sm"
							onclick="getList(${i})">${i}</button>
						</c:if>
					</c:forEach>
			
					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<button class="btn btn-outline-info btn-sm"
						onclick="getList(${pager.endPageNo+1})">다음</button>
					</c:if>
			
					<button class="btn btn-outline-primary btn-sm"
						onclick="getList(${pager.totalPageNo})">맨끝</button>
				</div>
		</div>
	</div>               
</div>




