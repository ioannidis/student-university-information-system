package com.javaparttwo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.javaparttwo.model.Course;

public class CourseService {

	private DataSource ds;
	
	public CourseService(DataSource ds) {
		this.ds = ds;
		System.out.println(this.ds);
	}
	
	public List<Course> getCourses() {
		List<Course> courses = new ArrayList<>();
		
		PreparedStatement stmt = null;
		
		String str = "SELECT * FROM javapart2.courses";
		
		try {
			Connection con = ds.getConnection();
			
			stmt = con.prepareStatement(str);
			
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				courses.add(new Course(rs.getString("id"),
						rs.getString("title"),
						rs.getInt("ects"),
						rs.getInt("teaching_hours"),
						rs.getString("instructor_username")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return courses;
	}
}
