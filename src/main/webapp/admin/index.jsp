<%@page import="java.util.List,bean.LoginBean"%>
<%@page import="model.Account"%>
<%@page import="dao.ListProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
LoginBean user = (LoginBean)session.getAttribute("logAccount");

if(user == null || user.getRole() != 1){
	//System.out.println(user);
	response.sendRedirect(request.getContextPath() + "/home.jsp");
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">
<title>Quản trị</title>
</head>
<body>
<div class="page-content">
	<div>
		<a href="<%= request.getContextPath() %>/logout">Logout</a>
		<h4>Hello <%=(user!=null) ? user.getUsername() : "" %></h4>
	</div>
	<div class="row">
    	<h4>Đơn hàng</h4>
    	<jsp:useBean id="loDao" class="dao.ListOrdersDAO" scope="page">  	
        </jsp:useBean>
        
        <table class="table table-hover">
        	<thead>
            	<tr>
                	<th>STT</th>
                    <th>Khách hàng</th>
                    <th>Mã đơn hàng</th>
                    <th>Ngày đặt hàng</th>
                    <th>Tổng tiền</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:set var="i" value="0"/>
            <c:forEach items="${loDao.getListOrders()}" var="item">
            	<c:set var="i" value="${i+1 }"/>
            	<tr>
                	<td>${i }</td>
                    <td>${item.userMail }</td>
                   	<td>${item.orderId }</td>
                    <td>${item.orderDate }</td>
                    <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}" />đ</td>
                    <td><a href="#">Xem chi tiết</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>