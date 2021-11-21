<%@page import="dao.ListProductDao"%>
<%@page import="bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin sản phẩm</title>
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

<section class="detail">
    <h1>${product.name}</h1>
    <div class="box-main">
        <div class="box-left">
            <div class="box-show">
                <img src="${product.src }" alt="${product.description}"/>
            </div>
        </div>
        <div class="box-right">
            <div class="scrolling-inner">
                <div class="box01">
                	<c:set var="names" value="${fn:split(product.name, ' ') }" scope="page"/>
	    			<c:set var="nameLength" value="${fn: length(names) }"/>
	    			<c:set var="name" value="${names[nameLength-1] }"/>
                	<c:set var="x" value="32" scope="page"/>
                	<c:set var="a" value="1" scope="page"/>
                	<c:forEach var="i" begin="1" end="5">
                		<c:set var="y" value="${x=(x*a) }GB"/>
                		<c:set var="a" value="2"/>
                		<c:set var="act" value=""/>
                		<c:if test="${y eq name }">
                			<c:set var="act" value="acti"/>
                		</c:if>
                		
                		<a href="#" class="box01-item ${act }">${y }</a>
                	</c:forEach>
                   
                    
                </div>
            </div>
            <div class="scrolling-inner">
                <div class="box01">
                    <a href="#" class="box01-item acti">Xanh dương</a>
                    <a href="#" class="box01-item">Đen</a>
                    <a href="#" class="box01-item">Trắng</a>
                    <a href="#" class="box01-item">Đỏ</a>
                    <a href="#" class="box01-item">Tím</a>
                    <a href="#" class="box01-item">Xanh lá</a>
                </div>
            </div>
            
            <div class="box02">
                <div class="box02-txt">Giá:</div>
                <div class="box-price">
                    <p class="box-price-present"><fmt:formatNumber type = "number" 
         maxFractionDigits = "3" value = "${product.price}" />đ</p>
                </div>
                <div class="block">
                    <div class="block-promo">
                        <div class="pro-top">
                            <p>Thông tin khuyễn mãi</p>
                        </div>
                        <div class="pro-content">
                            <p>Nội dung khuyễn mãi</p>
                        </div>
                    </div>
                    <div class="block-button">
                    	<c:url var="addToCart" value="/addToCart?action=add&id=${product.id }"/>
                        <a href="${addToCart }" class="btn-buynow">MUA NGAY</a>
                    </div>
                </div>
            </div>
            
            <p class="parameter-title">Cấu hình ${product.name}</p>
            <div class="parameter">
                <ul class="parameter-list">
                <c:set var="descripts" value="${fn:split(product.description, ';') }"/>
                <c:forEach var="des" items="${ descripts}">
                	
                	<li>
                	<c:set var="tt" value="${fn:split(des, ':') }"/>
                		<p class="lileft">${tt[0] }:</p>
                        <div class="liright">
                            <span>${tt[1] }</span>
                        </div>
                	</li>
                </c:forEach>
                    
                </ul>
            </div>
        </div>
    </div>
</section>

<c:import url="footer.jsp"/>
</body>
</html>