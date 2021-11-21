<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funix web app - ASM3</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/mobile.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/tablet.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/desktop.css">
</head>
<body>

<!-- header -->
<jsp:include page="header.jsp"/>
<!-- body -->
<jsp:include page="body.jsp"/>

<!-- footer -->
<jsp:include page="footer.jsp"/>
</body>
</html>