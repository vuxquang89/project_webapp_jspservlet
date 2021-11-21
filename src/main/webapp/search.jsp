<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kết quả tìm kiếm</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/mobile.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/tablet.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/desktop.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/js/action_search.js"></script>
</head>
<body>
<%--import header --%>
<c:import url="header.jsp"/>

<c:set var="limit" value="3"/>
<c:set var="totalResult" value="${fn:length(listProduct) }"/>

<section>
    <div class="report-text">
    <c:choose>
    	<c:when test="${totalResult > 0 }">
    		<h1>Tìm thấy ${totalResult} kết quả với <em>${param.key }</em></h1>
    	</c:when>
    	<c:otherwise>
    		<h1>Không tìm thấy kết quả với <em>${param.key }</em></h1>
    	</c:otherwise>
    </c:choose>
    </div>
    <c:if test="${totalResult > 0 }">
    <div class="search-content">
        <ul id="listSearch" class="listproduct">
        <c:forEach var="pro" items="${listProduct }" varStatus="row">
        	<li class="item">
                <a href="${pageContext.servletContext.contextPath}/infoProduct?id=${pro.id}" class="main-contain">
                	<div class="col-img">
                    	<img src="${pro.src}" alt="${pro.description}">
                    </div>
                    <h3>${pro.name}</h3>
                    <strong class="price"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${pro.price}" />đ</strong>
                </a>
            </li>        
        </c:forEach>           
            
        </ul>
        <a href="javascript:loadMore()" id="viewmore" class="viewmore">
            
        </a>
    </div>
    </c:if>
</section> 
<div class="box-pagination">
	<div class="pagination">
      	
        <%--Hiển thị button back --%>
        <c:if test="${currentPage > 1 and totalPage > 1 }">
        	<a href="home.jsp?pages=${currentPage-1 }">«</a>
        </c:if>
        <%--hiển thị khoảng giữa --%>
        <c:forEach var="i" begin="1" end="${totalPage }" varStatus="status">
        	<c:choose>
        		<c:when test="${i == currentPage }">
        			<p class="active">${i}</p>
        		</c:when>
        		<c:otherwise>
        			<a href="home.jsp?pages=${i }">${i }</a>
        		</c:otherwise>
        	</c:choose>
        </c:forEach>
        <%-- hiển thị button next --%>
        <c:if test="${currentPage < totalPage and totalPage > 1 }">
        	<a href="home.jsp?pages=${currentPage + 1 }">»</a>
        </c:if>
    </div>
</div>

<%--import footer --%>
<c:import url="footer.jsp"/>
</body>
</html>