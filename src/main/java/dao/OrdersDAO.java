package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import context.DBContext;
import model.Cart;
import model.Orders;
import model.Product;

public class OrdersDAO {
	/*lưu thông tin mua hàng vào trogn database*/
	public void insertOder(Orders o, Cart cart) throws Exception{
		Connection connection = null;
		PreparedStatement stm = null;
		
		connection = DBContext.getConnection();
		int orderId = (int)(new Date().getTime()/1000);/*tạo mã đơn hàng*/
		String sqlString = "insert into orders(user_mail,order_id, order_status, order_discount_code, order_address, order_note) value(?,?,?,?,?,?)";
		stm = connection.prepareStatement(sqlString);
		stm.setString(1, o.getUserMail());
		stm.setInt(2, orderId);
		stm.setInt(3, o.getStatus());
		stm.setString(4, o.getDiscount());
		stm.setString(5, o.getAddress());
		stm.setNString(6, o.getNote());
		
		int r = stm.executeUpdate();
		if(r!=0) {
			
			sqlString = "insert into orders_detail value(?,?,?,?)";
			for(Product product : cart.getItems()) {
				stm = connection.prepareStatement(sqlString);
				stm.setInt(1, orderId);
				stm.setInt(2, product.getId());
				stm.setInt(3, product.getNumber());
				stm.setDouble(4, product.getPrice());
				stm.executeUpdate();
			}
			
			
		}else {
			System.out.println("Error");
		}
	}
}
