package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.LoginBean;
import dao.LoginDao;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getSession(true).invalidate();
		//String regexMail = "^[A-Za-z0-9]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
		//String regex = "[a-z0-9A-Z_!@#$%^&*]+";
		
		
		String userMail = request.getParameter("femail");
		String password = request.getParameter("fpassword");
		String remember = request.getParameter("fremember");
		
		LoginBean loginBean = new LoginBean();
		loginBean.setUsermail(userMail);
		loginBean.setPassword(password);
		
		HttpSession session = request.getSession(true);
		/*
		if(!userMail.matches(regexMail)) {
        	System.out.println("invalid systax");
        	session.setAttribute("error", "Email invalid systax");
        	response.sendRedirect("login.jsp");
        	
        	//RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			//rd.forward(request, response);
			return;
        }
        */
		
		LoginDao loginDao = new LoginDao();
		loginBean = loginDao.checkLogin(loginBean);
		if(loginBean.getCheck() == 1) {
			//set session
        	session.setAttribute("logAccount", loginBean);
        	
        	//save cookies
        	if(remember == null) {
        		userMail = "";
        		password = "";
        	}
        	Cookie cookieEmail = new Cookie("cEmail", userMail);
        	Cookie cookiePass = new Cookie("cPass", password);
        	Cookie cookieRemember = new Cookie("cRemember", remember);
        	response.addCookie(cookieEmail);
        	response.addCookie(cookiePass);
        	response.addCookie(cookieRemember);
        	
        	if(loginBean.getRole() == 1) {
	        	//login is valid, and redirect to index page at admin
	        	response.sendRedirect("admin/index.jsp");
        	}else {
        		response.sendRedirect("home.jsp");
        	}
			
		}else {
			System.out.println("wrong username or password");
        	session.setAttribute("error", "Email hoặc mật khẩu không đúng.");
        	response.sendRedirect("login.jsp");
		}
	}

}
