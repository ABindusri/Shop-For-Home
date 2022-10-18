package ecomUI.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDao {
	private static String username="root";
	private static String password="Bindu@123";
	private  static String driver="com.mysql.cj.jdbc.Driver";
	private  static String url="jdbc:mysql://localhost:3306/hari";
	private static Connection con=null;
	public static Connection getConnection() {
		if(con==null) {
			
		
		try {
			Class.forName(driver);
		
		con=DriverManager.getConnection(url,username,password);
		}
		catch(ClassNotFoundException e) {
			System.out.println("Driver not found");
		}
		catch(SQLException e) {
			System.out.println("Connection failed" + e);
		}
		}
		return con;
	}
	

	

}
