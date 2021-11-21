<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="header">
	<c:set var="login" scope="session" value="${sessionScope.logAccount }"></c:set>
    <c:set var="loginName" value="${login.username }"/>
    
	<div class="logo">
		<a href="${pageContext.servletContext.contextPath}/home.jsp" title="The gioi dien thoai">
        	<img class="i-logo" src="media/images/i-logo.png">
        </a>
    </div>
    <div class="header-right">
        <form class="form-search" method="get" action="${pageContext.servletContext.contextPath}/search">             
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Bạn cần tìm..." name="key" id="txtSearch"/>
                <div class="input-group-btn">
                    <button class="btn btn-primary btn-search" type="submit">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                    
                    
                </div>
            </div>
              
        </form>
        
        <jsp:useBean id="history" class="bean.HistorySearch" scope="session">
			<jsp:setProperty name="history" property="link" value="${pageContext.servletContext.contextPath}/search?key=${param.key }" />
			<jsp:setProperty name="history" property="key" value="${param.key }" />
		</jsp:useBean>
		
        
        <div class="header-cart">
        	<c:url var="toCart" value="/cart.jsp"/>
            <a href="${toCart}" title="Giỏ hàng">
                <img class="i-cart" src="media/images/i-cart.png">
                <c:set var="total" value="${cart.getQuantity() }"/>
                <c:if test="${not empty total && total > 0 }">
                	<span class="cart-number" id="cart-info-quantity"><c:out value="${total }"></c:out></span>
                </c:if>
                
            </a>
        </div>
        <div class="header-business">
        	<c:if test="${not empty loginName}">
        	<c:url var="toOrder" value="/historyOrder.jsp"/>
        	<a href="${toOrder }" title="Lịch sử đặt hàng">
        		<img class="i-business" src="media/images/icons/bank-business.png"/>
        	</a>
        	</c:if>
        </div>
    </div>
</div>

<div class="topnav">
	<a href="${pageContext.servletContext.contextPath}/home.jsp">Trang chủ</a>
    <a href="#">Sản phẩm</a>
    <a href="#">Dịch vụ</a>
    <a href="#">Giới thiệu</a>
    <a href="#">Liên hệ</a>
    
    <c:choose>
    	<c:when test="${not empty loginName}">
    		<c:set var="names" value="${fn:split(loginName, ' ') }" scope="page"/>
	    	<c:set var="nameLength" value="${fn: length(names) }"/>
	    	
	    	<a class="nav-right" href="<%= request.getContextPath() %>/logout">Đăng xuất</a>
	    	<a class="nav-right" href="#"><c:out value="${names[nameLength-1] }"></c:out></a>
	    	
    	</c:when>
    	<c:otherwise>
    		<a class="nav-right" href="login.jsp">Đăng nhập</a>
    		<a class="nav-right" href="register.jsp">Đăng ký</a>
    	</c:otherwise>
    </c:choose>
    
</div>