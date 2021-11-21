package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Orders;

public class ListOrdersDAO {

	/*lấy danh sách các đơn hàng*/
	public List<Orders> getListOrders() throws Exception{
		Connection connection = null;
		PreparedStatement stm = null;
		List<Orders> orders = new ArrayList<Orders>();
		
		connection = DBContext.getConnection();
		String sqlString = "select * from orders order by order_date desc;";
		stm = connection.prepareStatement(sqlString);
		ResultSet result = stm.executeQuery();
		
		while(result.next()) {
			int orderId = result.getInt("order_id");
			float sumPrice = sumPriceOrder(orderId, connection, stm);
			Orders order = new Orders(orderId, sumPrice, result.getInt("order_status"), result.getDate("order_date"), result.getString("order_address"), "", null, result.getString("user_mail"), null);
			
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
