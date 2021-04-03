<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/main.css" rel="stylesheet" type="text/css"/>


 <!-- 컨텐츠 -->
        <div class="container-fluid">
            <div class="main-middle-title-line">
                <div class="line-img"></div>
                <div class="main-middle-title">BEST</div>
                <div class="line-img"></div>
            </div>
            <!-- 베스트 4개 -->
             <c:forEach var="product" items="${blist}" varStatus="status">
                    	<c:if test="${status.count % 4 eq 1}"> 
						   		<div class="row">     
						</c:if>
								<div class="col-3">
				                    <div class="product-box">
				                        <a href="<%=application.getContextPath() %>/product?productNo=${product.productNo}">
				                            <div class="main-product">
				                                 <img src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}">
				                            </div>
				                        </a>
				                        <div class="main-product-name">
				                        <div>(Best) ${product.productName}</div>
				                        <div class="price">${product.productPrice}원</div>
				                        </div>
				                    </div>
				                </div>
   						<c:if test="${status.count % 4 eq 0}"> 
							   		</div>
						</c:if>
   			</c:forEach>
   					

            <div class="main-middle-title-line">
                <div class="line-img"></div>
                <div class="main-middle-title">NEW</div>
                <div class="line-img"></div>
            </div>
            <!--신상품 12개-->
            <c:forEach var="product" items="${nlist}" varStatus="status">
                    	<c:if test="${status.count % 4 eq 1}"> 
						   	<div class="row">     
						</c:if>
								<div class="col-3">
				                    <div class="product-box">
				                        <div class="main-product">
				                            <a href="<%=application.getContextPath() %>/product?productNo=${product.productNo}">
				                                 <img src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}">
				                            </a>
				                        </div>
				                        <div class="main-product-name">
				                            <div>(New) ${product.productName}</div>
				                        <div class="price">${product.productPrice}원</div>
				                        </div>
				                    </div>
				                </div>
   						<c:if test="${status.count % 4 eq 0}"> 
						   	</div>
						</c:if>
   			</c:forEach>
        </div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>


