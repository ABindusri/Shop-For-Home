package ecomUI.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {
private Connection con;
public AdminDao() {
	con=ConnectionDao.getConnection();

}

public boolean login(String username,String passowrd) {
	try {
	String query = "select * from admin where username=? and passowrd=?";
	PreparedStatement ps;
	ps=con.prepareStatement(query);
	ps.setString(1,username);
	ps.setString(2,passowrd);
	ResultSet rs=ps.executeQuery();
	return rs.next();
	}catch(SQLException e) {
		System.out.println(e);
		return false;
		
	}
	
}
}
