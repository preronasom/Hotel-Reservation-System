package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.company.util.DBUtil;

public class UserDaoImpl implements UserDao {

	@Override
	public boolean isValidUser(String username, String password) {
		 String query = "SELECT * FROM Users WHERE username = ? AND password = ? ";
		 try (Connection conn = DBUtil.getConnection(); 
         PreparedStatement stmt = conn.prepareStatement(query)){
         stmt.setString(1, username);
         stmt.setString(2, password);

         ResultSet rs = stmt.executeQuery();
			return rs.next();
			
	} catch (SQLException e) {
		e.printStackTrace();
		return false;
	}
	}

	@Override
	public boolean addUser(User user) {
		 String query = "INSERT INTO users (fullname,email,username, password) VALUES (?, ?, ?, ?)";
      //   PreparedStatement stmt = conn.prepareStatement(query);
         try (Connection conn = DBUtil.getConnection(); 
                 PreparedStatement stmt = conn.prepareStatement(query)){
        	    // stmt.setString(1, user.getRole());
                 stmt.setString(1, user.getFullname());
                 stmt.setString(2, user.getEmail());
                 stmt.setString(3, user.getUsername());
                 stmt.setString(4, user.getPassword());

                int rows = stmt.executeUpdate();
        			return rows>0;
		 
	}catch (SQLException e) {
		e.printStackTrace();
		return false;
}
	}

	@Override
	public boolean addGuests(Guests guest) {
	    String query = "INSERT INTO reservation(fullname, email, phoneno, roomtype, cin, cout, requests) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt1 = conn.prepareStatement(query)) {
         
	        stmt1.setString(1, guest.getFullname());
	        stmt1.setString(2, guest.getEmail());
	        stmt1.setString(3, guest.getPhoneno());
	        stmt1.setString(4, guest.getRoomtype());
	        stmt1.setString(5, guest.getCin());
	        stmt1.setString(6, guest.getCout());
	        stmt1.setString(7, guest.getRequests());
	        stmt1.setString(8, guest.getRoomno());

	        int rows = stmt1.executeUpdate();
			return rows>0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	}

//	@Override
//	public boolean isValidUser(String username, String password) {
//		// TODO Auto-generated method stub
//		return false;
//	}




