<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style-admin.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/js/action.js"></script>
<title>Login</title>
</head>
<body>

<%
String user = "", pass = "", rem = "";
Cookie[] cookies = request.getCookies();
for(Cookie cookie:cookies){
	if(cookie.getName().equals("cUser")){
		user = cookie.getValue();
	}else if(cookie.getName().equals("cPass")){
		pass = cookie.getValue();
	}else if(cookie.getName().equals("cRemember")){
		rem = cookie.getValue();
		System.out.println(rem);
	}
}
%>

<div class="form-login">
	<div class="form-login-top">
		<div class="box-img">
			<div class="avatar"></div>
		</div>
		<!-- 
		<p class="x-close">X</p>
		 -->
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
	</div>
	<div class="form-login-body">
		<form name="mForm" action="<%= request.getContextPath() %>/login" onsubmit="return validate()" method="post">
			<div class="form-group">
				<label for="user">Email</label>
				<input type="text" class="form-control" id="user" name="fuser" placeholder="Enter your email" value="<%= user%>">
			</div>	
			<div class="form-group">
				<label for="pass">Password</label>
				<input type="password" class="form-control" id="pass" name="fpass" placeholder="Enter your password" value="<%= pass%>">
			</div>	
			<button type="submit" class="btn btn-success btn-block">Login</button>
			<div class="checkbox">
				<label><input type="checkbox" name="fremember" value="1" <%= rem.equals("1") ? "checked='checked'" : "" %>>Remember me</label>
			</div>		
		</form>
		<p>Forgot your <a href="#">password?</a></p>
	</div>
	<!-- 
	<div class="form-login-bottom">
		<div class="div-left">
			<input type="button" class="btn btn-danger" value="Cancel">
		</div>
		<div class="div-right">
			<p>Forgot your <a href="#">password?</a></p>
		</div>
	</div>
	 -->
</div>
</body>
</html>