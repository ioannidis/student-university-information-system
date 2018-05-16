package com.javaparttwo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.sql.DataSource;

import com.javaparttwo.model.User;

public class LoginService {

	private DataSource ds;
	
	public LoginService(DataSource ds) {
		this.ds = ds;
	}
	
	public User auth(String username, String password) {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		String str = "SELECT * FROM javapart2.users WHERE username=? AND password=?";

		try {
			con = ds.getConnection();
			
			stmt = con.prepareStatement(str);
			stmt.setString(1, username);
			stmt.setString(2, password);
			
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				return new User(rs.getString("username"), 
						null, 
						rs.getString("first_name"),
						rs.getString("last_name"),
						rs.getInt("phone_number"),
						rs.getString("email"),
						rs.getString("role_id"));
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				stmt.close();
	            con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
		
	}

}
