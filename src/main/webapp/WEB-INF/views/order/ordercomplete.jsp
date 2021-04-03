<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>



 <!-- 컨텐츠 -->
        <div class="container-fluid">
            <!--여기에 작성-->
            <br/>
            <br/>
            <div class="jumbotron text-center" style="background-color: f3f3f3;">

                <h4 class="display">주문이 완료 되었습니다.</h4><br/>
                <hr>
                <p class="lead">
                    <a
                        class="btn btn-danger btn-sm"
                        style="background-color: #d15851;"
                        href="<%=application.getContextPath()%>/main"
                        role="button">메인페이지</a>
                    <a
                        class="btn btn-danger btn-sm"
                        style="background-color: #d15851;"
                        href="<%=application.getContextPath()%>/user/purchaselist"
                        role="button">구매 내역</a>
                </p>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


