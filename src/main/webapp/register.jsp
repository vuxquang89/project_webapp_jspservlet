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

<script type="text/javascript" src="<%= request.getContextPath() %>/assets/js/action_register.js"></script>

<title>Đăng ký</title>
</head>
<body>
<!-- header -->
<c:import url="header-logo.jsp">
	<c:param name="headerTitle" value="Đăng ký"></c:param>
</c:import>
<div class="container">
	<div class="row">
        <div class="col-md-6 col-container">
            <form action="<%= request.getContextPath() %>/register" method="post" id="fileForm" role="form" onsubmit="return validate()">
            <fieldset><legend class="text-center">Đăng ký</legend>
			
			<div id="box-msg">
				<!-- <p class="msg-error">error</p> -->
				
				<% String error = (String)request.getAttribute("error");
					if(error != null){
						out.println("<p class='msg-error'>");
						out.println(error);
						out.println("</p>");
					}
				%>
			</div>
			
			<div class="form-group">
                <label for="email"><span class="req">* </span> Email: <small>Email được sử dụng để đăng nhập</small> </label> 
                    <input class="form-control" required type="text" name="email" id = "email"  onchange="email_validate(this.value);" />   
                        <div class="status" id="status"></div>
            </div>

            <div class="form-group">
                <label for="username"><span class="req">* </span> Họ tên:  </label> 
                    <input class="form-control" type="text" name="username" id = "txt" onkeyup = "Validate(this)" placeholder="tối thiểu 6 chữ cái" required />  
                        <div id="errLast"></div>
            </div>

            <div class="form-group">
                <label for="password"><span class="req">* </span> Mật khẩu: </label>
                    <input required name="password" type="password" class="form-control inputpass" minlength="4" maxlength="16"  id="pass1" /> </p>

                <label for="password"><span class="req">* </span> Nhập lại mật khẩu: </label>
                    <input required name="password" type="password" class="form-control inputpass" minlength="4" maxlength="16" placeholder="nhập lại để xác thực"  id="pass2" onkeyup="checkPass(); return false;" />
                        <span id="confirmMessage" class="confirmMessage"></span>
            </div>
            
            <div class="form-group">
            <label for="phonenumber"><span class="req">* </span> Số điện thoại: </label>
                    <input required type="text" name="phonenumber" id="phone" class="form-control phone" maxlength="28" onkeyup="validatephone(this);" /> 
            </div>   
            
            <div class="form-group">
            <label for="address"><span class="req">* </span> Địa chỉ: </label>
                    <input required type="text" name="address" id="address" class="form-control"/> 
            </div>         

            <div class="form-group">
                <input class="btn btn-success" type="submit" name="submit_reg" value="Đăng ký">
            </div>
                      
            </fieldset>
            </form><!-- ends register form -->
        </div><!-- ends col-6 -->
	</div>
</div>

<c:import url="footer.jsp"/>
</body>
</html>