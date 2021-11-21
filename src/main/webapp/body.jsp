<%@page import="dao.ListProductDao"%>
<%@page import="java.util.List, bean.ProductBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row">
	<!-- left column  -->
	<div class="leftcolumn">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
        	<!-- Indicators -->
            <ol class="carousel-indicators">
            	<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
           	</ol>
            
           	<!-- Wrapper for slides -->
            <div class="carousel-inner">
            	<div class="item active">
                	<img src="media/images/cho-don-iphone-13-pro-830-300-830x300-15.png" alt="Los Angeles" style="width:100%;">
                </div>
            
            	<div class="item">
                    <img src="media/images/galaxy-z-fold3-z-flip3-5g-830-300-830x300.png" alt="Chicago" style="width:100%;">
                </div>
                
                <div class="item">
                    <img src="media/images/reno6cb-830-300-830x300.png" alt="New york" style="width:100%;">
                </div>
            </div>
            
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            	<span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
           	<a class="right carousel-control" href="#myCarousel" data-slide="next">
            	<span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>            
    </div>
    <!-- end left column -->    
    
    <div class="rightcolumn">
    	<a href="#">
    		<img src="media/images/laptopdesk(3)-340x340.jpg">
        </a>
        <a href="#">
        	<img src="media/images/pk-340x340.jpg">
        </a>
        <a href="#">
        	<img src="media/images/samsung-galaxy-note-20-340x340.jpg">
        </a>
        <a href="#">
        	<img src="media/images/laptop-340x340.jpg">
        </a>
    </div>
</div>
<div class="row">
	<div class="row-column">
    	<div class="box-title">
        	<h2>Điện thoại nổi bật</h2>
        </div>
        <div class="row-container">
        
        <jsp:useBean id="lpDao" class="dao.ListProductDao" scope="page">  	
        </jsp:useBean>
        
        <%--set số phần tử trên một trang --%>
        <c:set var="limit" value="5"/>   
        <%--tong so trang --%>     
        <c:set var="totalRecords" value="${lpDao.getTotalProduct()}"/>
       	<%--get số trang hiện tại trên url --%> 
        <c:set var="currentPage" value="${not empty param.pages ? param.pages : 1 }"/>
        
        <c:set var="avgPage" value="${totalRecords/limit }"/>
        <%--làm tròn len 1 đơn vị --%> 
        <fmt:formatNumber var="ceil" value="${avgPage + (avgPage % 1 == 0 ? 0 : 0.5)}" type="number" pattern="#" />
        <c:set var="totalPage" value="${ceil}"/>
    	<%--giới hạn currentPage trong khoảng từ 1 đến totalPage --%> 
        <c:choose>
        	<c:when test="${currentPage > totalPage }">
        		<c:set var="currentPage" value="${totalPage }"/>
        	</c:when>
        	<c:when test="${currentPage < 1 }">
        		<c:set var="currentPage" value="1"/>
        	</c:when>
        </c:choose>
        
        <%--tìm khoảng bắt đầu trong truy vấn limit --%> 
        
        <c:set var="start" value="${(currentPage-1)*limit }" scope="page"/>
        
       	<c:set var="listProduct" value="${lpDao.listProduct(start, limit) }"></c:set>
       	
        <%--hiển thị nội dung theo từng khoảng start --%> 
        <c:forEach var="pro" items="${listProduct }" varStatus="row">
        	
        	<div class="col">
        		<a href="${pageContext.servletContext.contextPath}/infoProduct?id=${pro.id}" class="main-contain">
                	<div class="col-img">
                    	<img src="${pro.src}" alt="${pro.description}">
                    </div>
                    <h3>${pro.name}</h3>
                    <strong class="price"><fmt:formatNumber type = "number" 
         maxFractionDigits = "3" value = "${pro.price}" />đ</strong>
                </a>
            </div>	
        
        </c:forEach>
        <c:set var="test" value="${listProduct }"></c:set>
        
        </div>
    </div>
</div>
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