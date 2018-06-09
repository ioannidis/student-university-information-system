package com.javaparttwo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.javaparttwo.model.Course;

public class DepartmentService {
	
	/**
     * An instance of the database connection.
     */
    private DataSource ds;

	public DepartmentService(DataSource ds) {
		this.ds = ds;
	}
	
	public String getDepartment(String departmentId) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		String department = null;

		String str = "SELECT * FROM javapart2.departments WHERE id=?";

		try {
		    con = ds.getConnection();

		    stmt = con.prepareStatement(str);
		    stmt.setString(1, departmentId);


		    rs = stmt.executeQuery();

		    while (rs.next()) {
		    	department = rs.getString("title");
		    }

		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    try {
			rs.close();
			stmt.close();
			con.close();
		    } catch (SQLException e) {
			e.printStackTrace();
		    }

		}

		return department;
	}

}
