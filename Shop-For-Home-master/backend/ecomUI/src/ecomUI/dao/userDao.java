
	package ecomUI.dao;

	import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.user;

	public class userDao  {
	private Connection con;
	public userDao() {
		con=ConnectionDao.getConnection();

	}

	public String login(String username,String passowrd) {
		try {
		String query = "select username from user where username=? and passowrd=?";
		PreparedStatement ps;
		ps=con.prepareStatement(query);
		ps.setString(1,username);
		ps.setString(2,passowrd);
		ResultSet rs=ps.executeQuery();
		if(rs.next()==true){
			
			return rs.getString(1);
		}
		else {
			return null;
		}
		}catch(SQLException e) {
			System.out.println(e);
			return null;
			
		}
		
		
	}
	public boolean signup(user Bindu) {
		try {
		String query="insert into user (username,passowrd,mobile) values (?,?,?)";
		PreparedStatement ps;
		ps=con.prepareStatement(query);
		ps.setString(1,Bindu.getUsername());
		ps.setString(2,Bindu.getPassowrd());
		
			ps.setInt(3,Bindu.getMobile());
			int n=ps.executeUpdate();
			if(n==0) {
				return false;
			}
			else {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
			
		}
           
	}	
	
	}


