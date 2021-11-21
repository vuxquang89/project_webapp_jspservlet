<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link  rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/mobile.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/tablet.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/desktop.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/js/action.js"></script>
<title>Đăng nhập</title>
</head>
<body>
<%
String email = "", pass = "", rem = "";
Cookie[] cookies = request.getCookies();
for(Cookie cookie:cookies){
	if(cookie.getName().equals("cEmail")){
		email = cookie.getValue();
	}else if(cookie.getName().equals("cPass")){
		pass = cookie.getValue();
	}else if(cookie.getName().equals("cRemember")){
		rem = cookie.getValue();
	}
}
%>


<c:import url="header-logo.jsp">
	<c:param name="headerTitle" value="Đăng nhập"></c:param>
</c:import>

<!-- container foem login -->
<div class="container">
	<div class="row">
        <div class="col-md-6 col-container">
            <form name='mForm' action="<%= request.getContextPath() %>/login" method="post" id="fileForm" role="form" onsubmit="return validate()">
            <fieldset><legend class="text-center">Đăng nhập</legend>
			
			<div id="box-msg">
				<!-- <p class="msg-error">error</p> -->
				
				<% String error = (String)session.getAttribute("error");
					if(error != null){
						out.println("<p class='msg-error'>");
						out.println(error);
						out.println("</p>");
					}
				%>
			</div>
			
			<div class="form-group">
                <label for="email">Email: </label> 
                    <input class="form-control" type="text" name="femail" id = "email" value="<%= email%>"/>   
                 
            </div>

            <div class="form-group">
                <label for="password">Mật khẩu: </label>
                    <input name="fpassword" type="password" class="form-control inputpass" id="pass1" value="<%= pass%>" />

            </div>        

            <div class="form-group">
                <input class="btn btn-success" type="submit" name="submit_reg" value="Đăng nhập">
            </div>
            <div class="checkbox">
				<label><input type="checkbox" name="fremember" value="1" <%= rem.equals("1") ? "checked='checked'" : "" %>>Ghi nhớ đăng nhập</label>
			</div>          
            </fieldset>
            </form><!-- ends login form -->
        </div><!-- ends col-6 -->
	</div>
</div>

<!-- import footer -->
<c:import url="footer.jsp"/>
</body>
</html>