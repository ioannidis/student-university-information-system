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
     * @param ds The data source instance.
     */
    public CourseService(DataSource ds) {
        this.ds = ds;
    }

    /**
     * Adds a new course to the database.
     * 
     * @param id The id of this course.
     * @param title The title of this course.
     * @param semester The semester in which this course belongs to.
     * @param ects The ETCS of this course.
     * @param teachingHours The teaching hours of this course.
     * @param instructorUsername The instructor of this course.
     * @param departmentId The department in which the course belongs to.
     */
    public void addCourse(String id, String title, String semester, String ects,
            String teachingHours, String instructorUsername, String departmentId) {
        Connection con = null;
        PreparedStatement stmt = null;

        String str = "INSERT INTO javapart3.courses VALUES (?,?,?,?,?,?,?)";

        try {
            con = ds.getConnection();

            stmt = con.prepareStatement(str);
            stmt.setString(1, id);
            stmt.setString(2, title);
            stmt.setString(3, ects);
            stmt.setString(4, teachingHours);
            stmt.setString(5, instructorUsername);
            stmt.setString(6, semester);
            stmt.setString(7, departmentId);

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

        return;
    }

    /**
     * Returns the list of courses for the department.
     * 
     * @param departmentId The department of the courses.
     * @return The list of courses for the department.
     */
    public List<Course> getCourses(String departmentId) {
        List<Course> courses = new ArrayList<>();

        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;

        String str =
                "SELECT c.id, c.title, c.ects, c.teaching_hours, u.first_name, u.last_name, c.semester, c.department_id "
                        + "FROM javapart3.courses AS c "
                        + "INNER JOIN javapart3.users AS u "
                        + "ON c.instructor_username = u.username "
                        + "WHERE c.department_id=?";

        try {
            con = ds.getConnection();

            stmt = con.prepareStatement(str);
            stmt.setString(1, departmentId);

            rs = stmt.executeQuery();

            String fullname;

            while (rs.next()) {
                fullname = rs.getString("first_name") + " " + rs.getString("last_name");
                courses.add(new Course(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getInt("ects"),
                        rs.getInt("teaching_hours"),
                        fullname,
                        rs.getInt("semester"),
                        rs.getString("department_id")));
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
     * @param id The ID of the target course.
     * @return The course that was found or null.
     */
    public Course getCourse(String id) {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;

        String str =
                "SELECT c.id, c.title, c.ects, c.teaching_hours, c.instructor_username, c.semester, c.department_id, u.first_name, u.last_name FROM javapart3.courses AS c "
                        + "INNER JOIN javapart3.users AS u ON c.instructor_username = u.username "
                        + "WHERE c.id=?";

        try {
            con = ds.getConnection();

            stmt = con.prepareStatement(str);
            stmt.setString(1, id);

            rs = stmt.executeQuery();

            if (rs.next()) {
                return new Course(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getInt("ects"),
                        rs.getInt("teaching_hours"),
                        rs.getString("instructor_username"),
                        rs.getInt("semester"),
                        rs.getString("department_id"));
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
     * @param id The ID of the target course.
     * @param title The new title of the course.
     * @param ects The new ECTs of the course.
     * @param teachingHours The new teaching hours of the course.
     * @param instructorUsername The new instructor name of the course.
     */
    public void editCourse(String id, String title, String ects, String teachingHours,
            String instructorUsername) {
        Connection con = null;
        PreparedStatement stmt = null;

        String str = "UPDATE javapart3.courses "
                + "SET title=?, ects=?, teaching_hours=?, instructor_username=? " + "WHERE id=?";
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
     * @param id The ID of the target course.
     * @return The course that was deleted.
     */
    public Course deleteCourse(String id) {
        Connection con = null;
        PreparedStatement stmt = null;

        String str = "DELETE FROM javapart3.courses WHERE id=?";

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
