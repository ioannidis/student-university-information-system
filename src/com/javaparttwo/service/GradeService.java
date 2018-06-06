package com.javaparttwo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import com.javaparttwo.model.Course;
import com.javaparttwo.model.Grade;

public class GradeService {
	
	 /**
     * An instance of the database connection.
     */
    private DataSource ds;

    /**
     * Initializes login service.
     * 
     * @param ds
     *            The data source instance.
     */
    public GradeService(DataSource ds) {
    	this.ds = ds;
    }
    
    public Grade getGrade(String stdId, String courseId) {
    	Connection con = null;
    	ResultSet rs = null;
    	PreparedStatement stmt = null;

    	String str = "(SELECT * FROM javapart2.grades RIGHT JOIN javapart2.courses ON javapart2.grades.course_id = javapart2.courses.id WHERE student_id=? AND course_id=?)";

    	try {
    	    con = ds.getConnection();

    	    stmt = con.prepareStatement(str);
    	    stmt.setString(1, stdId);
    	    stmt.setString(2, courseId);

    	    rs = stmt.executeQuery();
    	    
    	    if (rs.next()) {
	    		return new Grade(rs.getString("id"), rs.getString("title"), rs.getInt("ects"),
	    			rs.getInt("teaching_hours"), rs.getString("instructor_username"), rs.getInt("grade"), rs.getInt("semester"), rs.getString("department_id"));
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

    	return null;
    }
    
    public List<Grade> getGradesByList(String stdId, String departmentId) {
    	Connection con = null;
    	ResultSet rs = null;
    	PreparedStatement stmt = null;
    	
    	List<Grade> grades = new ArrayList<>();

    	String str = "SELECT * FROM javapart2.grades RIGHT JOIN javapart2.courses ON javapart2.grades.course_id = javapart2.courses.id WHERE (student_id=? OR student_id IS NULL) AND javapart2.courses.department_id=? ORDER BY javapart2.courses.title";

    	try {
    	    con = ds.getConnection();

    	    stmt = con.prepareStatement(str);
    	    stmt.setString(1, stdId);
    	    stmt.setString(2, departmentId);

    	    rs = stmt.executeQuery();
    	    
    	    int grade;
    	    while (rs.next()) {
    	    	    grade = (rs.getObject("grade") != null) ? rs.getInt("grade") : -1;
    	    	    grades.add(new Grade(rs.getString("id"), rs.getString("title"), rs.getInt("ects"),
    	    	    		rs.getInt("teaching_hours"), rs.getString("instructor_username"), grade, rs.getInt("semester"), rs.getString("department_id")));
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
    	
    	return grades;
    }
    
    
    public List<Grade> getGradesBySemester(String stdId, String departmentId) {
    	Connection con = null;
    	ResultSet rs = null;
    	PreparedStatement stmt = null;
    	
    	List<Grade> grades = new ArrayList<>();

    	String str = "SELECT * FROM javapart2.grades RIGHT JOIN javapart2.courses ON javapart2.grades.course_id = javapart2.courses.id WHERE (student_id=? OR student_id IS NULL) AND javapart2.courses.department_id=? ORDER BY javapart2.courses.semester, javapart2.courses.title";

    	try {
    	    con = ds.getConnection();

    	    stmt = con.prepareStatement(str);
    	    stmt.setString(1, stdId);
    	    stmt.setString(2, departmentId);

    	    rs = stmt.executeQuery();
    	    
    	    int grade;
    	    while (rs.next()) {
    	    	    grade = (rs.getObject("grade") != null) ? rs.getInt("grade") : -1;
    	    	    grades.add(new Grade(rs.getString("id"), rs.getString("title"), rs.getInt("ects"),
    	    	    		rs.getInt("teaching_hours"), rs.getString("instructor_username"), grade, rs.getInt("semester"), rs.getString("department_id")));
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
    	
    	return grades;
    }

}
