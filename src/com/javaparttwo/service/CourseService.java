package com.javaparttwo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.javaparttwo.model.Course;

/**
 * Handles all course database interactions.
 */
public class CourseService {

    /**
     * An instance of the database connection.
     */
    private DataSource ds;

    /**
     * Initializes course service.
     * 
     * @param ds
     *            The data source instance.
     */
    public CourseService(DataSource ds) {
	this.ds = ds;
    }

    /**
     * Returns the list of registered courses.
     * 
     * @return The list of courses.
     */
    public List<Course> getCourses() {
	List<Course> courses = new ArrayList<>();

	Connection con = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;

	String str = "SELECT * FROM javapart2.courses";

	try {
	    con = ds.getConnection();

	    stmt = con.prepareStatement(str);

	    rs = stmt.executeQuery();

	    while (rs.next()) {
		courses.add(new Course(rs.getString("id"), rs.getString("title"), rs.getInt("ects"),
			rs.getInt("teaching_hours"), rs.getString("instructor_username"), rs.getInt("semester"), rs.getString("department_id")));
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

	return courses;
    }

    /**
     * Returns a specific course by that ID.
     * 
     * @param id
     *            The ID of the target course.
     * @return The course that was found or null.
     */
    public Course getCourse(String id) {
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;

	String str = "SELECT * FROM javapart2.courses WHERE id=?";

	try {
	    con = ds.getConnection();

	    stmt = con.prepareStatement(str);
	    stmt.setString(1, id);

	    rs = stmt.executeQuery();

	    if (rs.next()) {
		return new Course(rs.getString("id"), rs.getString("title"), rs.getInt("ects"),
			rs.getInt("teaching_hours"), rs.getString("instructor_username"), rs.getInt("semester"), rs.getString("department_id"));
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

    /**
     * Updates the details of a course by that ID.
     * 
     * @param id
     *            The ID of the target course.
     * @param title
     *            The new title of the course.
     * @param ects
     *            The new ECTs of the course.
     * @param teachingHours
     *            The new teaching hours of the course.
     * @param instructorUsername
     *            The new instructor name of the course.
     */
    public void editCourse(String id, String title, String ects, String teachingHours, String instructorUsername) {
	Connection con = null;
	PreparedStatement stmt = null;

	String str = "UPDATE javapart2.courses " + "SET title=?, ects=?, teaching_hours=?, instructor_username=? "
		+ "WHERE id=?";
	try {
	    con = ds.getConnection();
	    stmt = con.prepareStatement(str);
	    stmt.setString(1, title);
	    stmt.setString(2, ects);
	    stmt.setString(3, teachingHours);
	    stmt.setString(4, instructorUsername);
	    stmt.setString(5, id);
	    stmt.executeUpdate();
	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    try {
		stmt.close();
		con.close();
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
    }

    /**
     * Deletes a course by that ID.
     * 
     * @param id
     *            The ID of the target course.
     * @return The course that was deleted.
     */
    public Course deleteCourse(String id) {
	Connection con = null;
	PreparedStatement stmt = null;

	String str = "DELETE FROM javapart2.courses WHERE id=?";

	try {
	    con = ds.getConnection();

	    stmt = con.prepareStatement(str);
	    stmt.setString(1, id);

	    stmt.executeUpdate();

	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    try {
		stmt.close();
		con.close();
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}

	return null;
    }
}
