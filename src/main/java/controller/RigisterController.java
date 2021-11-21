package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.RegisterBean;
import dao.RegisterDao;

/**
 * Servlet implementation class RigisterController
 */
public class RigisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RigisterController() {
        super();
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phonenumber");
		
		String address = request.getParameter("address");
		int role = 2;
		
		RegisterBean registerBean = new RegisterBean(email, password, username, address, phone, role);
		String res = RegisterDao.registerUser(registerBean);
		if(res.equals("SUCCESS")) {
			
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}else {
			
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			request.setAttribute("error", res);
			rd.forward(request, response);
			
		}
	}

}
