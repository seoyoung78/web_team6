<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<%@ page import="java.util.*"%>
<%@ page import="com.mycompany.webapp.dto.*"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="<%=application.getContextPath() %>/resources/css/category.css" rel="stylesheet" type="text/css"/>

<div class="category-content">
            <!-- 컨텐츠 -->
            <div class="container-fluid">
                <div class="new-popular-wrapper">
                    <div class="category-path">
                        <p>홈 > ${product.categoryName}</p>
                    </div>
                    <div class="new-popular">
                    	<c:if test="${kind==0}">
							<a class="text" href="<%=application.getContextPath()%>/category?cno=${cno}&kind=1">최신순</a>
                        	<a class="text" href="<%=application.getContextPath()%>/category?cno=${cno}&kind=2">인기순</a>
						</c:if>
						<c:if test="${kind==1}">
							<a class="text" style="color:red; text-decoration:underline;"href="<%=application.getContextPath()%>/category?cno=${cno}&kind=1">최신순</a>
                        	<a class="text" href="<%=application.getContextPath()%>/category?cno=${cno}&kind=2">인기순</a>
						</c:if>
						<c:if test="${kind==2}">
							<a class="text" href="<%=application.getContextPath()%>/category?cno=${cno}&kind=1">최신순</a>
                        	<a class="text" style="color:red; text-decoration:underline;" href="<%=application.getContextPath()%>/category?cno=${cno}&kind=2">인기순</a>
						</c:if>
                    </div>
                </div>
                <div class="product-wrapper">
                    <!--카테고리 12개-->
                    <c:forEach var="product" items="${list}" varStatus="status">
                    	<c:if test="${status.count % 4 eq 1}"> 
						   		<div class="row">     
						</c:if>
								<div class="col-3">
                            		<a href="<%=application.getContextPath() %>/product?productNo=${product.productNo}">
                                		<div class="cetegory-product">
													<img src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}">
		                                </div>
                            		</a>
               			            <div class="category-title">
	                                	<p>${product.productName}</p>
	                                	<p class="price">${product.productPrice}원</p>
                            		</div>
                        		</div>
   						<c:if test="${status.count % 4 eq 0}"> 
						   		</div>
						</c:if>
   					</c:forEach>
                    
                </div>
            </div>

            <!--페이징-->
            <table style="margin-left:45%; margin-top:5%;">
		       <tr>
				<td colspan="5" style="text-center;">
						<a class="btn btn-outline-primary btn-sm"
							href="category?cno=${product.productCategoryNo}&pageNo=1">처음</a>

						<c:if test="${pager.groupNo>1}">
							<a class="btn btn-outline-info btn-sm"
							href="category?cno=${product.productCategoryNo}&pageNo=${pager.startPageNo-1}">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo == i}">
								<a class="btn btn-outline-danger btn-sm" 
									href="category?cno=${product.productCategoryNo}&pageNo=${i}">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo != i}">
								<a class="btn btn-outline-success btn-sm" 
									href="category?cno=${product.productCategoryNo}&pageNo=${i}">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<a class="btn btn-outline-info btn-sm"
							href="category?cno=${product.productCategoryNo}&pageNo=${pager.endPageNo+1}">다음</a>
						</c:if>
							
						<a class="btn btn-outline-primary btn-sm"
							href="category?cno=${product.productCategoryNo}&pageNo=${pager.totalPageNo}">맨끝</a>
								
								<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
					</td>
				</tr>
			</table>
  </div>
  
            

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


