<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=application.getContextPath() %>/resources/css/category.css" rel="stylesheet" type="text/css"/>


  <div class="category-content">
            <!-- 컨텐츠 -->
            <div class="container-fluid">
                <div class="new-popular-wrapper">
                    <div class="category-path">
                        <p>홈 > 기타</p>
                    </div>
                    <div class="new-popular">
                        <a href="#" class="text">최신순</a>
                        <a href="#" class="text">|</a>
                        <a href="#" class="text">인기순</a>
                    </div>
                </div>
                <div class="product-wrapper">
                    <!--카테고리 12개-->
                  <table>
                    <div class="row">
                    	<c:forEach var="search" items="${list}">
                        	<div class="col-3">
                            	<a href="<%=application.getContextPath() %>/product">
                                	<div class="cetegory-product">
                                    	<img src="<%=application.getContextPath() %>${search.imgSname}">
                                	</div>
                            	</a>
	                            <div class="category-title">
	                                <p>${search.productName}</p>
	                                <p class="price">${search.productPrice}</p>
	                            </div>
                        	</div>
                     	</c:forEach>   
                    </div>
                    
                    <tr>
		      <td colspan="5" style="text-center">
		      	<div class="d-flex">
		      		<div class="flex-grow-1">
				         <a class="btn btn-outline-primary btn-sm"
				           href="search?pageNo=1">처음</a>
				            
				         <c:if test="${pager.groupNo>1}">
				            <a class="btn btn-outline-info btn-sm"
				            href="search?pageNo=${pager.startPageNo-1}">이전</a>
				         </c:if>
				         
				         <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				            <c:if test="${pager.pageNo == i}">
				               <a class="btn btn-outline-success btn-sm" 
				                  href="search?pageNo=${i}">${i}</a>
				            </c:if>
				            <c:if test="${pager.pageNo != i}">
				               <a class="btn btn-outline-danger btn-sm" 
				                  href="search?pageNo=${i}">${i}</a>
				            </c:if>
				         </c:forEach>
				         
				         <c:if test="${pager.groupNo<pager.totalGroupNo}">
				            <a class="btn btn-outline-info btn-sm"
				            href="search?pageNo=${pager.endPageNo+1}">다음</a>
				         </c:if>
				            
				         <a class="btn btn-outline-primary btn-sm"
				            href="search?pageNo=${pager.totalPageNo}">맨끝</a>
				         <!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
			         </div>
			     
			      </div>
		      </td>
	  	 </tr>
     </table>               
                    
                    
               </div>
            </div>





			




<!-- 
            페이징
            <div class="pagination">
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
    </div> -->
            

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


