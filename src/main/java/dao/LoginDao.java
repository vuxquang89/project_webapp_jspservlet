package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.LoginBean;
import context.DBContext;

public class LoginDao {

	public LoginDao() {}
	
	public LoginBean checkLogin(LoginBean loginBean) {
		String userMail = loginBean.getUsermail();
		String password = loginBean.getPassword();
		
		Connection connection = null;
		
		try {
			connection = DBContext.getConnection();
			String sql = "select * from account where user_mail=? and password=?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, userMail);
			stmt.setString(2, password);
			
			ResultSet resultSet = stmt.executeQuery();
			String mail = "", pass = "";
			while(resultSet.next()) {
				mail = resultSet.getString("user_mail");
				pass = resultSet.getString("password");
				
				if(userMail.equals(mail) && password.equals(pass)) {
					loginBean.setUsermail(userMail);
					loginBean.setUsername(resultSet.getString("user_name"));
					loginBean.setRole(resultSet.getInt("account_role"));
					loginBean.setAddress(resultSet.getString("user_address"));
					loginBean.setPhone(resultSet.getString("user_phone"));
					loginBean.setCheck(1);
					return loginBean;
				}
			}
			
			stmt.close();
			connection.close();			
			
		} catch (Exception e) {			
			e.printStackTrace();			
		}
		
		loginBean.setCheck(0);
		return loginBean;
	}
}
