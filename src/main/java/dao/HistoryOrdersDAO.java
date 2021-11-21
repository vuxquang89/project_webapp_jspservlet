package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Orders;
import model.ProductOrders;

public class HistoryOrdersDAO {
	
	/* lấy danh sách các hóa đơn theo usermail*/
	public List<Orders> listOrders(String usermail) throws Exception{
		Connection connection = null;
		PreparedStatement stm = null;
		List<Orders> orders = new ArrayList<Orders>();
		
		connection = DBContext.getConnection();
		String sqlString = "select o.order_id,o.user_mail, o.order_status, o.order_address, ac.user_phone, o.order_date from account as ac, orders as o where ac.user_mail = o.user_mail and o.user_mail = ?";
		stm = connection.prepareStatement(sqlString);
		stm.setString(1, usermail);
		ResultSet result = stm.executeQuery();
		
		while(result.next()) {
			int orderId = result.getInt("order_id");
			float sumPrice = sumPriceOrder(orderId, connection, stm);
			Orders order = new Orders(orderId, sumPrice, result.getInt("order_status"), result.getDate("order_date"), result.getString("order_address"), result.getString("user_phone"), null, usermail, null);
			/*lấy các sản phẩm có trong hóa đơn tương ứng*/
			sqlString = "select * from products as p, orders_detail as od where od.product_id = p.product_id and od.order_id = ?";
			stm = connection.prepareStatement(sqlString);
			stm.setInt(1, orderId);
			ResultSet res = stm.executeQuery();
			List<ProductOrders> lp = new ArrayList<ProductOrders>();
			while (res.next()) {
				ProductOrders productOrders = new ProductOrders(orderId, res.getInt("product_id"), res.getInt("amount_product"), res.getString("product_name"), res.getString("product_img_source"));
				lp.add(productOrders);
			}
			res.close();
			order.setLp(lp);
			orders.add(order);
			
		}
		
		result.close();
		
		return orders;
	}
	
	/*lấy tổng giá trị của một hóa đơn*/
	public float sumPriceOrder(int orderId, Connection connection, PreparedStatement stm) throws Exception {
		String sqlString = "select sum(price_product*amount_product) as sumprice from orders_detail where order_id = ? group by order_id";
		stm = connection.prepareStatement(sqlString);
		stm.setInt(1, orderId);
		ResultSet result = stm.executeQuery();
		float sumPrice = 0;
		while (result.next()) {
			sumPrice = result.getFloat("sumprice");			
		}
		result.close();
		return sumPrice;
	}
	
	
}
