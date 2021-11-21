package controller;

import java.io.IOException;

import bean.LoginBean;
import dao.OrdersDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Orders;

/**
 * Servlet implementation class PayController
 */
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayController() {
        super();
        
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			HttpSession session = request.getSession(true);
			String note = request.getParameter("shipping[note]");
			
			OrdersDAO oDao = new OrdersDAO();
			Cart cart = (Cart)session.getAttribute("cart");
			LoginBean login = (LoginBean)session.getAttribute("logAccount");
			Orders order = new Orders(login.getUsermail(),2, "", login.getAddress(), login.getPhone(), null, note);
			oDao.insertOder(order, cart);//lưu thông tin đựt hàng
			session.removeAttribute("cart");//xóa giỏ hàng khỏi session
			response.sendRedirect("home.jsp");
		}catch(Exception ex) {
			response.getWriter().println(ex);
			ex.printStackTrace();
		}
	}

}
