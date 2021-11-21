<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin giỏ hàng</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/mobile.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/tablet.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/desktop.css">
<script src="${pageContext.servletContext.contextPath}/assets/js/action_cart.js"></script>
</head>
<body>
<c:set var="cart" scope="session" value="${sessionScope.cart }"/>
<c:set var="listItem" value="${cart.getItems() }"></c:set>
<c:set var="totalItem" value="${cart.getQuantity()}"/>

<c:import url="header.jsp"/>
	


<section class="detail">
    <div class="box-middle">
        <div class="box-inner">
            <div class="ct-title clearfix">
                <div class="ct-text">
                    <h3>Giỏ hàng của bạn</h3>
                </div>
                <div class="ct-amount">
                    <p><span id="cart-amount" class="cart-amount"><c:out value="${not empty totalItem ? totalItem : 0 }"></c:out></span> sản phẩm</p>
                </div>
            </div>
            <c:if test="${totalItem > 0 }">
            
            <div class="ct-content clearfix">
                <form action="#" method="post" name="cartForm" id="cartForm">
                    <div class="ct-list">
                    <c:forEach items="${listItem}" var="item">
                    	
            			<div class="cti-item clearfix">
                            <div class="cti-image">
                                <a href="${pageContext.servletContext.contextPath}/infoProduct?id=${item.id}" title="${item.name }">
                                    <img alt="${item.name }" src="${item.src }">
                                </a>
                            </div>
                            <div class="cti-content">
                                <div class="cti-product-name">
                                    <h2>
                                        <a href="${pageContext.servletContext.contextPath}/infoProduct?id=${item.id}" title="${ item.name}">${item.name }
                                        </a>
                                    </h2>
                                </div>
                                <div class="cti-product-properties clearfix">
                                    <div class="cti-product-price">
                                        <strong><fmt:formatNumber type = "number" 
         maxFractionDigits = "3" value = "${item.price}" />đ</strong>
                                    </div>
                                    <div class="cti-product-size" data-id="${item.id }">
                                        <label>Số lượng</label>
                                        <input class="change-amount" type="number" min="1" max="5" value="${cart.getQuantity(item.id) }" name="amount">
                                        <ul class="choose-amount">
                                            <li data-index="1">1</li>
                                            <li data-index="2">2</li>
                                            <li data-index="3">3</li>
                                            <li data-index="4">4</li>
                                            <li data-index="5">5</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="cti-product-brand clearfix">
                                    <div class="cti-delete" data-id="${item.id }">
                                        <input type="button" class="btn btn-danger del-item-cart" value="Xóa">
                                    </div>
                                    <div class="cti-brand">
                                        <p>
                                            Mã sản phẩm: <span>${item.id }</span>
                                            <span class="white-space">|</span>
                                            Thương hiệu: ${item.brand }                    
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
            		</c:forEach>
                        
                    </div>
                    <div class="ct-price">
                        <div class="clearfix">
                            <div class="ct-price-text">
                                <span>Tổng tiền <em>(tạm tính)</em></span>
                            </div>
                            <div class="ct-price-number">
                                <strong id="cart-price">
                                	<fmt:formatNumber type = "number" 
         maxFractionDigits = "3" value = "${cart.getAmount() }" />đ</strong>
                            </div>
                            
                        </div>
                        <a href="pay.jsp" id="btnCheckout" title="tiến hành đặt hàng">Tiến hành đặt hàng</a>
                    </div>
                </form>
            </div>
            </c:if>
        </div>
    </div>
</section>

<c:import url="footer.jsp"/>
</body>
</html>