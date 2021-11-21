package context;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBContext {
	private final String serverName = "";
	private final String dbName = "";
	private final String portNumber = "";
	private final String userID = "root";
	private final String password = "12345678";
	
	public static Connection getConnection() throws Exception {
		//String url = "";
		DataSource ds = null;
		InitialContext initialContext = new InitialContext();
		Context context = (Context)initialContext.lookup("java:comp/env");
		ds = (DataSource)context.lookup("jdbc/shoppingdb");
		return ds.getConnection();
	}
}
