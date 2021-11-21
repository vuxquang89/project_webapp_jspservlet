package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.RegisterBean;
import context.DBContext;

public class RegisterDao {
	
	public static String registerUser(RegisterBean registerBean) {
		String mail = registerBean.getUsermail();
		String pass = registerBean.getPassword();
		String userName = registerBean.getUsername();
		String address = registerBean.getAddress();
		int role = registerBean.getRole();
		String phone = registerBean.getPhone();
		
		Connection connection = null;
		PreparedStatement stm = null;
		
		try {
			connection = DBContext.getConnection();
			
			if(checkEmail(mail, connection)) {
				return "Email đã được sử dụng!";
			}
			
			String sqlString = "insert into account values(?,?,?,?,?,?)";
			stm = connection.prepareStatement(sqlString);
			stm.setString(1, mail);
			stm.setString(2, pass);
			stm.setInt(3, role);
			stm.setString(4, userName);
			stm.setString(5, address);
			stm.setString(6, phone);
			
			int r = stm.executeUpdate();
			if(r != 0) {
				return "SUCCESS";
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "Không thể đăng ký!";
	}
	
	public static boolean checkEmail(String email, Connection connection) {
		Connection connec = connection;
		PreparedStatement stm = null;
		String sql = "select count(*) as count from account where user_mail = ?";
		try {
			stm = connec.prepareStatement(sql);
			stm.setString(1, email);
			ResultSet resultSet = stm.executeQuery();
			int res = 0;
			if(resultSet.next()) {
				res = resultSet.getInt("count");
				
			}
			
			resultSet.close();
			
			if(res != 0) {
				return true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return false;
	}
}
