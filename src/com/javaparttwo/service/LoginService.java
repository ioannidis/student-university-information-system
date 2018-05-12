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
	
	public User auth(String username, String password) {
		
		PreparedStatement stmt = null;
		
		String str = "SELECT * FROM javapart2.users WHERE username=? AND password=?";

		try {
			Connection con = ds.getConnection();
			
			stmt = con.prepareStatement(str);
			stmt.setString(1, username);
			stmt.setString(2, password);
			
			ResultSet rs = stmt.executeQuery();
			
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}

	public void setResourse(DataSource ds) {
		this.ds = ds;
	}

}
