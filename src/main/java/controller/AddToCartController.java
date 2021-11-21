package controller;

import java.io.IOException;

import dao.ListProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Product;

/**
 * Servlet implementation class AddToCartController
 */
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartController() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		int quantity = 1;
		if(action != null && action.equalsIgnoreCase("add")) {
			if(session.getAttribute("cart") == null) {
				session.setAttribute("cart", new Cart());
			}
			int productId = Integer.parseInt(id);
			Product p = new ListProductDao().getProduct(productId);
			Cart cart = (Cart)session.getAttribute("cart");
			cart.add(new Product(p.getId(), p.getName(), p.getDescription(), p.getPrice(), p.getSrc(), p.getType(), p.getBrand(), quantity));
		}else if(action != null && action.equalsIgnoreCase("delete")) {
			int productId = Integer.parseInt("id");
			Cart cart = (Cart)session.getAttribute("cart");
			cart.remove(productId);
		}
		
		response.sendRedirect("cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		
		if(action != null && action.equalsIgnoreCase("update")) {
			int productId = Integer.parseInt(id);
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			Product p = new ListProductDao().getProduct(productId);
			if(p != null) {
				Cart cart = (Cart)session.getAttribute("cart");
				cart.updateQuantity(p, quantity);
			}
			response.getWriter().print("OK");
		}else if(action != null && action.equalsIgnoreCase("delete")) {
			int productId = Integer.parseInt(id);
			Product p = new ListProductDao().getProduct(productId);
			if(p != null) {
				Cart cart = (Cart)session.getAttribute("cart");
				cart.remove(productId);
			}
			response.getWriter().print("OK");
		}
	}

}
