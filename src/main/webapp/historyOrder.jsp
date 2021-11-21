<%@page import="dao.HistoryOrdersDAO"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử đặt hàng</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/mobile.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/tablet.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/desktop.css">
</head>
<body>
<c:import url="header.jsp"/>
<c:if test="${empty login.username || login.username == null}">
	<c:redirect url = "login.jsp"/>
</c:if>

<div class="page-content">
    <div class="fleft"></div>
    <div class="fright col-big-right">
        <div class="standardBox">
            <h2 class="title">Lịch sử đặt hàng</h2>
            <div class="custBar">
                <div class="left">
                    <span class="hello">Xin chào </span>
                    <span class="name">${login.username }</span>
                </div>
                <div class="right"></div>
            </div>
            <jsp:useBean id="loDAO" class="dao.HistoryOrdersDAO" scope="page"/>
            
            <c:set var="lo" value="${loDAO.listOrders(login.usermail) }"/>
            
            <c:if test="${not empty lo }">
            <div class="orderHistory-wrap">
                <div class="by-month"></div>
                <div class="by-period"></div>
                <div class="orderhistory" id="orderhistory">
                    <c:forEach items="${lo }" var="order">
                    <header class="order-headline">
                        <div class="order-title">
                            <div class="headline">
                                <span class="headline-label">
                                    <span class="white">Đơn hàng</span>
                                    <span>${order.orderId }</span>
                                </span>
                                <span class="headline-value">
                                    <span class="white">Ngày đặt hàng</span>
                                    <span><fmt:formatDate pattern="dd/MM/yyyy" value="${order.orderDate}" /></span>
                                </span>
                            </div>
                        </div>
                        <div class="order-cost">
                            <div class="headline">
                                <span class="headline-label uppercase white">Thành tiền</span>
                                <span class="headline-value">
                                <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${order.price }" />đ</span>
                            </div>
                        </div>
                        <div class="order-payment">
                            <div class="headline">
                                <span class="headline-label uppercase white">Thanh toán</span>
                                <span class="headline-value">Thanh toán khi nhận hàng</span>
                            </div>
                        </div>
                        <div class="order-status">
                            <div class="headline">
                                <span class="headline-label uppercase white">Tình trạng</span>
                                <span class="headline-value">
                                <c:choose>                            
                                	<c:when test="${order.status == 1 }">
	                                Xuất kho
	                                </c:when>
                                	<c:when test="${order.status == 2 }">
	                                Tiếp nhận
	                                </c:when>
	                                <c:otherwise>
	                                Đã xóa
	                                </c:otherwise>
                                </c:choose>
                                </span>
                            </div>
                        </div>
                        <div style="clear:both;"></div>
                    </header>
                    
                    <div class="order-body">
                        <div class="order_shipment">
                            <div class="order-shipment">
                                <div class="order-shipment-status"></div>
                                <div class="order-shipment-goods">
                                    <ul class="order-goods-list">
                                    <c:forEach var="item" items="${order.lp }">
                                        <li class="order-goods-list-item">
                                            <div class="product-image">
                                                <a href="${pageContext.servletContext.contextPath}/infoProduct?id=${item.productId}" title="${item.nameProduct}">
                                                    <img style="max-width: 75px; max-height: 75px;" src="${item.image }">
                                                </a>
                                            </div>
                                            <div class="product-body">
                                                <div class="product-body-name">
                                                    <a href="${pageContext.servletContext.contextPath}/infoProduct?id=${item.productId}">${item.nameProduct}</a>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                    </ul>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                	</c:forEach>
                </div>
            </div>
            </c:if>
        </div>
    </div>
</div>

<c:import url="footer.jsp"/>
</body>
</html>