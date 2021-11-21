<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="header">
	<div class="logo">
		<a href="<%= request.getContextPath() %>/home.jsp" title="The gioi dien thoai">
        	<img class="i-logo" src="media/images/i-logo.png">
        </a>
    </div>
    <div class="header-right">
        
        <div class="header-title">
            <h3>${param.headerTitle }</h3>
        </div>
    </div>
</div>
