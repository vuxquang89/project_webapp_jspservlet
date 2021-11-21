<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tiến hành thanh toán</title>
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

<c:if test="${empty cart }">
	<c:redirect url = "historyOrder.jsp"/>
</c:if>
<div class="paybox">
    <div class="pleft infoBox">
        <h3 class="left-title">THÔNG TIN NHẬN HÀNG:</h3>
        <div class="left-inner">
            <form method="post" name="shipForm" id="shipForm" action="${pageContext.servletContext.contextPath}/pay">
                <div class="pay-accordion">
                    <h3>
                        <label class="address-curent">Địa chỉ nhận hàng</label>    
                    </h3>
                    <div class="accordion-box-show" style="padding-left : 35px;">
                        <p>
                            <b>${login.username }</b> - ${login.phone }<br>
                            ${login.address }
                        </p>
                    </div>
                </div>
                <div class="note-row">
                    <div class="form-row">
                        <label class="title" for="shipping-note">Ghi chú</label>
                        <div class="form-col">
                            <textarea id="shipping-note" name="shipping[note]" placeholder="..." size="50" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="form-row shipbt">
                        <input type="submit" class="address-submit-btn" value="ĐẶT HÀNG">
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <div class="pright orderBox">
        <h3 class="box-title">ĐƠN HÀNG (${cart.getQuantity() } sản phẩm)
            <a href="cart.jsp">(<span>chỉnh sửa</span>)</a>
        </h3>
        <div class="right-inner">
            <ul id="cartlist">
            <c:set var="i" value="0"/>
            <c:forEach var="item" items="${cart.getItems() }">
            	<c:set var="i" value="${i+1 }"/>
            	<li class="cartitem">
                    <a class="cart-img" href="${pageContext.servletContext.contextPath}/infoProduct?id=${item.id}">
                        <img alt="${item.name }" src="${item.src }">
                    </a>
                    <h3>
                        <span class="counter">${i }.</span>
                        <a href="${pageContext.servletContext.contextPath}/infoProduct?id=${item.id}">${item.name }</a>
                    </h3>
                    <div class="cart-row">
                        <div class="cart-col col-c1"><fmt:formatNumber type = "number" 
         maxFractionDigits = "3" value = "${item.price }" />đ</div>
                        <div class="cart-col col-c2">x</div>
                        <div class="cart-col col-c3">${item.number }</div>
                    </div>
                </li>
            </c:forEach>
               
            </ul>
            <div class="sum-row sum-r1">
                <div class="sum-col sum-c1">TỔNG CỘNG</div>
                <div class="sum-col sum-c2"></div>
                <div class="sum-col sum-c3"><fmt:formatNumber type = "number" 
         maxFractionDigits = "3" value = "${cart.getAmount() }" />đ</div>
            </div>
            <div class="sum-row sum-r2">
                <div class="sum-col sum-c1">Giảm giá</div>
                <div class="sum-col sum-c2"></div>
                <div class="sum-col sum-c3">0đ</div>
            </div>
            <div class="sum-row sum-r3">
                <div class="sum-col sum-c1">Phí vận chuyển</div>
                <div class="sum-col sum-c2"></div>
                <div class="sum-col sum-c3">0đ</div>
            </div>
            <div class="sum-row total">
                <div class="sum-col sum-c1">TỔNG THANH TOÁN</div>
                <div class="sum-col sum-c2"></div>
                <div class="sum-col sum-c3">
                	<c:set var="totalPay" value="${cart.getAmount() + cart.getAmount() * 0 + cart.getAmount() * 0 }"/>
                	<fmt:formatNumber type = "number" 
         maxFractionDigits = "3" value = "${totalPay }" />đ</div>
            </div>
        </div>
    </div>
</div>


<c:import url="footer.jsp"/>
</body>
</html>